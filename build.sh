#!/bin/bash
set -e

# Default to PHP 8.3 if no version specified
PHP_VERSION=${1:-8.3}

echo "Building php-mecab with PHP $PHP_VERSION..."

# Build the Docker image
docker build --build-arg PHP_VERSION=$PHP_VERSION -t php-mecab:$PHP_VERSION .

echo ""
echo "Build complete! Run tests with:"
echo "  docker run --rm php-mecab:$PHP_VERSION"
echo ""
echo "Or get a shell with:"
echo "  docker run --rm -it php-mecab:$PHP_VERSION bash"
echo ""
echo "To test all PHP versions with docker-compose:"
echo "  docker-compose up"
