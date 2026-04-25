#!/bin/bash
# Sets the canonical domain across all meta tags.
# Usage:  bash set-domain.sh tippingpoint.media
#         bash set-domain.sh username.github.io/the-loudening
#         bash set-domain.sh loudening.pirix.media

if [ -z "$1" ]; then
  echo "Usage: bash set-domain.sh your-domain.com"
  echo "  or:  bash set-domain.sh username.github.io/the-loudening"
  exit 1
fi

DOMAIN="$1"
echo "Setting canonical domain to: $DOMAIN"

# Cross-platform sed (works on macOS and Linux)
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|REPLACE-WITH-YOUR-DOMAIN|$DOMAIN|g" index.html
else
  sed -i "s|REPLACE-WITH-YOUR-DOMAIN|$DOMAIN|g" index.html
fi

echo "Done. All meta tags now point to: https://$DOMAIN/the-loudening/"
echo ""
echo "Verify with:"
echo "  grep 'og:url\\|canonical\\|og:image' index.html"
