# Reordered with help from Claude Opus 5.5 on Medium thinking when prompted why the container builds were taking so long.

FROM python:3.10-slim

WORKDIR /opt/app

# Install packages that we need. vim is for helping with debugging
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -yq ca-certificates && \
    apt-get install -yq --no-install-recommends

COPY requirements.txt .
RUN pip install --no-cache-dir -r /opt/app/requirements.txt

COPY . .

EXPOSE 7860

CMD bash -c "python /opt/app/app.py"