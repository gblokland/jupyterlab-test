FROM jupyter/scipy-notebook:latest

LABEL org.opencontainers.image.source="https://github.com/MaastrichtU-IDS/jupyterlab"

ENV JUPYTER_ENABLE_LAB=yes
# ENV CHOWN_HOME=yes
# ENV CHOWN_HOME_OPTS='-R'

RUN npm install --global yarn 

# Install jupyterlab extensions
RUN conda install --quiet --yes \
      ipywidgets \
      jupyterlab \
      jupyterlab-git \
      jupyterlab-lsp \
      jupyter-lsp-python \
      jupyter_bokeh \
      jupyter-server-proxy==3.1.0 \
      jupyterlab-drawio && \
    conda install -c plotly 'plotly>=4.8.2' 
    #   rise && \ # Issue when building with GitHub Actions related to jedi package
    # fix-permissions $CONDA_DIR && \
    # fix-permissions /home/$NB_USER

# python -m pip install mitoinstaller
# python -m mitoinstaller install

RUN pip install --upgrade pip && \
    pip install --upgrade \
      sparqlkernel \
      mitosheet3 \
      jupyterlab-system-monitor && \
    jupyter labextension install jupyterlab-spreadsheet
#   @jupyterlab/server-proxy \
# elyra : Pipeline builder for Kubeflow and Airflow

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt && \
    rm requirements.txt

# @jupyterlab/latex not officialy supporting 3.0 yet

# Change to root user to install things
USER root

# Install SPARQL kernel
RUN jupyter sparqlkernel install 

# Install Java
RUN apt-get update && \
    apt-get install default-jdk curl -y

# Install Ijava kernel
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > /opt/ijava-kernel.zip && \
    unzip /opt/ijava-kernel.zip -d /opt/ijava-kernel && \
    cd /opt/ijava-kernel && \
    python3 install.py --sys-prefix && \
    rm /opt/ijava-kernel.zip


# Install VS Code server
# RUN curl -fsSL https://code-server.dev/install.sh | sh


# Nicer Bash terminal
# RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
#     bash ~/.bash_it/install.sh --silent

# # Install ZSH add broken permissions
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
#     -t bira -p git && \
#     chmod -R g-w,o-w /home/$NB_USER/.oh-my-zsh
#     # compaudit | xargs chmod g-w,o-w

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    fix-permissions /opt

ADD jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py


USER $NB_USER

RUN jupyter labextension update --all && \
    jupyter lab build 


# Add jar files in /opt for RDF processing
RUN npm i -g @rmlio/yarrrml-parser && \
    wget -q -O /opt/rmlmapper.jar https://github.com/RMLio/rmlmapper-java/releases/download/v4.11.0/rmlmapper.jar && \
    wget -q -O /opt/widoco.jar https://github.com/dgarijo/Widoco/releases/download/v1.4.15/widoco-1.4.15-jar-with-dependencies.jar && \
    wget -q -O /opt/limes.jar https://github.com/dice-group/LIMES/releases/download/1.7.5/limes.jar && \
    wget -q -O /opt/amie3.jar https://github.com/lajus/amie/releases/download/3.0/amie-milestone-intKB.jar && \
    wget -q -O /opt/shaclconvert.jar https://gitlab.ontotext.com/yasen.marinov/shaclconvert/-/raw/master/built/shaclconvert.jar

RUN cd /opt && \
    wget -q https://repo1.maven.org/maven2/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar && \
    wget -q https://downloads.apache.org/jena/binaries/apache-jena-4.2.0.tar.gz && \
    wget -q http://download.eclipse.org/rdf4j/eclipse-rdf4j-3.7.3-onejar.jar 

RUN mkdir -p /home/$NB_USER/work
WORKDIR /home/$NB_USER/work

# Download latest simpleowlapi jar in /opt/simpleowlapi.jar
RUN curl -s https://api.github.com/repos/kodymoodley/simpleowlapi/releases/latest \
    | grep "browser_download_url.*-jar-with-dependencies.jar" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O /opt/simpleowlapi.jar -qi -

ENTRYPOINT [ "start-notebook.sh", "--no-browser", "--ip=0.0.0.0", "--config=/etc/jupyter/jupyter_notebook_config.py" ]