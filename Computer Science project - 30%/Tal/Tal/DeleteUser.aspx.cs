using System;
using System.Data;
using System.Linq;
using System.Web.WebPages;
using Tal.App_Code;

namespace Tal
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        public DataSet ds = new DataSet();
        int line = 0;
        String msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string dbPath = this.MapPath("App_Data/members.mdf");
            DAL dal = new DAL(dbPath);
            string strSql = "SELECT * FROM users";
            ds = dal.GetDataSet(strSql);
            if (this.IsPostBack)
            {
                string lineStr = Request.Form["line"].ToString();
                if (!lineStr.IsEmpty())
                {
                    msg = Utils.checkLine(lineStr, ds);
                    if (msg == "") // if all OK
                    {
                        line = int.Parse(lineStr);
                        ds.Tables[0].Rows[line].Delete();
                        dal.DeleteDataSet(ds);
                        Response.Redirect("DeleteUser.aspx?line=" + (line) + "");
                    }
                }
                else
                    msg = "הכנס בבקשה מספר שורה";
            }
        }

        public void showMessage()
        {
            Response.Write("<p style='text-align:center;color:red;'>" + msg + "</p>");
        }

        public void ShowList()
        {
            Utils.ShowList(ds, Response);
        }
    }
}