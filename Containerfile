FROM fedora:latest

RUN dnf install --repo=fedora -y zip rpm cpio
RUN dnf install --repo=updates -y fedora-repos-archive

# This is where the ZIP will be placed
RUN mkdir /output

# Copy the script over
WORKDIR /app
COPY build.sh build.sh
RUN chmod 700 build.sh

ENV RELEASE=37
ENV LATEST_ARCHIVED_RELEASE=35

ENTRYPOINT /app/build.sh