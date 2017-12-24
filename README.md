# LinuxDotNet
## ASP.NET Core MVC web app with Entity Framework Core in SQL Server on Linux

This application was created in a Windows Sub system for Linux dev environment
To see how to, check this Url:
#### http://subhankarsarkar.com/windows-subsystem-linux-build-asp-net-core-mvc-web-app/

The SQL server database is created in an Linux Environment with LinuxDotNet database and a simple Customer table. 
To see how check this Url:
#### http://subhankarsarkar.com/sql-server-on-linux-install-and-use-it-with-sql-operations-studio/

Since it's a database first approach we had to scaffold it and made necessary adjustments as follows -

Install Entity Framework (this was done using visual studio), this can be done in Linux bash also by following commands

#### dotnet add package Microsoft.EntityFrameworkCore.Sqlite
#### dotnet add package Microsoft.EntityFrameworkCore.Design
#### dotnet restore

#### In Visual Studio perform the following steps
1. At menu bar Tools -> NuGet Package Manager -> Package Manager Console

2. Run Install-Package Microsoft.EntityFrameworkCore.SqlServer

3. Run Install-Package Microsoft.EntityFrameworkCore.Tools –Pre

4. Run Install-Package Microsoft.EntityFrameworkCore.SqlServer.Design

#### Reverse engineer the model by command

Modify the appsettings.json file and add this -

#### {
 #### "ConnectionStrings": {
  ####  "LinuxDotNetCoreEF": "Data Source=linux vm address;Database=LinuxDotNet;User Id=sa;Password=sa password;"
####  },
  
Run below command at Package Manager Console

#### Scaffold-DbContext "Data Source=linux vm address;Database=LinuxDotNet;User Id=sa;Password=sa password created while installation of SQL server;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models

Simalarly you can do so in the Linux bash as well with the following commnd
#### dotnet ef dbcontext scaffold


• The reverse engineer process created entity classes and a derived context based on the schema of the existing database. The entity classes are simple C# objects that represent the data you will be querying and saving.

• Open the LinuxDotNetContext.cs, add a static field ConnectingString, and update the OnConfiguring event handler as below
 
 #### public static string ConnectionString { get; set; }
 #### protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
  #### {
  ####    optionsBuilder.UseSqlServer(ConnectionString);
  #### }
  
• Open Startup.cs, and add below code in ConfigureServices(IServiceCollection services)

#### public void ConfigureServices(IServiceCollection services)
#### {
  ####    LinuxDotNetContext.ConnectionString = Configuration.GetConnectionString("LinuxDotNetCoreEF");
  ####    services.AddMvc();
 #### }
 
 Now run it in either using bash (dotnet run) or from Visual Studio. You should see the Customer table is populated in the Index page.
