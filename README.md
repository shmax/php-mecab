# php-mecab: MeCab binding for PHP

[![CI](https://github.com/shmax/php-mecab/actions/workflows/ci.yml/badge.svg)](https://github.com/shmax/php-mecab/actions/workflows/ci.yml)

A PHP extension providing bindings to the [MeCab](https://taku910.github.io/mecab/) morphological analyzer, commonly used for Japanese text segmentation and part-of-speech tagging.

## About This Fork

This is a modernized fork of [rsky/php-mecab](https://github.com/rsky/php-mecab), updated for **PHP 8.0+** only. The original project supported PHP 5.3+ and provided both procedural and object-oriented APIs.

### What's Different

**PHP 8.0+ Only**: This fork drops all support for PHP 5.x and 7.x, simplifying the codebase and allowing for modern PHP features.

**Breaking Changes**:
- Minimum PHP version is now **8.0.0** (previously 5.3.0)
- Removed PHP 5.x and 7.x implementations
- Removed the procedural API (`mecab_*` functions) which was deprecated in PHP 7.0
- Only the modern OOP API (`MeCab\*` namespace) is supported

**What Still Works**: All core functionality for Japanese morphological analysis is intact:
- `new MeCab\Tagger()` - Create a MeCab tagger instance
- `MeCab\Node` and `MeCab\NodeIterator` - Parse results and node traversal
- `MeCab\Path` - Lattice path information
- `MeCab\split()` - Simple word segmentation
- `MeCab\version()` - Get MeCab library version

## Requirements

- PHP 8.0, 8.1, 8.2, 8.3, or 8.4
- MeCab library 0.99 or later
- MeCab dictionary (e.g., mecab-ipadic-utf8)

## Installation

### Standard Installation

```bash
cd mecab
phpize
./configure --with-mecab
make
make test
sudo make install
```

### Optional Configure Arguments

- `--with-mecab=/path/to/mecab-config` - Specify the path to mecab-config
- For developers: `CFLAGS="-Wall -Wextra -Wno-unused-parameter" ./configure`

### Docker-based Testing

This repository includes Docker support for testing across multiple PHP versions:

```bash
# Test with PHP 8.3
docker build --build-arg PHP_VERSION=8.3 -t php-mecab:8.3 .
docker run --rm php-mecab:8.3

# Test all versions at once
docker-compose up

# Or use the convenience script
bash build.sh 8.3
```

## Usage Example

```php
<?php
// Create a tagger instance
$mecab = new MeCab\Tagger();

// Parse Japanese text
$text = "太郎は花子が好きです。";
$nodes = $mecab->parseToNode($text);

// Iterate through morphemes
foreach ($nodes as $node) {
    echo $node->getSurface() . "\t" . $node->getFeature() . "\n";
}

// Simple word segmentation
$words = MeCab\split($text);
print_r($words);
```

## CI/CD

This project uses GitHub Actions to test the extension against PHP 8.0, 8.1, 8.2, 8.3, and 8.4 on every push and pull request.

## Project History

- **Original**: [rsky/php-mecab](https://github.com/rsky/php-mecab) by Ryusuke SEKIYAMA
  - Supported PHP 5.3 - 7.x
  - Provided both procedural and OOP APIs
  - Last updated 2015

- **This Fork**: Modernized for PHP 8+ only
  - Removed legacy code and APIs
  - Added Docker and CI/CD support
  - Simplified codebase for current PHP versions

## License

```
Copyright (c) 2006-2015 Ryusuke SEKIYAMA. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
```
