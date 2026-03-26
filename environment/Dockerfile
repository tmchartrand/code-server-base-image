ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/mambaforge3:24.5.0-0-python3.12.4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-ask-pass /

COPY install_vscode /
RUN /install_vscode
RUN pip install -U --no-cache-dir uv==0.11.1
RUN uv tool install codeocean-mcp-server

COPY ./files/ /usr/
RUN echo "bash /usr/setup.sh" >> /root/.profile

ENV PYTHONPATH="/code"
ENV PATH="/root/.local/bin:$PATH"