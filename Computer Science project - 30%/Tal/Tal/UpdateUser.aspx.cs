using System;
using System.Data;
using System.Linq;
using Tal.App_Code;

namespace Tal
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        protected string msg = "";
        protected string username = "";
        protected string password = "";
        protected int BirthYear = 0;
        protected string hobby = "";
        protected bool hobbySport = false;
        protected bool hobbyMusic = false;
        protected bool hobbyPainting = false;
        protected bool admin = false;
        protected string email = "";
        protected string areaCode = "";
        protected string phoneNumber = "";
        protected string megama = "";
        protected string gender = "";
        protected string profession = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string dbPath = this.MapPath("App_Data/members.mdf");
            DAL dal = new DAL(dbPath);
            string strSql = "SELECT * FROM users WHERE Username = N'" + Session["user"] + "'";
            ds = dal.GetDataSet(strSql);

            if (this.IsPostBack) // if user entered new details → update database
            {
                // fill the new details
                username = Request.Form["username"];
                password = Request.Form["pass"];
                BirthYear = int.Parse(Request.Form["birthDateYear"]);
                hobby = Request.Form["hobby"].ToString();
                if (hobby.Contains('s')) hobbySport = true;
                if (hobby.Contains('m')) hobbyMusic = true;
                if (hobby.Contains('p')) hobbyPainting = true;
                email = Request.Form["mail"];
                phoneNumber = Request.Form["phoneNumber"];
                megama = Request.Form["megama"];
                gender = Request.Form["gender"];
                profession = Request.Form["profession"];

                // update dataset with the new details
                ds.Tables[0].Rows[0]["password"] = password;
                ds.Tables[0].Rows[0]["email"] = email;
                ds.Tables[0].Rows[0]["megama"] = megama;
                ds.Tables[0].Rows[0]["sport"] = hobbySport;
                ds.Tables[0].Rows[0]["music"] = hobbyMusic;
                ds.Tables[0].Rows[0]["painting"] = hobbyPainting;
                ds.Tables[0].Rows[0]["admin"] = admin;
                ds.Tables[0].Rows[0]["profession"] = profession;
                ds.Tables[0].Rows[0]["BirthYear"] = BirthYear;
                ds.Tables[0].Rows[0]["gender"] = gender;
                ds.Tables[0].Rows[0]["phoneNumber"] = phoneNumber;

                // update the database
                dal.UpdateDataSet(ds);
                msg = "הנתונים עודכנו בהצלחה";
            }
            else // user first time seeing the page → fill the fields with his details
            {
                username = ds.Tables[0].Rows[0]["username"].ToString();
                password = ds.Tables[0].Rows[0]["password"].ToString();
                email = ds.Tables[0].Rows[0]["email"].ToString();
                megama = ds.Tables[0].Rows[0]["megama"].ToString();
                hobbySport = (bool)ds.Tables[0].Rows[0]["sport"];
                hobbyMusic = (bool)ds.Tables[0].Rows[0]["music"];
                hobbyPainting = (bool)ds.Tables[0].Rows[0]["painting"];
                admin = (bool)ds.Tables[0].Rows[0]["admin"];
                profession = ds.Tables[0].Rows[0]["profession"].ToString();
                BirthYear = (int)ds.Tables[0].Rows[0]["BirthYear"];
                gender = ds.Tables[0].Rows[0]["gender"].ToString();
                phoneNumber = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
            }
        }
        public void showMessage()
        {
            Response.Write("<p style='text-align:center;color:red;'>" + msg + "</p>");
        }
    }
}