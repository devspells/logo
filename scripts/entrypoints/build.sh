# !/bin/bash

echo ==========================================================================
echo remove dist dir
echo
rm -rf dist;

echo ==========================================================================
echo create minifid svg files
echo
npx svgo -f src/ -o dist/

echo ==========================================================================
echo create png files
echo
inkscape -z -e dist/logo-circle.png -w 300 -h 300 dist/logo-circle.svg;
inkscape -z -e dist/logo-dark.png -w 630 -h 145 dist/logo-dark.svg;
inkscape -z -e dist/logo-light.png -w 630 -h 145 dist/logo-light.svg;

echo ==========================================================================
echo minify png
echo
optipng -force -o7 -strip all dist/*.png;

echo ==========================================================================
echo create ico
echo
convert \
  -resize x16 -gravity center -crop 16x16+0+0 \
  dist/logo-circle.png -flatten -colors 256 -background transparent \
  dist/favicon.ico;
