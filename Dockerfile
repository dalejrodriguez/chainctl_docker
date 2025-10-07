# 
# Usage:
# * Set identity env variable to the username from your pull token
# * Set identity-token env variable to the password from your pull token
# * Pass the chainctl command as a CMD
# 
# $ docker run --rm \
#   --env identity="foo" \
#   --env identity_token="bar" \
#   chainctl-image:latest \
#   chainctl img list --parent=example.com
#
FROM cgr.dev/chainguard/curl:latest-dev AS chainguard-builder
RUN curl -o /home/nonroot/chainctl https://dl.enforce.dev/chainctl/latest/chainctl_$(uname -s | tr "[:upper:]" "[:lower:]")_$(uname -m | sed "s/aarch64/arm64/")

FROM cgr.dev/chainguard/bash:latest
COPY --chown=65532:65532 --from=chainguard-builder /home/nonroot/chainctl /usr/bin/
RUN chmod 755 /usr/bin/chainctl

ENV identity=""
ENV identity_token=""

# Run chainctl login and then execute any passed command
ENTRYPOINT ["sh", "-c", "chainctl auth login --headless --identity=$identity --identity-token=$identity_token && exec \"$0\" \"$@\""]
