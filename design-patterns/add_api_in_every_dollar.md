# Add a New API Interface in Every Dollar

## Create a new project at the root level.
- R-click root folder > add > New Project

## Set up project.

### Import your new project into EveryDollar
- EveryDollar.csproj

### Import necessary dependencies into your new project
- find ProjectName.csproj
- add or remove PackageReferences and Project Reference as needed.

### Set up environment configs to URLs
- MVVM > EveryDollar.Models > Configuration > 
  - EnvironmentSettings.cs > ` public virtual string ServiceHostName { get; }`
  - SpecificEnvironmentName.cs > `public override string ServiceHostName => "url"`

## Add new client
- Startup.cs

```cs
public static IServiceProvider Initialize(this IServiceCollection services)
{
    // Services
    services.AddBffClient();
}
```
```cs
...
private static void AddBffClient(this IServiceCollection services)
{
    services.AddSingleton(sp =>
    {
        var env = sp.GetRequiredService<EnvironmentSettings>();
        var uri = new Uri(env.EveryDollarMobileBffHostName);
        return new BffClientConfig(uri.Host, AppConstants.ClientPort, AppConstants.ClientDefaultTimeOut);
    });

    services.AddSingleton<IBffClient, BffClient>();
}
...
```

## Create a Services directory.


# Questions
- How does EveryDollar.sln get updated?
- 
