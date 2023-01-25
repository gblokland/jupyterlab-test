FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y pkg-config && \
    #apt-get install -y wget vim rsync git tree tk build-essential bash-completion bc sudo gpg && \
    #apt-get install -y zlib1g-dev libudunits2-dev libgdal-dev libcairo2-dev libgsl-dev libv8-dev libmagick++-dev && \
    #apt-get install -y liblapack-dev libblas-dev libharfbuzz-dev libfribidi-dev
    apt-get install -y libxml2-dev libfontconfig1-dev
#RUN apt-get install -y python3-pip python3-dev && pip3 install --upgrade pip && \
#    pip3 install notebook jupyterlab

    #apt-get install -y --no-install-recommends r-base && \
    #apt-get install -y r-base r-base-core r-recommended r-base-dev && \
    #apt-get install -y --no-install-recommends r-base-core=4.1.2-1ubuntu2 r-base-html=4.1.2-1ubuntu2 r-doc-html=4.1.2-1ubuntu2 r-base-dev=4.1.2-1ubuntu2 && \

ENV PKG_CONFIG_PATH=/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig 
ENV PATH=/usr/bin:/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH
RUN which pkg-config && echo $PKG_CONFIG_PATH
RUN mkdir -p /ricopili/dependencies/R_packages && \
    chmod -R 755 /ricopili/dependencies/R_packages

