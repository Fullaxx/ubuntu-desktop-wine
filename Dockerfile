# ------------------------------------------------------------------------------
# Pull base image
FROM fullaxx/ubuntu-desktop:bionic
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# ------------------------------------------------------------------------------
# Install prerequisites and clean up
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y tree unzip xz-utils cabextract wine32 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 5901

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
