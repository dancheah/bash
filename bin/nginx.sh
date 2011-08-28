#!/bin/sh -xv

# Read
# http://wiki.nginx.org/NginxCommandLine
# Lots of useful information for starting up nginx

mkdir -p /Users/dc/.var/nginx/logs/
/usr/local/sbin/nginx -p /Users/dc/.var/nginx/  -c ~/.dotfiles/nginx/nginx.conf
