FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/MaastrichtU-IDS/jupyterlab"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y python3-pip python3-dev && \
    pip3 install notebook jupyterlab && \
    apt-get install wget && apt-get install vim && apt-get install rsync && apt-get install build-essential && \
    apt-get install r-base r-base-dev && \
    apt-get install -y bc && apt-get install git && apt-get install libxml2-dev && \
    apt-get install zlib1g-dev && apt-get install pkg-config && apt-get install libudunits2-dev && \
    apt-get install libgdal-dev && apt-get install libfontconfig1-dev && apt-get install libcairo2-dev && \
    apt-get install libgsl-dev && apt-get install libv8-dev && apt-get install tk && apt-get install libmagick++-dev && \
    apt-get install bash-completion && apt-get install bind && apt-get install liblapack-dev libblas-dev && apt-get install tree

/bin/sh -c Rscript -e 'install.packages("rmeta", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'

ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
