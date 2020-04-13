#!/bin/sh

cd CardStackExample

xcodebuild -project CardStackExample.xcodeproj -scheme CardStackExample -destination  "OS=13.0,name=iPhone 11" | xcpretty
