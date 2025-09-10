#!/bin/bash
set -e

echo "🤖 Copilot Agent Test Script"
echo "============================="
echo

# Check if AGENTS.md exists
if [ ! -f "AGENTS.md" ]; then
    echo "❌ AGENTS.md not found in repository root"
    exit 1
fi

echo "✅ AGENTS.md found"

# Check if the ping test workflow exists
if [ ! -f ".github/workflows/copilot-agent-ping-test.yml" ]; then
    echo "❌ Copilot agent ping test workflow not found"
    exit 1
fi

echo "✅ Copilot agent ping test workflow found"

# Validate workflow YAML syntax
echo "🔍 Validating workflow YAML syntax..."
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/copilot-agent-ping-test.yml'))"
if [ $? -eq 0 ]; then
    echo "✅ Workflow YAML syntax is valid"
else
    echo "❌ Workflow YAML syntax is invalid"
    exit 1
fi

# Check for required workflow permissions
echo "🔍 Checking workflow permissions..."
if grep -q "pull-requests: write" ".github/workflows/copilot-agent-ping-test.yml"; then
    echo "✅ Workflow has pull-requests write permission"
else
    echo "❌ Workflow missing pull-requests write permission"
    exit 1
fi

if grep -q "issues: write" ".github/workflows/copilot-agent-ping-test.yml"; then
    echo "✅ Workflow has issues write permission"
else
    echo "❌ Workflow missing issues write permission"
    exit 1
fi

echo
echo "🎉 All Copilot agent prerequisites are met!"
echo
echo "To run the ping test:"
echo "1. Go to Actions → Copilot Agent Ping Test"
echo "2. Click 'Run workflow'"
echo "3. Optionally specify a PR number"
echo "4. Monitor results in workflow logs and PR comments"
echo
echo "Or run manually on a PR by commenting:"
echo "  Copilot, please respond with a simple hello"