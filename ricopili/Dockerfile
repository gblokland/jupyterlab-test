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

/bin/sh -c Rscript -e 'install.packages("corrgram", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("corrplot", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("d3heatmap", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("data.table", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("DescTools", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("doBy", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("dplyr", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("extrafont", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("extrafontdb", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("foreign", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("forestplot", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("forestploter", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("gdata", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("ggcorrplot", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("ggplot2", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("gtools", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("haven", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("igraph", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("jpeg", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("lattice", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("LAVA", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("lubridate", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("meta", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("metafor", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("mvoutlier", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("OpenMx", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("pheatmap", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("plyr", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("png", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("psych", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("qqman", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("randomForest", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("RColorBrewer", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("readxl", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("rmarkdown", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("rsq", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("scatterplot3d", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("scales", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("sem", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("semTools", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("stringr", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("sysfonts", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("systemfonts", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("tibble", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("tidyr", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("ukbtools", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("VennDiagram", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("viridis", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("viridisLite", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("vroom", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("writexl", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("WriteXLS", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("xlsx", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("xlsxjars", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
/bin/sh -c Rscript -e 'install.packages("xtable", repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'

ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
