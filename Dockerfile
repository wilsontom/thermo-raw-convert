FROM rocker/r-ver
MAINTAINER "Tom Wilson" tpw2@aber.ac.uk

RUN apt-get update \
&& apt-get -y dist-upgrade 

RUN apt install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" |  tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update -y

RUN apt -y install mono-devel

RUN Rscript -e \
    'install.packages("http://fgcz-ms.uzh.ch/~cpanse/rawR_0.1.0.tar.gz")' 
    