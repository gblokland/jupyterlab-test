FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

RUN which pkg-config
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/bin/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig 
RUN echo $PKG_CONFIG_PATH

RUN apt update && \
    apt install -y sudo && \
    sudo apt install -y pkg-config wget vim rsync git tree tk build-essential bash-completion bc gpg && \
    sudo apt install -y zlib1g-dev libudunits2-dev libgdal-dev libcairo2-dev libgsl-dev libv8-dev libmagick++-dev && \
    sudo apt install -y liblapack-dev libblas-dev libharfbuzz-dev libfribidi-dev libcurl4-openssl-dev libssl-dev libbz2-dev liblzma-dev && \
    sudo apt install -y libxml2-dev libfontconfig1-dev
    
RUN sudo apt install -y python3-pip python3-dev && pip3 install --upgrade pip && \
    pip3 install notebook jupyterlab

#RUN apt-get update && \
    #apt-get install -y --no-install-recommends r-base && \
    #apt-get install -y r-base r-base-core r-recommended r-base-dev && \
    #apt-get install -y --no-install-recommends r-base-core=4.1.2-1ubuntu2 r-base-html=4.1.2-1ubuntu2 r-doc-html=4.1.2-1ubuntu2 r-base-dev=4.1.2-1ubuntu2 && \

RUN ls $PKG_CONFIG_PATH

ENV PATH=/usr/bin:/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH
RUN mkdir -p /ricopili/dependencies/R_packages && \
    chmod -R 755 /ricopili/dependencies/R_packages

FROM rocker/rstudio:4.0.0

#, lib='/ricopili/dependencies/R_packages'
#, lib='/usr/local/lib/R/site-library'
#'mvoutlier', 'qqman', 'rJava', 'rsq', 'xlsx', 'xlsxjars', 
#RUN R -e "install.packages(c(corrgram', 'corrplot', 'd3heatmap', 'data.table', 'DescTools', 'doBy', 'dplyr', 'extrafont', 'extrafontdb', 'foreign', 'forestplot', 'forestploter', 'gdata', 'ggcorrplot', 'ggplot2', 'gtools', 'haven', 'igraph', 'jpeg', 'lattice', 'lubridate', 'meta', 'metafor', 'OpenMx', 'pheatmap', 'plyr', 'png', 'psych', 'randomForest', 'RColorBrewer', 'readxl', 'remotes', 'reshape', 'reshape2', 'rmarkdown', 'scatterplot3d', 'scales', 'sem', 'semTools', 'stringr', 'sysfonts', 'systemfonts', 'tibble', 'tidyr', 'ukbtools', 'VennDiagram', 'viridis', 'viridisLite', 'vroom', 'writexl', 'WriteXLS', 'xtable'), repos='https://cloud.r-project.org')"

RUN Rscript -e 'dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)'  # create personal library
RUN Rscript -e '.libPaths(Sys.getenv("R_LIBS_USER"))'  # add to the path
#RUN Rscript -e 'install.packages("devtools", configure.vars=c("LIB_DIR='/usr/local/lib/R/site-library -L/my/lib/dir2' INCLUDE_DIR='/my/include/dir1 -I/my/include/dir2'"), repos="https://cloud.r-project.org")'

#Sys.unsetenv("GITHUB_PAT")
RUN Rscript -e 'install.packages(c("remotes", "devtools"), repos="https://cloud.r-project.org")'
RUN Rscript -e 'remotes::install_github("kenhanscombe/ukbtools", dependencies = TRUE)'
RUN Rscript -e "remotes::install_github('DudbridgeLab/avengeme')"
RUN Rscript -e "remotes::install_github('MathiasHarrer/dmetar')"
RUN Rscript -e "remotes::install_github('kassambara/easyGgplot2')"
RUN Rscript -e "remotes::install_github('ramiromagno/gwasrapidd')"
RUN Rscript -e "remotes::install_github('https://github.com/josefin-werme/LAVA.git')"
#Install postgwas from GitHub via devtools:
#setRepositories(ind = 1:6)
#SAIGE is an R package with Scalable and Accurate Implementation of Generalized mixed model (Chen, H. et al. 2016). It accounts for sample relatedness and is feasible for genetic association tests in large cohorts and biobanks (N > 400,000).
RUN Rscript -e 'remotes::install_github("leeshawn/MetaSKAT")'
RUN Rscript -e 'remotes::install_github("weizhouUMICH/SAIGE")'
#LDpred - R-based
RUN Rscript -e 'remotes::install_github("https://github.com/privefl/bigsnpr.git")'
RUN Rscript -e "remotes::install_github('merns/postgwas')"
RUN Rscript -e "remotes::install_github('MRCIEU/TwoSampleMR')"
RUN Rscript -e "remotes::install_github('ozancinar/poolR')"

RUN Rscript -e 'install.packages(c("BiocManager"), repos="https://cloud.r-project.org")'
RUN Rscript -e "BiocManager::install('ASSET')"
RUN Rscript -e "BiocManager::install('gwascat')"
RUN Rscript -e "BiocManager::install('snpStats')"
