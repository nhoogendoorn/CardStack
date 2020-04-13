#!/bin/sh

if which swiftlint >/dev/null; then
  swiftlint --config ../.swiftlint.yml
fi
