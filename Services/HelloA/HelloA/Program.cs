using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateLogger();

Log.Verbose("hi A");
Log.Debug("hi A");
Log.Information("hi A");
Log.Warning("hi A");
Log.Error("hi A");
Log.Fatal("hi A");

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog();

var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.Run();
