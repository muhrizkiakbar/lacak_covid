FROM starefossen/ruby-node:2-8-stretch

# Install the software you need
RUN apt-get update \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs \
yarn \
telnetd \
&& gem install bundler

# Create a directory for your app
# RUN mkdir -p /app

# Copy the files needed for the bundle install
COPY ./Gemfile /lacak_covid/Gemfile
COPY ./Gemfile.lock /lacak_covid/Gemfile.lock

# Set the working directory for all following commands
WORKDIR /lacak_covid

# Install gems
# RUN gem install foreman
RUN bundle install

# default mailer url
# ENV DEFAULT_URL http://159.89.200.91
# depend on server IP
ENV DEFAULT_URL http://localhost:3000
# ENV DEFAULT_URL http://161.142.8.71:3000

# services ENV
# depend on server IP
 ENV ELASTICSEARCH_URL http://localhost:9200
# ENV ELASTICSEARCH_URL http://161.142.8.71:9200

