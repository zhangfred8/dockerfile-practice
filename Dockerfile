FROM continuumio/miniconda3

# Install Jupyter, JupterLab, R & the IRkernel
RUN conda install --yes --quiet --channel conda-forge \
    jupyter \
    jupyterlab \
    r-base=4.1.1 \
    r-irkernel \
    cowpy

# Install JupyterLab Git Extension
RUN pip install jupyterlab-git

# Create working directory for mounting volumes
RUN mkdir -p /opt/notebooks

# Make port 8888 available for JupyterLab
EXPOSE 8888

# Install Git, the nano-tiny text editor and less (needed for R help)
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    git \
    nano-tiny \
    less
