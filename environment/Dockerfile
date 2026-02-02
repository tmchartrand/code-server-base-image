ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/mambaforge3:24.5.0-0-python3.12.4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

COPY install_vscode /
RUN /install_vscode

RUN pip install -U --no-cache-dir uv==0.9.3
RUN uv tool install --no-cache aind-metadata-mcp==0.5.2

COPY ./files/ /root/
RUN echo "bash /root/setup.sh" >> /root/.profile

ENV PYTHONPATH="/code"
ENV PATH="/root/.local/bin:$PATH"