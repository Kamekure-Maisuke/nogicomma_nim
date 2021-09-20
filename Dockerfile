FROM nimlang/nim:alpine

ENV LANG ja_JP.UTF-8

WORKDIR /usr/local/src/nogicomma_nim
COPY . /usr/local/src/nogicomma_nim

RUN echo "完了"
