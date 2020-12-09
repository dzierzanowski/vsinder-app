#!/bin/bash

set -e

source .env

npx expo build:android --non-interactive --type app-bundle

curl -o app.aab $(expo url:apk --non-interactive)

bundle exec fastlane supply --track 'production' --json_key './api-copy.json' --package_name "com.benawad.vsinder" --aab "app.aab" --skip_upload_metadata --skip_upload_images --skip_upload_screenshots
