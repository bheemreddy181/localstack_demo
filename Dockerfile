FROM elixir:1.6

RUN mix local.hex --force

RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix deps.get
RUN mix local.rebar --force

CMD mix phoenix.server
