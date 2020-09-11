using System;
using System.Web;
using System.Data;
using System.Linq;

namespace Tal.App_Code
{
    public class Utils
    {
        public static void ShowList(DataSet ds, HttpResponse response)
        {
            int counter = 0;
            response.Write("</br></br>"); // new line
            // ↓ title row start ↓
            response.Write("<p style='text-align:center; font-size:20px; '>רשימת חברים</p>");
            response.Write("<table border='1' style='margin-right:auto;margin-left:auto;'> <tr>"); // opening <table>
            response.Write("<td> # </td>");
            response.Write("<td> שם משתמש </td> <td> סיסמה </td>");
            response.Write("<td> מייל </td>");
            response.Write("<td> שנת לידה</td> <td> מגמה</td>");
            response.Write("<td> מנהל</td> <td> מין</td> </tr>");

            // ↑ title row end ↑
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                response.Write("<tr>"); // ← data row start
                response.Write("<td>" + counter + "</td>"); // row counter
                response.Write("<td>" + row["username"].ToString() + "</td>"); // username field
                response.Write("<td>" + row["password"].ToString() + "</td>"); // password field
                response.Write("<td>" + row["email"].ToString() + "</td>"); // email field
                response.Write("<td>" + row["BirthYear"].ToString() + "</td>"); // birthYear field
                response.Write("<td>" + row["megama"].ToString() + "</td>"); // megama field
                response.Write("<td>" + row["admin"].ToString() + "</td>"); // admin field
                response.Write("<td>" + row["gender"].ToString() + "</td>"); // gender field
                response.Write("</tr>"); // ← data row end
                counter++;
            }
            response.Write("</table>"); // closing <\table>
            response.Write("<p style='text-align:center;color:red;'>מספר חברים רשומים: " + ds.Tables[0].Rows.Count + "</p> "); // members count
        }
        public static string checkLine(String lineStr, DataSet ds)
        {
            String msg = "";

            if (IsAllDigits(lineStr)) // if line is a number
            {
                int line = Int32.Parse(lineStr);
                if (!(line >= 0 && line <= ds.Tables[0].Rows.Count - 1)) // if line is legal - between 0 to (members count)
                    msg = "הכנס בבקשה מספר שורה תקין";
                else if ((ds.Tables[0].Rows[line][0].ToString() == "admin"))
                    msg = "לא ניתן לשנות מנהל!";
            }
            else
                msg = "הכנס בבקשה מספר";
            

            return msg;
        }
        private static bool IsAllDigits(string s)
        {
            foreach (char c in s)
            {
                if (!Char.IsDigit(c))
                    return false;
            }
            return true;
        }
    }
}