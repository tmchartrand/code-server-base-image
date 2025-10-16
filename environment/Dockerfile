# hash:sha256:5f5718a9b2e6ed10c38d9a4cd04d89f7b2c85a3db76e65da2af8f04c748f6050
ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/mambaforge3:24.5.0-0-python3.12.4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN pip install -U --no-cache-dir uv==0.7.15

COPY install_vscode /
RUN /install_vscode


RUN uv tool install --no-cache aind-metadata-mcp==0.5.1

ENV PATH="/root/.local/bin:$PATH"

COPY setup.sh /root/
COPY vscode_machine_settings.json /root/
COPY mcp.json /root/
RUN echo "bash /root/setup.sh" >> /root/.profile

ENV PYTHONPATH="/code"