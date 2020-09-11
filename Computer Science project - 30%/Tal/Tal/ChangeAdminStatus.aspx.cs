using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using Tal.App_Code;

namespace Tal
{
    public partial class ChangeAdminStatus : System.Web.UI.Page
    {
        public DataSet ds = null;
        protected int line = 0;
        protected string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ds = new DataSet();
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
                        ds.Tables[0].Rows[line]["admin"] = !(bool)ds.Tables[0].Rows[line]["admin"];
                        dal.UpdateDataSet(ds);
                        msg = "הסטטוס שונה בהצלחה";
                        Response.Redirect("ChangeAdminStatus.aspx?line=" + (line) + "");
                    }
                }
                else
                    msg = "הכנס בבקשה מספר שורה";
            }
        }

        public void ShowList()
        {
            Utils.ShowList(ds, Response);
        }

        public void showMessage()
        {
            Response.Write("<p style='text-align:center;color:red;'>" + msg + "</p>");
        }
    }
}