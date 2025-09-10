# Copilot Agent Testing

This document explains how to test and verify GitHub Copilot Coding Agent functionality in this repository.

## Ping Test

The **Copilot Agent Ping Test** workflow verifies that the GitHub Copilot Coding Agent is properly configured and responsive in PR contexts.

### How it works

1. **Automatic trigger**: Runs automatically when PRs are opened/reopened
2. **Manual trigger**: Can be run manually via workflow dispatch
3. **Ping process**: Posts a test comment asking the agent to respond
4. **Validation**: Waits up to 5 minutes for an agent response
5. **Results**: Reports success/failure with timing information

### Running the test manually

#### Via GitHub Actions UI
1. Go to Actions → Copilot Agent Ping Test
2. Click "Run workflow"
3. Optionally specify a PR number to test
4. Monitor the workflow run and check PR comments

#### Via API/CLI
```bash
gh workflow run copilot-agent-ping-test.yml
# Or for a specific PR:
gh workflow run copilot-agent-ping-test.yml -f pr_number=123
```

### Expected results

#### ✅ Success
- Agent responds within 5 minutes
- Success comment posted with response time
- Workflow completes successfully

#### ❌ Failure/Timeout
- No agent response within 5 minutes
- Failure comment posted with troubleshooting tips
- Workflow exits with error code

### Troubleshooting

If the ping test fails:

1. **Check agent enablement**:
   - Repository Settings → Copilot → Coding Agent should be enabled
   - Ensure `AGENTS.md` exists on the default branch

2. **Check permissions**:
   - Agent needs appropriate repository permissions
   - Organization settings may restrict agent access

3. **Manual verification**:
   - Try commenting on a PR: "Copilot, please respond with a simple hello"
   - Agent should respond within a few minutes

4. **Check workflow logs**:
   - Review the ping test workflow logs for detailed error messages
   - Look for API rate limits or authentication issues

### Integration with AGENTS.md

This ping test validates the agent workflow described in `AGENTS.md`. It ensures:

- Agents can be invoked via PR comments
- The coordination workflow is functional
- Repository configuration supports agent-driven development

### Usage in RFC implementation

Before starting RFC implementation with agents:

1. Run the ping test to verify agent availability
2. Use successful ping as a prerequisite for agent task assignment
3. Include ping test results in RFC implementation checkpoints

## Manual Testing

For manual agent testing beyond the automated ping:

### Basic responsiveness
```
Copilot, please acknowledge this message.
```

### RFC-specific testing
```
Copilot, review RFC 0003 and confirm you understand the requirements.
```

### Task assignment testing
```
Copilot, implement RFC 0003 per AGENTS.md. Create a branch and PR. Stop when build and tests are green.
```

## Integration with CI/CD

The ping test integrates with the existing workflow ecosystem:

- **dotnet-ci.yml**: Ensures builds work before agent tasks
- **rfc-*.yml**: RFC state management works with agent coordination
- **pr-autoupdate.yml**: PR maintenance supports agent workflows

This creates a complete testing pipeline for agent-driven development.