using FallingBlock.Core;
using FluentAssertions;
using Xunit;

namespace FallingBlock.Tests;

public class GridSizeTests
{
    [Fact]
    public void DefaultShouldBe10x20()
    {
        GridSize.Default.Columns.Should().Be(10);
        GridSize.Default.Rows.Should().Be(20);
    }
}
