FROM bruggerk/ricopili:latest

LABEL org.opencontainers.image.source="https://github.com/gblokland/jupyterlab"

WORKDIR /root

RUN apt-get update && \
    apt-get install -y wget vim rsync git tree tk build-essential pkg-config bash-completion bc && \
    apt-get install -y --no-install-recommends r-base && \
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee -a /etc/apt/sources.list.d/r-project.list && \
    #apt-get install -y r-base r-base-core r-recommended r-base-dev && \
    #apt-get install -y --no-install-recommends r-base-core=4.1.2-1ubuntu2 r-base-html=4.1.2-1ubuntu2 r-doc-html=4.1.2-1ubuntu2 r-base-dev=4.1.2-1ubuntu2 && \
    apt-get install -y libxml2-dev zlib1g-dev libudunits2-dev libgdal-dev libfontconfig1-dev libcairo2-dev libgsl-dev libv8-dev libmagick++-dev liblapack-dev libblas-dev && \
    apt-get install -y libharfbuzz-dev libfribidi-dev && \
    apt-get install -y python3-pip python3-dev && pip3 install --upgrade pip && \
    pip3 install notebook jupyterlab

RUN R -e "install.packages(c('BiocManager', 'corrgram', 'corrplot', 'd3heatmap', 'data.table', 'DescTools', 'devtools', 'doBy', 'dplyr', 'extrafont', 'extrafontdb', 'foreign', 'forestplot', 'forestploter', 'gdata', 'ggcorrplot', 'ggplot2', 'gtools', 'haven', 'igraph', 'jpeg', 'lattice', 'lubridate', 'meta', 'metafor', 'mvoutlier', 'OpenMx', 'pheatmap', 'plyr', 'png', 'psych', 'qqman', 'randomForest', 'RColorBrewer', 'readxl', 'rJava', 'rmarkdown', 'rsq', 'scatterplot3d', 'scales', 'sem', 'semTools', 'stringr', 'sysfonts', 'systemfonts', 'tibble', 'tidyr', 'ukbtools', 'VennDiagram', 'viridis', 'viridisLite', 'vroom', 'writexl', 'WriteXLS', 'xlsx', 'xlsxjars', 'xtable'), repos='https://cloud.r-project.org', lib='/ricopili/dependencies/R_packages')"
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
#RUN R -e "install.packages('cmutils', repos =NULL, type='source')"

ENV PATH=/ricopili/dependencies/Minimac3:/ricopili/dependencies/bcftools:/ricopili/dependencies/bgzip:/ricopili/dependencies/eagle:/ricopili/dependencies/eigensoft/EIG-6.1.4/bin:/ricopili/dependencies/impute_v2:/ricopili/dependencies/impute_v4:/ricopili/dependencies/latex:/ricopili/dependencies/ldsc:/ricopili/dependencies/liftover:/ricopili/dependencies/metal:/ricopili/dependencies/shapeit:/ricopili/dependencies/shapeit3:/ricopili/dependencies/tabix:$PATH

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser"]

CMD ["/bin/bash"]
