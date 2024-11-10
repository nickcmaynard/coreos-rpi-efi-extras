# we need full-fat dnf in build.sh when *running the container*, so fedora rather than fedora-minimal
FROM registry.fedoraproject.org/fedora:40

RUN dnf install --repo=fedora --repo=updates -y zip rpm cpio fedora-repos-archive && dnf clean all

# This is where the ZIP will be placed
RUN mkdir /output

# Copy the script over
WORKDIR /app
COPY build.sh build.sh
RUN chmod 700 build.sh

ENV RELEASE=38
ENV LATEST_ARCHIVED_RELEASE=35

ENTRYPOINT /app/build.sh
