# ------------------------------------------------------------------------------
# Pull base image
FROM fullaxx/ubuntu-desktop
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# https://itsfoss.com/wine-5-release/
# https://computingforgeeks.com/how-to-install-wine-on-ubuntu-linux/
# https://www.tecmint.com/install-wine-on-ubuntu-and-linux-mint/
# ------------------------------------------------------------------------------
# Install prerequisites and clean up
RUN apt-get update && \
    apt-get install -y software-properties-common unzip cabextract && \
    wget -q https://dl.winehq.org/wine-builds/winehq.key -O- | apt-key add - && \
    dpkg --add-architecture i386 && \
    apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install --install-recommends -y winehq-stable winetricks && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 5901

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
