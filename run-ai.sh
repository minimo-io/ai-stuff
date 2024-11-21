#!/bin/bash

export OLLAMA_DEBUG=1
export OLLAMA_HOST=0.0.0.0

# Start the OLLAMA server
ollama serve &

# Run cloudflared tunnel with LLM-tunnel config
cloudflared tunnel --loglevel debug --config ~/.cloudflared/llm-tunnel.yml run llm-tunnel &

# Run nextcloud-lab with caffeinate
caffeinate -s cloudflared tunnel run nextcloud-lab &
