using Dapper;
using MySql.Data;
using Microsoft.Extensions.Configuration;

namespace UploadFilesLibrary.DataAccess;

public class SqlDataAccess : ISqlDataAccess
{
    private readonly IConfiguration _config;

    public SqlDataAccess(IConfiguration config)
    {
        _config = config;
    }

    public async Task<List<T>> LoadData<T>(string storedProc, string connectionName, object? parameters)
    {
        string connectionString = _config.GetConnectionString("Default") ?? throw new Exception($"Connection string missing at {connectionName}");

        using var connection = new MySql.Data.MySqlClient.MySqlConnection(connectionString);

        var rows = await connection.QueryAsync<T>(storedProc, parameters, commandType: System.Data.CommandType.StoredProcedure);

        return rows.ToList();
    }

    public async Task SaveData(string storedProc, string connectionName, object parameters)
    {
        string connectionString = _config.GetConnectionString("Default") ?? throw new Exception($"Connection string missing at {connectionName}");

        using var connection = new MySql.Data.MySqlClient.MySqlConnection(connectionString);

        await connection.ExecuteAsync(storedProc, parameters, commandType: System.Data.CommandType.StoredProcedure);
        
    }
}