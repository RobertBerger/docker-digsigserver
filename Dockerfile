FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    openssl \
    python3 \
    python3-venv \
    linux-kbuild-6.1 \
    && rm -rf /var/lib/apt/lists/*

# Make sign-file discoverable on PATH for /sign/kmod
RUN ln -sf /usr/lib/linux-kbuild-6.1/scripts/sign-file /usr/local/bin/sign-file

# Install digsigserver from local cloned source
WORKDIR /app
COPY src /app

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir .

ENV DIGSIGSERVER_KEYFILE_URI=file:///keys
EXPOSE 9999

CMD ["digsigserver", "--address", "0.0.0.0", "--port", "9999"]
