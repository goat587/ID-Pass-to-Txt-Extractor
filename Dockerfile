# Install system dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        gcc \
        libffi-dev \
        ffmpeg \
        aria2 \
        python3-pip \
        python3-dev \
        python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy application files
COPY . /app/
WORKDIR /app/

# Install Python packages in the virtual environment
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade --requirement Installer

# Set the default command
CMD ["python3", "main.py"]
