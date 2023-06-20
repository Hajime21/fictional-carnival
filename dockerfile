# Use the Ruby base image
FROM ruby:3.2.0

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install bundler:2.3.26
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set the default command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]