<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembersOnly.aspx.cs" Inherits="Tal.MembersOnly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%  if (Session["user"].ToString() == "אורח")
        {
            Response.Write("מיועד לחברים בלבד!\n");
        }
        else // MembersOnly code goes here ↓
        { %>
    <script>
        var randomlinks = new Array()

        randomlinks[0] = "https://www.jhs.ac.in/6-reasons-why-sports-is-important-in-a-students-life.php"
        randomlinks[1] = "https://www.quora.com/What-are-the-benefits-of-playing-a-sport"
        randomlinks[2] = "https://www.sportanddev.org/en/learn-more/sport-and-health"
        randomlinks[3] = "https://www.sportanddev.org/en/learn-more/health/health-benefits-sport-and-physical-activity"
        randomlinks[4] = "https://www.realbuzz.com/articles-interests/sports-activities/article/the-health-and-fitness-benefits-of-sport/"
        randomlinks[5] = "https://quickdraw.withgoogle.com/"
        randomlinks[6] = "https://www.healthline.com/health/mental-benefits-sports"

        function randomlink() {
            return randomlinks[Math.floor(Math.random() * randomlinks.length)]
        }

        function openInNewTab(url) {
            var win = window.open(url, '_blank');
            win.focus();
        }
    </script>
    <form method="post">
    <div style="text-align:center">
      <a onclick="openInNewTab(randomlink());">Click to get motivation</a>
    </div>
    </form>
    <% } %>
</asp:Content>
