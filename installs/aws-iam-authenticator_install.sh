#! /bin/bash

# RUN THIS AS THE USER

# https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html

# show commands being run
set -x

# Fail script on error.
set -e

curl -o /tmp/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator

chmod +x /tmp/aws-iam-authenticator

mkdir -p $HOME/bin && cp /tmp/aws-iam-authenticator $HOME/bin/aws-iam-authenticator

aws-iam-authenticator help
