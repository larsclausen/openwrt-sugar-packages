#!/bin/sh
mkdir -p /etc/pango
pango-querymodules > /etc/pango/pango.modules
mkdir -p /etc/gtk-2.0/
gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
