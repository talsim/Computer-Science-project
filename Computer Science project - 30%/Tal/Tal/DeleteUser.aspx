<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="Tal.DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">
        function confirmRemove() {
            ans = confirm("האם אתה מאשר מחיקה?");
            return ans;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" method="post" onsubmit="return confirmRemove()">
        <% if ((bool)Session["admin"])
            { %>
        <%ShowList(); %>
        <p style="text-align:center; color:black;">
            הקלד שורה למחיקה
            <input type="text" id="line" name="line" size="10" />
            <input type="submit" value="מחק" />
            <% showMessage(); %>
        </p>
        <% if (Request.QueryString.Count != 0)
            {
                Response.Write("<p style='text-align:center;color:red;'>" + "הרשומה " + Request.QueryString["line"].ToString() + " נמחקה בהצלחה" + "</p>");
            }
         }
            else
            {
                Response.Write("<p style='text-align:center;font-size:20px'> מיועד למנהלים בלבד </p>");
            } %>
    </form>
</asp:Content>
