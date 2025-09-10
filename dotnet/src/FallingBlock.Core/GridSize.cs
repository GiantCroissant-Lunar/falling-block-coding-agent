namespace FallingBlock.Core;

/// <summary>
/// Simple immutable grid size for the playfield.
/// </summary>
public readonly record struct GridSize(int Columns, int Rows)
{
    public static GridSize Default => new(10, 20);
}
