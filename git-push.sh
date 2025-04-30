#!/bin/bash

# Exit on any error
set -e

# Get current date and time
NOW=$(date +"%Y-%m-%d %H:%M:%S")

# Add new and modified files only
git add -A

# Commit with date-time as the message
git commit -m "Auto commit: $NOW"

# Push to the current branch
git push

echo "✅ Changes pushed successfully at $NOW"
