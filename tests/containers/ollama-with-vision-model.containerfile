# Containerfile used to build our Ollama image with vision model to run tests in CI
#
# podman build --platform linux/amd64 -f ./ollama-with-vision-model.containerfile -t ollama-with-vision-model .
#
FROM --platform=linux/amd64 ollama/ollama:latest

# Start ollama and pull models in a single layer
RUN ollama serve & \
    sleep 5 && \
    ollama pull llama3.2-vision:11b && \
    ollama pull all-minilm:l6-v2

# Set the entrypoint to start ollama serve
ENTRYPOINT ["ollama", "serve"]
