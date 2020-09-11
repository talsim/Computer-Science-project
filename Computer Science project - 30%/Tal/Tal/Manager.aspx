<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Tal.Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if ((bool)Session["admin"])
        {%>
        <h2 style="text-align:center">
            <asp:HyperLink ID="DeleteUser" NavigateUrl="DeleteUser.aspx"
            runat="server">מחיקת משתמש</asp:HyperLink>

            <asp:HyperLink ID="ChangeAdminStatus" NavigateUrl="ChangeAdminStatus.aspx"
            runat="server">שינוי סטטוס של משתמש</asp:HyperLink>

            <asp:HyperLink ID="OrderBy" NavigateUrl="OrderBy.aspx"
            runat="server">מיון שדות</asp:HyperLink>
        </h2>
    <%}
        else
        {
            Response.Write("מיועד למנהלים בלבד!\n");
        } %>
</asp:Content>
