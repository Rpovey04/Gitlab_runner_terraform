#! /bin/bash

curl -LJO "https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/deb/gitlab-runner-helper-images.deb"
curl -LJO "https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/deb/gitlab-runner_${arch}.deb"

dpkg -i "gitlab-runner-helper-images.deb" "gitlab-runner_${arch}.deb"

sudo gitlab-runner register --non-interactive --url "${url}" --token "${token}" --executor "${executor}"

sudo gitlab-runner status > status.txt
sudo gitlab-runner run
