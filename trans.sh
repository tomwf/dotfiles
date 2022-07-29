#!/bin/bash
SOURCE_LANGUAGE=$1
TARGET_LANGUAGE=$2
TEXT=${@:3}

case $SOURCE_LANGUAGE in
  cn) SOURCE_LANGUAGE="zh-CN"
esac

case $TARGET_LANGUAGE in
  cn) TARGET_LANGUAGE="zh-CN"
esac

open_google_translate() {
  case $OSTYPE in
    linux*) firefox "https://translate.google.com/?sl=$SOURCE_LANGUAGE&tl=$TARGET_LANGUAGE&text=$TEXT"
      ;;
    darwin*) open /Applications/Firefox.app "https://translate.google.com/?sl=$SOURCE_LANGUAGE&tl=$TARGET_LANGUAGE&text=$TEXT"
      ;;
  esac
}

open_google_translate
