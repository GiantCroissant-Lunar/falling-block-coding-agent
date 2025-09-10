# Falling Block Coding Agent

A console TUI Tetris game built with .NET 9, Terminal.GUI v2, and Reactive MVVM architecture, developed through agent-driven collaboration.

## Quick Start

This repository uses GitHub Copilot Coding Agents for development coordination. See [AGENTS.md](AGENTS.md) for the full workflow.

### Testing Agent Integration

To verify Copilot agent functionality:

```bash
# Run validation script
./docs/test-copilot-agent.sh

# Or manually trigger the ping test
# Go to Actions → Copilot Agent Ping Test → Run workflow
```

See [docs/COPILOT-AGENT-TESTING.md](docs/COPILOT-AGENT-TESTING.md) for detailed testing procedures.

### RFC-Driven Development

This project follows an RFC (Request for Comments) process for coordinated development:

- **RFCs**: Located in `docs/RFC/` - define features, architecture, and implementation plans
- **Index**: `docs/RFC/index.yaml` - tracks RFC dependencies and states
- **Agent Coordination**: Agents implement RFCs following the workflow in `AGENTS.md`

Current RFC status and dependencies can be found in the [RFC index](docs/RFC/index.yaml).

## Architecture

Building a modern Tetris implementation with:
- **.NET 9** - Latest .NET runtime
- **Terminal.GUI v2** - Cross-platform console UI framework  
- **Reactive MVVM** - Reactive Extensions with Model-View-ViewModel pattern
- **Agent-Driven Development** - GitHub Copilot agents coordinate implementation

## Getting Started

1. **Prerequisites**: .NET 9 SDK
2. **Agent Setup**: Ensure Copilot Coding Agent is enabled (see AGENTS.md)
3. **Validation**: Run `./docs/test-copilot-agent.sh` to verify setup
4. **Development**: Follow RFC workflow for feature implementation

## Project Status

This project is in active development using agent coordination. Check:
- [RFC Index](docs/RFC/index.yaml) for current implementation status
- [Actions](../../actions) for ongoing workflows
- [AGENTS.md](AGENTS.md) for coordination guidelines

The codebase will be built incrementally through small, RFC-driven PRs managed by coordinated agents.
