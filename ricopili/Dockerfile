FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y wget vim rsync git tree tk build-essential pkg-config bash-completion bc sudo gpg && \
    which pkg-config && \
    ls $PKG_CONFIG_PATH && \
    apt-get install -y libxml2-dev zlib1g-dev libudunits2-dev libgdal-dev libfontconfig1-dev libcairo2-dev libgsl-dev libv8-dev libmagick++-dev && \
    apt-get install -y liblapack-dev libblas-dev libharfbuzz-dev libfribidi-dev && \
    apt-get install -y python3-pip python3-dev && pip3 install --upgrade pip && \
    pip3 install notebook jupyterlab

    #apt-get install -y --no-install-recommends r-base && \
    #apt-get install -y r-base r-base-core r-recommended r-base-dev && \
    #apt-get install -y --no-install-recommends r-base-core=4.1.2-1ubuntu2 r-base-html=4.1.2-1ubuntu2 r-doc-html=4.1.2-1ubuntu2 r-base-dev=4.1.2-1ubuntu2 && \

#ENV PKG_CONFIG_PATH /usr/bin
ENV PATH=/usr/bin:/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

FROM rocker/rstudio:4.0.0

#, lib='/ricopili/dependencies/R_packages'
#, lib='/usr/local/lib/R/site-library'
#'mvoutlier', 'qqman', 'rJava', 'rsq', 'xlsx', 'xlsxjars', 
#RUN R -e "install.packages(c('BiocManager', 'corrgram', 'corrplot', 'd3heatmap', 'data.table', 'DescTools', 'devtools', 'doBy', 'dplyr', 'extrafont', 'extrafontdb', 'foreign', 'forestplot', 'forestploter', 'gdata', 'ggcorrplot', 'ggplot2', 'gtools', 'haven', 'igraph', 'jpeg', 'lattice', 'lubridate', 'meta', 'metafor', 'OpenMx', 'pheatmap', 'plyr', 'png', 'psych', 'randomForest', 'RColorBrewer', 'readxl', 'remotes', 'reshape', 'reshape2', 'rmarkdown', 'scatterplot3d', 'scales', 'sem', 'semTools', 'stringr', 'sysfonts', 'systemfonts', 'tibble', 'tidyr', 'ukbtools', 'VennDiagram', 'viridis', 'viridisLite', 'vroom', 'writexl', 'WriteXLS', 'xtable'), repos='https://cloud.r-project.org')"

RUN R -e "install.packages(c('BiocManager', 'devtools'), repos='https://cloud.r-project.org')"
#Sys.unsetenv("GITHUB_PAT")
RUN R -e "devtools::install_github('DudbridgeLab/avengeme')"
RUN R -e "devtools::install_github('MathiasHarrer/dmetar')"
RUN R -e "devtools::install_github('kassambara/easyGgplot2')"
RUN R -e "devtools::install_github('ramiromagno/gwasrapidd')"
RUN R -e "devtools::install_github('https://github.com/josefin-werme/LAVA.git')"
#Install postgwas from GitHub via devtools:
#setRepositories(ind = 1:6)
RUN R -e "devtools::install_github('merns/postgwas')"
RUN R -e "devtools::install_github('MRCIEU/TwoSampleMR')"
RUN R -e "devtools::install_github('ozancinar/poolR')"
RUN R -e "BiocManager::install('ASSET')"
RUN R -e "BiocManager::install('gwascat')"
RUN R -e "BiocManager::install('snpStats')"

#RUN R -e "install.packages('cmutils', repos =NULL, type='source')"

ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]

CMD ["/bin/bash"]
