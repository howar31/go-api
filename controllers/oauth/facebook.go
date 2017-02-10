package oauth

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"

	"twreporter.org/go-api/configs"

	log "github.com/Sirupsen/logrus"
	"github.com/gin-gonic/gin"

	"golang.org/x/oauth2"
	"golang.org/x/oauth2/facebook"
)

var cfg = configs.GetConfig()

var (
	oauthConf = &oauth2.Config{
		ClientID:     cfg.OAUTH.FACEBOOK.ID,
		ClientSecret: cfg.OAUTH.FACEBOOK.Secret,
		RedirectURL:  cfg.OAUTH.FACEBOOK.URL,
		Scopes:       []string{"public_profile"},
		Endpoint:     facebook.Endpoint,
	}
	oauthStateString = cfg.OAUTH.FACEBOOK.Statestr
	loginPath        = cfg.APP.Path + "/login"
)

// Facebook ...
type Facebook struct{}

// BeginAuth ...
func (o Facebook) BeginAuth(c *gin.Context) {
	URL, err := url.Parse(oauthConf.Endpoint.AuthURL)
	if err != nil {
		log.Error("Parse: ", err)
	}
	parameters := url.Values{}
	parameters.Add("client_id", oauthConf.ClientID)
	parameters.Add("scope", strings.Join(oauthConf.Scopes, " "))
	parameters.Add("redirect_uri", oauthConf.RedirectURL)
	parameters.Add("response_type", "code")
	parameters.Add("state", oauthStateString)
	URL.RawQuery = parameters.Encode()
	url := URL.String()
	http.Redirect(c.Writer, c.Request, url, http.StatusTemporaryRedirect)
}

// Authenticate ...
func (o Facebook) Authenticate(c *gin.Context) {
	r := c.Request
	w := c.Writer

	log.WithFields(log.Fields{
		"type": "Facebook",
	}).Info("OAuth")

	state := r.FormValue("state")
	if state != oauthStateString {
		log.Warn("invalid oauth state, expected '%s', got '%s'\n", oauthStateString, state)
		http.Redirect(w, r, loginPath, http.StatusTemporaryRedirect)
		return
	}

	code := r.FormValue("code")

	token, err := oauthConf.Exchange(oauth2.NoContext, code)
	if err != nil {
		log.Warn("oauthConf.Exchange() failed with '%s'\n", err)
		http.Redirect(w, r, loginPath, http.StatusTemporaryRedirect)
		return
	}

	resp, err := http.Get("https://graph.facebook.com/me?access_token=" +
		url.QueryEscape(token.AccessToken))
	if err != nil {
		log.Warn("Get: %s\n", err)
		http.Redirect(w, r, loginPath, http.StatusTemporaryRedirect)
		return
	}
	defer resp.Body.Close()

	response, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("ReadAll: %s\n", err)
		http.Redirect(w, r, loginPath, http.StatusTemporaryRedirect)
		return
	}

	log.Info("parseResponseBody: %s\n", string(response))
}