package utils

import (
	"github.com/jinzhu/gorm"
)

// ErrRecordNotFound record not found error, happens when haven't find any matched data when looking up with a struct
var ErrRecordNotFound = gorm.ErrRecordNotFound