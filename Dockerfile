FROM debian:10

RUN apt-get update --yes
RUN apt-get install --yes \
    ca-certificates \
    xdg-user-dirs \
    curl \
    procps

RUN curl https://public.gameye.com/binaries/igniter-shell/v1.0.12/amd64/linux/igniter-shell.tar.gz | tar --extract --gzip --directory /usr/local/bin/

RUN useradd --create-home --uid 2000 steam

ADD <binary> /home/steam

RUN chown --recursive steam:steam /home/steam
RUN chmod +x /home/steam/<binary>

USER steam
WORKDIR /home/steam

RUN mkdir --parents \
    /home/steam/Steam/appcache \
    /home/steam/Steam/config \
    /home/steam/Steam/logs \
    /home/steam/Steam/steamapps

COPY ./config /home/steam/config
COPY ./entrypoint.sh /home/steam/entrypoint.sh
ENTRYPOINT ["/home/steam/entrypoint.sh"]
