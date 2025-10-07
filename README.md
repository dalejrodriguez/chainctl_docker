# chainctl_docker

This is a dockerized version of chainctl. 

This version is a side project and not an official release from chainguard. 

Usage:

 docker run --rm \
   --env identity="foo" \
   --env identity_token="bar" \
   chainctl-image:latest \
  chainctl img list --parent=example.com

