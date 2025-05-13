var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors();

var app = builder.Build();

app.UseCors(x => x.AllowAnyOrigin());

app.MapGet("/podcasts", () => new List<string>
{
    "Podcast 1",
    "Podcast 2",
    "Podcast 3",
    "Podcast 4",
});

app.Run();