using Serilog;

Log.Logger = new LoggerConfiguration()
	.WriteTo.Console()
	.CreateLogger();

Log.Verbose("hi B");
Log.Debug("hi B");
Log.Information("hi B");
Log.Warning("hi B");
Log.Error("hi B");
Log.Fatal("hi B");

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog();

var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.Run();
