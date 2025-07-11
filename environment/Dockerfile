# hash:sha256:5f5718a9b2e6ed10c38d9a4cd04d89f7b2c85a3db76e65da2af8f04c748f6050
ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/mambaforge3:24.5.0-0-python3.12.4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN pip install -U --no-cache-dir \
    uv==0.7.15
RUN uv tool install aind-metadata-mcp

COPY postInstall /
RUN /postInstall

COPY .profile /root/
COPY setup_cline_mcp.sh /root/
COPY vscode_machine_settings.json /root/

ENV PYTHONPATH=/code