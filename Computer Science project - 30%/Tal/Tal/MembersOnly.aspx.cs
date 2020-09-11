using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tal.App_Code;
using System.Data;
using System.Data.SqlClient;

namespace Tal
{
    
    public partial class MembersOnly : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            string dbPath = this.MapPath("App_Data/members.mdf");
            DAL dal = new DAL(dbPath);
            string strSql = "SELECT * FROM users";
            ds = dal.GetDataSet(strSql);
        }
        public void ShowList()
        {
            Utils.ShowList(ds, Response);
        }
    }
}