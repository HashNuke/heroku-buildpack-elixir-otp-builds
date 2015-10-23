# Erlang OTP build scripts for the Heroku Elixir buildpack

The [Heroku Elixir Buildpack](http://github.com/HashNuke/heroku-buildpack-elixir) uses pre-compiled builds of Erlang OTP to speed up deployments. This repository contains build scripts to compile Erlang OTP and upload those to s3 for re-use.

## Notes

* Builds are run on TravisCI
* Erlang versions are stored on Amazon S3

## How to compile a new version of Erlang?

Just add the new version to the top of the `otp-versions` file. Cannot add multiple versions in one commit. The build scripts only build the top most version listed in the file.




