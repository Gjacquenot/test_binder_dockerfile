
# https://github.com/jupyter/docker-stacks/tree/main/minimal-notebook
FROM jupyter/minimal-notebook

# Temporary elevation
USER root

RUN apt-get update

# Install pip
RUN apt-get install --yes python3-pip

# Install Python 3 packages
COPY requirements.txt /home/${NB_USER}
RUN pip install -r /home/${NB_USER}/requirements.txt
RUN rm /home/${NB_USER}/requirements.txt
RUN mkdir /home/${NB_USER}/jetisu
# COPY jetisu/query_idr_magic.py /home/${NB_USER}/jetisu/
# COPY jetisu/idr_query.py /home/${NB_USER}/jetisu/
# COPY jetisu/*.mzn /home/${NB_USER}/jetisu/
# COPY *.ipynb /home/${NB_USER}
# COPY jetisu/test_idr_query.py /home/${NB_USER}/jetisu/
RUN rmdir /home/${NB_USER}/work
# Return to User level
USER ${NB_UID}
