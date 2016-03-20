FROM elixir:latest
RUN mkdir /code
WORKDIR /code
RUN apt-get update && apt-get install -y sudo curl postgresql
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN mix local.hex --force
RUN mix hex.info > hex.info
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
ADD . /code/
