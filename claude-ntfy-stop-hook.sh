#!/bin/bash

# Claude Code Stop Hook -> ntfy.sh notification script
# 
# This script sends a notification to ntfy.sh when Claude Code finishes responding
# Configure your ntfy topic below (choose something unique/unguessable)

# Configuration
NTFY_TOPIC="rejoin-list-acutely-snowiness"  # Change this to your preferred topic
NTFY_URL="https://ntfy.sh/${NTFY_TOPIC}"

# Read input from stdin (Claude Code provides JSON input)
INPUT=$(cat)

# Extract session_id and transcript_path using basic string manipulation
# (Using grep/sed for compatibility, could also use jq if available)
SESSION_ID=$(echo "$INPUT" | grep -o '"session_id":"[^"]*"' | cut -d'"' -f4)
TRANSCRIPT_PATH=$(echo "$INPUT" | grep -o '"transcript_path":"[^"]*"' | cut -d'"' -f4)
STOP_HOOK_ACTIVE=$(echo "$INPUT" | grep -o '"stop_hook_active":[^,}]*' | cut -d':' -f2)

# Get current timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Determine if this is a continuation
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
    TITLE="Claude Code Continued"
    PRIORITY="3"
    TAGS="robot,continue"
else
    TITLE="Claude Code Completed"
    PRIORITY="3"
    TAGS="robot,checkered_flag"
fi

# Create notification message
MESSAGE="Session: ${SESSION_ID}
Time: ${TIMESTAMP}
Transcript: ${TRANSCRIPT_PATH}"

# Send notification to ntfy.sh
curl -s \
    -H "Title: ${TITLE}" \
    -H "Priority: ${PRIORITY}" \
    -H "Tags: ${TAGS}" \
    -d "${MESSAGE}" \
    "${NTFY_URL}" > /dev/null 2>&1

# Exit successfully (return empty JSON to not block Claude)
echo "{}"
exit 0
