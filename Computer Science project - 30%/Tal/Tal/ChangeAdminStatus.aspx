<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeAdminStatus.aspx.cs" Inherits="Tal.ChangeAdminStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" method="post">
        <% if ((bool)Session["admin"])
            {
                ShowList(); %>
        <div style="text-align: center;">
            <p style="text-align: center; color: black;">
                הקלד שורה לשינוי סטטוס
            <input type="text" id="line" name="line" size="10" />
                <input type="submit" value="שנה" />
                <%showMessage(); %>
            </p>
            
                <%if (Request.QueryString.Count != 0)
                    {
                        
                        Response.Write("<p style='text-align:center;color:red;'>סטטוס " + Request.QueryString["line"].ToString() + " שונה</p>");
                    }
                %>

        </div>
    <% }
        else
        {%>
    <p style="text-align: center;"><% Response.Write("מיועד למנהלים בלבד"); %></p>
    <% } %>
        </form>
</asp:Content>
