FROM gcr.io/mark-edmondson-gde/googleauthr
LABEL maintainer="mark"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y git-core \
	libssl-dev \
	libcurl4-openssl-dev \
	zlib1g-dev
RUN ["install2.r", "cloudRunner", "containerit", "googleCloudStorageR", "openssl", "plumber", "remotes", "yaml"]
RUN ["installGithub.r", "o2r-project/containerit@master", "r-hub/sysreqs@master"]
WORKDIR /payload/
CMD ["R"]
