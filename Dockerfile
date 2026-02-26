ARG PHP_VERSION=8.3
FROM php:${PHP_VERSION}-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    mecab \
    libmecab-dev \
    mecab-ipadic-utf8 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy extension source
COPY mecab/ /workspace/mecab/

# Build extension
WORKDIR /workspace/mecab
RUN phpize \
    && ./configure --with-mecab \
    && make

# Default command runs tests
CMD ["make", "test"]
