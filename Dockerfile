FROM debian:stretch
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/build_bela.sh \
	scripts/build_packages.sh \
	scripts/build_env.sh \
	scripts/build_settings \
	./

RUN echo deb http://archive.debian.org/debian/ stretch main contrib non-free > /etc/apt/sources.list
RUN echo deb http://archive.debian.org/debian-security stretch/updates main contrib non-free >> /etc/apt/sources.list
RUN apt-get update -y

RUN ./build_packages.sh && rm build_packages.sh
RUN ./build_bela.sh && rm build_bela.sh && rm build_settings
RUN ./build_env.sh && rm build_env.sh

CMD ["/bin/bash"]
