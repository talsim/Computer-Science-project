using System;
using System.Data;
using System.Linq;
using Tal.App_Code;

namespace Tal
{
    public partial class signup1 : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        protected string msg = "";
        protected string username = "";
        protected string password = "";
        protected string BirthYear = "";
        protected string hobby = "";
        protected bool hobbySport = false;
        protected bool hobbyMusic = false;
        protected bool hobbyPainting = false;
        protected bool admin = false;
        protected string email = "";
        protected string phoneNumber = "";
        protected string megama = "";
        protected string gender = "";
        protected string profession = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                username = Request.Form["username"];
                password = Request.Form["pass"];
                BirthYear = Request.Form["birthDateYear"];
                hobby = Request.Form["hobby"].ToString();
                if (hobby.Contains('s')) hobbySport = true; 
                if (hobby.Contains('m')) hobbyMusic = true; 
                if (hobby.Contains('p')) hobbyPainting = true; 
                email = Request.Form["mail"]; 
                phoneNumber = Request.Form["phoneNumber"]; 
                megama = Request.Form["megama"]; 
                gender = Request.Form["gender"];
                profession = Request.Form["profession"];

                // get username from database
                string dbPath = this.MapPath("App_Data/members.mdf");
                DAL dal = new DAL(dbPath);
                string strSql = "SELECT * From users WHERE Username = N'" + username + "'";
                ds = dal.GetDataSet(strSql);

                if (ds.Tables[0].Rows.Count == 0) // if username doesn't exist in database
                {
                    // build the row to add
                    DataRow dr = ds.Tables[0].NewRow();
                    dr["username"] = username;
                    dr["password"] = password;
                    dr["BirthYear"] = int.Parse(BirthYear);
                    dr["sport"] = hobbySport;
                    dr["music"] = hobbyMusic;
                    dr["painting"] = hobbyPainting;
                    dr["Email"] = email;
                    dr["admin"] = admin;
                    dr["gender"] = gender;
                    dr["phoneNumber"] = phoneNumber;
                    dr["profession"] = profession;
                    dr["megama"] = megama;

                    // add username to database
                    ds.Tables[0].Rows.Add(dr);
                    dal.SetDataSet(ds);
                    Session["user"] = username;
                    Response.Redirect("Default.aspx");
                }
                else // username already exists in database
                {
                    msg = "שם משתמש תפוס - הכנס שם משתמש אחר";
                }
                    
            }
        }
        public void showMessage()
        {
            Response.Write("<p style='text-align:center;color:red;'>" + msg + "</p>");
        }
    }
}