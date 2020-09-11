using System;
using System.Data;
using Tal.App_Code;

namespace Tal
{
    public partial class Login : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        protected string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                string dbPath = this.MapPath("App_Data/members.mdf");
                DAL dal = new DAL(dbPath);
                string strSql = "Select * From users Where Username = N'"
                    + username + "' and password = N'" + password + "'";
                ds = dal.GetDataSet(strSql);
                if (ds.Tables[0].Rows.Count == 1)
                {
                    Session["user"] = username;
                    if ((bool)ds.Tables[0].Rows[0]["admin"] == true)
                        Session["admin"] = true;

                    Response.Redirect("Default.aspx");
                }
                else
                    msg = "טעות בשם משתמש או בסיסמה";

            }
        }
        public void showMessege()
        {
            Response.Write("<p style='text-align:center;color:red;'>" + msg + "</p> ");
        }
    }
}