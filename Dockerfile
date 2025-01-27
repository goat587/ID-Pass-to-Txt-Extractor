FROM ubuntu:latest

# Install system dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        gcc \
        libffi-dev \
        ffmpeg \
        aria2 \
        python3-pip \
        python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY . /app/
WORKDIR /app/

# Install Python packages
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade --requirement Installer

# Set the default command
CMD ["python3", "main.py"]
