FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

FROM rocker/rstudio:latest
#FROM rocker/rstudio:4.0.0
#FROM rocker/rstudio-stable:3.4.4 #this R is version 3.3.3, several packages need at least 3.5 or 3.6
#FROM rocker/r-base:4.2.2

MAINTAINER Gabriella Blokland

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo pandoc pandoc-citeproc pkg-config libnlopt-dev libcairo2-dev libxt-dev libgsl-dev \
    libssl-dev libssh2-1-dev libxml2-dev libfontconfig1-dev openssl libmpfr-dev libcurl4-openssl-dev \
    libzmq3-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev build-essential libicu-dev \
    cmake wget curl vim rsync git tree tk build-essential bash-completion bc gpg \
    libz-dev zlib1g-dev libudunits2-dev libgdal-dev libv8-dev libmagick++-dev \
    liblapack-dev libblas-dev libharfbuzz-dev libfribidi-dev libssl-dev libbz2-dev liblzma-dev libffi-dev 
    #libcurl-gnutls libssl1.0.0 
    #libcurl4-gnutls-dev conflicts with libcurl4-openssl-dev

# install java
RUN apt-get update && apt-get install -y openjdk-8-jdk openjdk-8-jre
RUN R CMD javareconf

# r-java
RUN apt-get install r-cran-rjava -y


#Get Linux OS flavor:
#RUN cat /etc/os-release
#Check that 'pkg-config' is in your PATH
RUN which pkg-config
#Tell the system where to search for {package}.pc files:
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig 
RUN export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig 
RUN echo $PKG_CONFIG_PATH

RUN apt-get update && apt-get install -y python3-pip python3-dev && pip3 install --upgrade pip && pip3 install notebook jupyterlab 
RUN pip3 install --upgrade setuptools && pip3 install ez_setup
#RUN sudo chown $(whoami):$(whoami) /.local



RUN mkdir -p /ricopili/dependencies/R_packages && \
    chmod -R 755 /ricopili/dependencies/R_packages

ENV PATH=/usr/local/lib:/usr/bin:/usr/local/bin:/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig 
RUN export PATH=/usr/local/lib:/usr/bin:/usr/local/bin:/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH  && \
    export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig


#Original dependencies
ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH
#Added by me
ENV PATH=/ricopili/dependencies/bedtools-2.30.0:/ricopili/dependencies/vcftools:/ricopili/dependencies/caviar:/ricopili/dependencies/PAINTOR_V3.0:/ricopili/dependencies/gcta-1.94.1:/ricopili/dependencies/locuszoom_1.3:/ricopili/dependencies/finemap_v1.1:/ricopili/dependencies/magma_v1.10:/ricopili/dependencies/annovar:/ricopili/dependencies/PRSice_2.3.5:/ricopili/dependencies/mach_1.0.18:/ricopili/dependencies/pleiofdr:/ricopili/dependencies/mixer:/ricopili/dependencies/mostest:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
#CMD ["/bin/bash"]
