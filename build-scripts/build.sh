function run_build {
  local heroku_stack=$1
  local otp_version=$2

  echo "HEROKU STACK: $heroku_stack"
  echo "OTP VERSION: $otp_version"

  docker build -t otp-build build-scripts -f $heroku_stack.dockerfile
  docker run -t -e OTP_VERSION=$otp_version --name=otp-build-${otp_version}-${heroku_stack} otp-build-${heroku_stack}

  docker cp otp-build-${otp_version}-${heroku_stack}:/home/build/out/OTP-${otp_version}.tar.gz otp-builds/OTP-${otp_version}-${heroku_stack}.tar.gz
  ls builds/otp
}

mkdir -p builds/otp

OTP_VERSION=$(head -n1 otp-versions)
run_build $HEROKU_STACK $OTP_VERSION
