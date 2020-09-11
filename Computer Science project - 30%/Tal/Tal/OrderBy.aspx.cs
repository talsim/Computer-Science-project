using System;
using System.Data;
using Tal.App_Code;

namespace Tal
{
    public partial class OrderBy : System.Web.UI.Page
    {
        protected string field = "";
        protected string orderBy = "";
        public DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ds = new DataSet();
            string dbPath = this.MapPath("App_Data/members.mdf");
            DAL dal = new DAL(dbPath);
            string strSql = "SELECT * FROM users";
            if (this.IsPostBack)
            {
                field = Request.Form["field"];
                orderBy = Request.Form["orderBy"];
                strSql = "SELECT * FROM users ORDER BY " + field + " " + orderBy;
            }
            ds = dal.GetDataSet(strSql);
        }

        public void ShowList()
        { 
            Utils.ShowList(ds, Response);
        }
    }
}