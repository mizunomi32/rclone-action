FROM alpine

LABEL "com.github.actions.name"="Github Action for rclone"
LABEL "com.github.actions.description"="Wraps the rclone CLI to be used in Github Actions"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/mizunomi32/rclone-action"
LABEL "homepage"="https://github.com/mizunomi32/rclone-action"
LABEL "maintainer"="mz32 <mizuno@mz32.dev>"

RUN apk add --no-cache bash curl unzip ca-certificates fuse openssh-client \
  && wget -qO- https://rclone.org/install.sh | bash \
  && apk del bash curl unzip

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
