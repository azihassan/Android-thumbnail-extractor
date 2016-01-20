#Android thumbnail extractor

Small utility that extracts the thumbnail images from Android's imgcache files. I wrote this after realizing that imgcache files only contain a bunch of JPGs glued together.

This tool is useful if you accidently delete a picture after viewing it. The recovered image is only a 267x200 thumbnail but sometimes even that is enough. The DCIM/.thumbnails directory contains a few thumbnails as well, so you might want to look in there in case this utility doesn't find the picture you wanted.

#Compiling

Since this is just one file, all you need to do is to download dmd and run the `dmd extract.d` command.

#Executing

Run it with no arguments to display the usage.
