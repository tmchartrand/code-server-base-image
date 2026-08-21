ARG REGISTRY_HOST
FROM $REGISTRY_HOST/codeocean/mambaforge3:24.5.0-0-python3.12.4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-ask-pass /

ENV PATH="/root/.local/bin:$PATH"
ENV UV_NO_CACHE=1

RUN curl -fsSL https://claude.ai/install.sh | bash

COPY install_vscode /
RUN /install_vscode
RUN pip install -U --no-cache-dir uv==0.12.5 jupyterlab==4.6.3 boto3 aws-bedrock-token-generator

RUN uv tool install codeocean-mcp-server

RUN --mount=type=bind,source=./files,target=./files cp -r ./files /.files
RUN echo "bash /.files/setup.sh" >> /root/.profile
