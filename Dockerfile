FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y postgresql-client npm
ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE
ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH
RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/
WORKDIR /myapp
COPY package.json yarn.lock /myapp/
RUN npm install -g yarn
RUN yarn install
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install

COPY . /myapp
COPY ./config/database.yml.sample /myapp/config/database.yml

EXPOSE 3000
