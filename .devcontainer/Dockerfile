# syntax=docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.3
FROM docker.io/library/ruby:$RUBY_VERSION-slim

# Install packages needed for development
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libjemalloc2 \
    libpq-dev \
    libvips \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    nodejs \
    npm \
    pkg-config \
    postgresql-client \
    postgresql-server-dev-all \
    vim \
    wget \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Rails app lives here
WORKDIR /rails

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Set development environment before installing gems
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="" \
    RUBY_CONFIGURE_OPTS="--with-jemalloc" \
    MALLOC_CONF="dirty_decay_ms:1000,narenas:2,background_thread:true"

# Install application gems
RUN bundle config --global frozen 0 && \
    bundle config --global silence_root_warning 1 && \
    bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times (if bootsnap is available)
RUN if bundle show bootsnap > /dev/null 2>&1; then \
      bundle exec bootsnap precompile --gemfile app/ lib/; \
    fi

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
