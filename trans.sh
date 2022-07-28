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
  firefox "https://translate.google.com/?sl=$SOURCE_LANGUAGE&tl=$TARGET_LANGUAGE&text=$TEXT"
}

open_google_translate
