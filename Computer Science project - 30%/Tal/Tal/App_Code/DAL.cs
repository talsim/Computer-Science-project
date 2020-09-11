using System.Data;
using System.Data.SqlClient;

namespace Tal.App_Code
{
    public class DAL
    {
        private string dbPath;
        private SqlConnection conn;
        private SqlCommand command;
        private SqlDataAdapter adapter;

        public DAL(string dbPath) // constructor
        {
            this.dbPath = dbPath;
            string ConnectionString = string.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename={0};
            Integrated Security=True;Connect Timeout=30", this.dbPath);
            conn = new SqlConnection(ConnectionString);
            command = new SqlCommand("", conn);
            adapter = new SqlDataAdapter(command);
        }

        public DataSet GetDataSet(string strSql)
        {
            DataSet ds = new DataSet();
            command.CommandText = strSql;
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }

        public void SetDataSet(DataSet ds)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.InsertCommand = builder.GetInsertCommand();
            conn.Open();
            adapter.Update(ds);
            conn.Close();
        }
        
        public void UpdateDataSet(DataSet ds)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.UpdateCommand = builder.GetUpdateCommand();
            conn.Open();
            adapter.Update(ds);
            conn.Close();
        }

        public void DeleteDataSet(DataSet ds)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.DeleteCommand = builder.GetDeleteCommand();
            conn.Open();
            adapter.Update(ds);
            conn.Close();
        }
    }
}