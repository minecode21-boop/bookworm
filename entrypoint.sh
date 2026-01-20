#!/bin/bash
set -e

echo "Starting tailscaled..."
tailscaled &

sleep 3

echo "Running tailscale up..."
tailscale up --authkey=${TS_AUTHKEY} --hostname=docker-node || true

echo "----------------------------------"
echo "Tailscale status:"
tailscale status || true
echo "----------------------------------"

echo "Tailscale IP:"
tailscale ip -4 || true
echo "----------------------------------"

# Keep container alive
tail -f /dev/null