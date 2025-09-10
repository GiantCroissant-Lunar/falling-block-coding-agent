using FallingBlock.Core;

Console.WriteLine("Falling Block — bootstrap running.");
var engine = new GameEngine(GridSize.Default);
Console.WriteLine($"Grid: {engine.Size.Columns}x{engine.Size.Rows}");
