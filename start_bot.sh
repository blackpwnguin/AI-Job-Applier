#!/bin/bash

echo "🧹 Clearing old bot processes..."
# Find and kill anything on 7071 or Azurite ports (10000-10002)
lsof -t -i:7071,10000,10001,10002 | xargs kill -9 2>/dev/null

# 1. Start Ollama if it's not already running
if ! pgrep -x "ollama" > /dev/null
then
    echo "🦙 Starting Ollama Service..."
    ollama serve &
    sleep 5 # Give it a second to wake up
else
    echo "🦙 Ollama is already awake."
fi

# 2. Start Azurite (Silently)
echo "🚀 Starting Azurite Storage..."
azurite --silent --location ./azurite_data &
AZURITE_PID=$!

# 3. Start the Bot
echo "🤖 Starting LinkedIn Bot..."
func start &
FUNC_PID=$!

# Handle shutdown
trap "echo 'Stopping...'; kill $AZURITE_PID $FUNC_PID; exit" SIGINT SIGTERM

echo "✅ All systems green. Local AI is active."
wait