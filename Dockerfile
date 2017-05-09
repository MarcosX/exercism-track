FROM ubuntu
MAINTAINER Marcos Brizeno

# install general updates
RUN apt-get update &&\
  apt-get install -y -q git-core\
    curl\
    zlib1g-dev\
    build-essential\
    libssl-dev\
    libreadline-dev\
    libyaml-dev\
    libsqlite3-dev\
    sqlite3\
    libxml2-dev\
    libxslt1-dev\
    libcurl4-openssl-dev\
    python-software-properties\
    libffi-dev\
    rbenv\
    ruby-build

# install ruby
RUN rbenv install -v 2.2.3 &&\
  rbenv global 2.2.3

# install crystal
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 09617FD37CC06B54
RUN echo "deb https://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list &&\
  apt-get install apt-transport-https &&\
  apt-get update &&\
  apt-get install crystal

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - &&\
  apt-get install -y nodejs
RUN npm install jasmine-node -g

# install elixir
RUN apt-get install wget &&\
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb &&\
  dpkg -i erlang-solutions_1.0_all.deb &&\
  apt-get update &&\
  apt-get install -y -q esl-erlang &&\
  apt-get install -y -q elixir

# install pytests for python
RUN apt-get install -y -q python-pip &&\
  pip install -U pytest

ADD ruby /exercism/ruby
ADD python /exercism/python
ADD crystal /exercism/crystal
ADD elixir /exercism/elixir
ADD javascript /exercism/javascript
ADD Makefile /exercism/Makefile

CMD cd /exercism && make test
