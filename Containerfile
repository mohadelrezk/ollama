# Use the official Ollama base image
FROM ollama/ollama:latest

# Expose the default port
EXPOSE 11434

# Set the volume for model persistence 
# (Matches -v ollama:/root/.ollama)
VOLUME ["/root/.ollama"]

# Set the default entrypoint (already in base, but good for clarity)
ENTRYPOINT ["/usr/bin/ollama"]
CMD ["serve"]
