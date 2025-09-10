using FallingBlock.Core;

#pragma warning disable CA1303 // Do not pass literals as localized parameters - bootstrap message only
Console.WriteLine("Falling Block — bootstrap running.");
#pragma warning restore CA1303
var engine = new GameEngine(GridSize.Default);
Console.WriteLine($"Grid: {engine.Size.Columns}x{engine.Size.Rows}");
