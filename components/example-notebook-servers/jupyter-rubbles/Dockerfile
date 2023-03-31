# Use the respective Makefile to pass the appropriate BASE_IMG and build the image correctly
ARG BASE_IMG=<jupyter>
FROM $BASE_IMG

# install - requirements.txt
COPY --chown=jovyan:users requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir \
 && rm -f /tmp/requirements.txt
COPY --chown=jovyan:users conundrum_sdk-2.9.1-py3-none-any.whl /tmp/conundrum_sdk-2.9.1-py3-none-any.whl
RUN python3 -m pip install /tmp/conundrum_sdk-2.9.1-py3-none-any.whl --quiet --no-cache-dir \
 && rm -f /tmp/conundrum_sdk-2.9.1-py3-none-any.whl
