FROM debian:jessie
LABEL maintainer="IPCam software modding https://t.me/joinchat/FhtyHwrU0fwfQlAkvoeVJA"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential gawk git libncurses-dev python \
    subversion unzip zlib1g-dev libssl-dev wget

RUN git clone --depth 1 https://github.com/ZigFisher/chaos_calmer.git /src/chaos_calmer
WORKDIR /src/chaos_calmer

RUN cp ./feeds.conf.default ./feeds.conf \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a
RUN chmod +x ./ZFT_Lab.sh    
ENTRYPOINT ["./ZFT_Lab.sh"]