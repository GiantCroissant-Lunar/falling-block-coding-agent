# Toolchain & CPVM

This repository pins the .NET SDK and manages NuGet package versions centrally.

- .NET SDK is pinned via `global.json` to 9.0.x.
- Central Package Version Management (CPVM) is enabled via `Directory.Packages.props`.

Packages pinned include:
- Terminal.Gui v2, ReactiveUI, System.Reactive
- xUnit, xunit.runner.visualstudio, FluentAssertions

Usage:
- Install .NET 9 SDK.
- Restore/build normally; CPVM pins apply across all projects.
