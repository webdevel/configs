#!/bin/sh

if test ! -d /run/media/steve/cdrom; then

  mkdir -vp /run/media/steve/cdrom
  chown -vR steve:steve /run/media/steve

fi
