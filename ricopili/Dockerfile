FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y wget vim rsync git tree tk build-essential pkg-config bash-completion r-base r-base-dev bc && \
    apt-get install -y libxml2-dev zlib1g-dev libudunits2-dev libgdal-dev libfontconfig1-dev libcairo2-dev libgsl-dev libv8-dev libmagick++-dev liblapack-dev libblas-dev && \
    apt-get install -y python3-pip python3-dev && \
    pip3 install notebook jupyterlab

#RUN R -e "install.packages(c('rJava','devtools','digest', 'dplyr','futile.logger','RJDBC', 'yaml', 'purrr','lubridate', 'testthat','noctua'), dependencies = TRUE)"
#RUN R -e "devtools::install_github('DyfanJones/noctua')"
#RUN R -e "install.packages('cmutils', repos =NULL, type='source')"

#/bin/sh -c Rscript -e 'install.packages(c("corrgram", "corrplot", "d3heatmap", "data.table", "DescTools", "devtools", "doBy", "dplyr", "extrafont", "extrafontdb", "foreign", "forestplot", "forestploter", "gdata", "ggcorrplot", "ggplot2", "gtools", "haven", "igraph", "jpeg", "lattice", "LAVA", "lubridate", "meta", "metafor", "mvoutlier", "OpenMx", "pheatmap", "plyr", "png", "psych", "qqman", "randomForest", "RColorBrewer", "readxl", "rmarkdown", "rsq", "scatterplot3d", "scales", "sem", "semTools", "stringr", "sysfonts", "systemfonts", "tibble", "tidyr", "ukbtools", "VennDiagram", "viridis", "viridisLite", "vroom", "writexl", "WriteXLS", "xlsx", "xlsxjars", "xtable"), repos="https://cloud.r-project.org", lib="/ricopili/dependencies/R_packages")'
#/bin/sh -c Rscript -e 'devtools::install_github('DyfanJones/noctua')'

ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
