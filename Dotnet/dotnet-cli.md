# Dotnet

## Check version of Dotnet installed

- `dotnet --list-sdks`
- `dotnet --list-runtimes`
- `dotnet --info`
- `dotnet --version`

## Create new Dontent solution
- `dotnet new sln -o [SolutionName]`
- Add project in Solution
  - `dotnet sln [SolutionName.sln] add [ProjectFile.csproj]`
- Find list of projects in Solution
  - `dotnet sln [SolutionName.sln] list`

### Examples
- dotnet sln add todo-app/todo-app.csproj
- dotnet sln remove todo-app/todo-app.csproj

- dotnet new sln -n [GrpcClient]
- dotnet sln .\GrpcClient.sln add .\Book\Book.csproj

## Create new Dotnet projects
- List dotnet projects
  - `dotnet new --list`
- Create console app
  - `dotnet new console -o [ApplicationName]`
- Create web app project
  - `dotnet new webapi -n [ProjectName]`

## Dotnet Build and Run project/Solution
- `dotnet build`
  - `dotnet myapp.dll`
- Build solution with configuration
  - `dotnet build Solution.sln /p:Configuration=Debug /p:Platform="Any CPU"`
- `dotnet run`
- Run dotnet project with kestrel server
  - `dotnet run --launch-profile "SampleApp"` 

## Dotnet restore
restore the project dependencies
- `dotnet restore`
- `dotnet restore --verbosity detailed`
- `dotnet restore ./projects/app1/app1.csproj`

## Nuget packages
- Add nuget package
  - `dotnet add {TodoApi.csproj} package Swashbuckle.AspNetCore -v 5.0.0`
- List of nuget package location on the system
  - `dotnet nuget locals all --list`
- Using dependency tree find list of packages in the project
  - `dotnet list package`
  - `dotnet list Clusters.sln package --include-transitive > C:\Users\kamahale\Downloads\clusters_packages1.md`
  - `dotnet msbuild .\Clusters.sln /t:GenerateRestoreGraphFile /p:RestoreGraphOutputPath=C:\Users\kamahale\Downloads\bbc_di.md`

## Code coverage
- dotnet test --collect "Code Coverage"
- dotnet test --collect:"XPlat Code Coverage"

## Check vulnerabilities
- `dotnet list Clusters.sln package --vulnerable` 

## Dotnet pack and publish
- We can create Nuget package out of a project and publish it to Nuget reporsitory
- we need `.nupkg` file to pulish

### Pack
- Visual Studio 2019 
  - Open project - Set Solution/project configuration `release` 
  - Right click project & click `pack` 
  - output window - copy `nupkg` path
-	**OR**
- Terminal using dotnet cli 
  - cd into project directory 
  - `dotnet pack`
  - copy the file path
- **OR**
- Using MSBuild
  - Terminal, if msbuild is in path or Visual Studio 2019 Developer Command Prompt
  - Cd project where csproj file is present
  - `msbuild -t:pack`
  - copy the file path

### Publish:
- nuget
  - `nuget.exe push -Source "[SourceRepository]" -ApiKey az [FullPathProjectName.nupkg] 

- **OR**
- Using dotnet CLI
  - `dotnet nuget push [FullPathProjectName.nupkg] --api-key {APIKey} --source [SourceRepository]`
  - example 
    - `dotnet nuget push D:\AzureDotnetSolution\AppLogger\bin\Release\TestProjectAppLogger.1.0.0.nupkg --api-key [APIKey] --source https://api.nuget.org/v3/index.json`