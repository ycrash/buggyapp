#FROM adoptopenjdk/openjdk8:debian-slim
FROM adoptopenjdk/openjdk11:debian

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y gpg unzip tini \
  && rm -rf /var/lib/apt/lists/*

# Setup buggyapp
RUN mkdir -p /opt/workspace/buggyapp
WORKDIR /opt/workspace/buggyapp

RUN curl -fsSL https://tier1app.com/dist/buggyapp/buggyapp-latest.zip -o buggyapp-latest.zip \
  && unzip buggyapp-latest.zip \
  && rm buggyapp-latest.zip

# buggyapp
EXPOSE 9010

ENTRYPOINT ["/usr/bin/tini", "--" "java", "-Xms2g", "-Xmx4g", "-DlogDir=.", "-DuploadDir=.", "-jar", "webapp-runner.jar", "-AconnectionTimeout=3600000", "--port", "9010", "buggyapp.war"]