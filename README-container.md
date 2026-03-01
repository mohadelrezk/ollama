# Containerized vs Local Installation of Ollama

This document describes how to run Ollama using Podman containers, including optional GPU support, and how to access the UI. Containerization improves isolation, dependency management, portability, and reproducibility. A native installation may offer slightly better performance for a single-user setup but is not covered here.

---

## Prerequisites

Install **Podman** and **Krunkit** (for the `libkrun` provider), then prepare a machine with GPU support.

### Install Podman

```bash
brew install podman
```

### Install Krunkit

```bash
brew tap slp/krunkit
brew install krunkit
```

### Initialize and start a Podman machine

```bash
export CONTAINERS_MACHINE_PROVIDER=libkrun   # use libkrun provider for GPU
podman machine init
podman machine start
```

Verify the installation:

```bash
podman info
```

---

## Running the containerized Ollama server

```bash
podman run -d \
  --name ollama-m4 \
  --memory 8g \
  --memory-reservation 8g \
  --cpus 12 \
  -e OLLAMA_VULKAN=1 \
  -p 11434:11434 \
  -v ollama:/root/.ollama \
  --restart unless-stopped \
  ollama/ollama
```

### Updating resources

```bash
podman update --memory 16g --memory-reservation 8g --cpus 12 ollama-m4
```

### Managing models

List available models:

```bash
podman exec -it ollama-m4 ollama list
```

Pull a new model (e.g. `mistral:latest`):

```bash
podman exec -it ollama-m4 ollama pull mistral:latest
```

Run an LLM:

```bash
podman exec -it ollama-m4 ollama run llama3.2
```

---

## Running the web UI (Open-WebUI)

### Containerized UI

```bash
podman run -d \
  -p 3000:8080 \
  --add-host=host.containers.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --name open-webui \
  ghcr.io/open-webui/open-webui:main
```

Browse to [http://localhost:3000](http://localhost:3000) to access the interface.

### Local Python UI

```bash
python3.11 -m venv venv
source venv/bin/activate
pip install -r requirements
open-webui serve
```

Then open [http://localhost:8080](http://localhost:8080).

#### Configure the UI to connect to the server

1. Go to **Settings > Connections**.
2. Set the **Ollama API URL** to `http://host.containers.internal:11434`.
3. Click the refresh icon to verify the connection.

The first account you create is automatically granted admin privileges. All data is stored locally.

---

## Agent creation (TODO)

Instructions for creating an agent using the Ollama API will be added here.
