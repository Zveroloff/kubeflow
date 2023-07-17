# Use the respective Makefile to pass the appropriate BASE_IMG and build the image correctly
ARG BASE_IMG=<jupyter-pytorch-cuda-full>
FROM $BASE_IMG

ENV NB_UID 1000

# install - ffmpeg linux packages
USER root
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get -yq install --no-install-recommends \
    ffmpeg
USER $NB_UID

# install - requirements.txt
COPY --chown=jovyan:users requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir \
 && rm -f /tmp/requirements.txt
