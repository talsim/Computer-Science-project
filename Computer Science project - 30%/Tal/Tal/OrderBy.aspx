<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderBy.aspx.cs" Inherits="Tal.OrderBy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function checkDropDownList() {
            var flag = true;
            var field = document.getElementById("field").value;
            var orderBy = document.getElementById("orderBy").value;
            if ((field == "blank") || (orderBy == "blank")) {
                document.getElementById("mOrderBy").value = "בחר שדה ומיון";
                document.getElementById("mOrderBy").style.display = "inline";
                flag = false;
            }
            else
                document.getElementById("mOrderBy").style.display = "none";
            return flag;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" method="post" onsubmit="return checkDropDownList()">
        <% if ((bool)Session["admin"])
            { %>
        <% ShowList(); %>
        <div style="text-align: center;">
            <select name="field" id="field">
                <option value="blank" selected>בחר שדה למיון</option>
                <option value="username">שם משתמש</option>
                <option value="email">מייל</option>
                <option value="megama">מגמה</option>
                <option value="birthyear">שנת לידה</option>
                <option value="gender">מין</option>
            </select>

            <select name="orderBy" id="orderBy">
                <option value="blank" selected>בחר מיון</option>
                <option value="ASC">עולה</option>
                <option value="DESC">יורד</option>
            </select>
            <input type="text" id="mOrderBy" name="mOrderBy" size="7"
                style="display: none; background-color: mediumspringgreen; font-weight: bold;" disabled />
            <input type="submit" value="בצע" />
        </div>
        <% }
            else
            { %>
        <p style="text-align: center;"
            <%Response.Write("מיועד למנהלים בלבד"); %>>
        </p>
        <% } %>
    </form>
</asp:Content>
