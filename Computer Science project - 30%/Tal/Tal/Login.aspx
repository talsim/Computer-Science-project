<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	
    <title>טופס התחברות לחבר רשום</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<form id="registerUsers" method="post" runat="server"  >
 <br />
 <br />
<table border-collapse: collapse; border: 1px solid black; style="margin: 0 auto"; 
                class="Tarea" dir="rtl">
     <thead >
 <tr style="text-align:center" >
 <th colspan ="3">טופס התחברות</th>
 </tr>
     </thead>
 <tr>
 <td>שם משתמש</td>
 <td><input type="text" id="username" name="username" size="15"  /></td>
<td></td>
 </tr>
 <tr>
 <td>סיסמא</td>
 <td ><input type="password" id="password" name="password" size="6" /></td>
 <td></td>
            </tr>


            <tr>

                <td colspan="2">
                    <input type="submit" value="שלח"/>
                    <input type="reset" value="נקה" /></td>

            </tr>
                <%showMessege(); %>
                </table>
    </form>
</asp:Content>
