FROM alpine
ENV ARCH=amd64
ENV RCLONE_VERSION=v1.66.0

RUN apk add --no-cache bash curl unzip ca-certificates fuse openssh-client \
  && curl -L -o /tmp/rclone.zip https://downloads.rclone.org/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip\
  && unzip /tmp/rclone.zip -d /tmp \
  && mv /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}/rclone /usr/bin \
  && chmod 755 /usr/bin/rclone \
  && rm -rf /tmp/rclone.zip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH} \
  && apk del bash curl unzip

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
