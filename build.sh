#!/usr/bin/env bash

function run_build {
  local heroku_stack=$1
  local otp_version=$2

  echo "HEROKU STACK: $heroku_stack"
  echo "OTP VERSION: $otp_version"

  docker build -t otp-build -f ${heroku_stack}.dockerfile .
  docker run -t -e OTP_VERSION=$otp_version --name=otp-build-${otp_version}-${heroku_stack} otp-build

  docker cp otp-build-${otp_version}-${heroku_stack}:/home/build/out/OTP-${otp_version}.tar.gz builds/otp/OTP-${otp_version}-${heroku_stack}.tar.gz

  ls builds/otp
}

mkdir -p builds/otp
run_build $HEROKU_STACK $(head -n1 otp-versions)
