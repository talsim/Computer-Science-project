<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Tal.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 {
            font-family: 'Open Sans', sans-serif;
            font-size: 24px;
            font-weight: 300;
            line-height: 32px;
            margin: 0 0 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <h1 style="text-align: center; font-family: fantasy;">מוצרים חדשים באתר</h1>
    <table style="width: 70%; margin-left: 15%; margin-right: 15%;">
        <tr>
            <td>
                <h2>מתקן אופניים ביתי AD6</h2>
                <img src="images/product3.jfif" alt="מתקן אופניים מקצועי"
                    style="width: auto; height: 300px;" />
            </>
            <td>&nbsp&nbsp
				<!--רווח בין תמונה-->
            </td>
            <td>
                <h2>הספסל הקלאסי לשימוש בפיזיותרפיה</h2>
                <img src="images/product2.jfif" alt="מתקן עבור ג'ימנסטיקס"
                    style="width: 335px; height: 300px;" />
            </td>
            <td>&nbsp&nbsp 
				<!--רווח בין תמונה-->
            </td>
            <td>
                <h2>מטריצה מרומצת - מחזק ומייצב את הגוף</h2>
                <img src="images/product1.jfif" alt="מתקן ישיבה"
                    style="width: auto; height: 300px;" />
            </td>
        </tr>
    </table>

</asp:Content>
