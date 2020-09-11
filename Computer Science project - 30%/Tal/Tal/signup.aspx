<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Tal.signup1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/signup/utils.js"></script>
    <link href="Content/global.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server" onsubmit="return checkForm()">
        <br />
        <br />
        <table border-collapse: collapse; border: 1px solid black; style="margin:auto;"; 
                dir="rtl">
            <thead>
                <tr style="text-align: center">
                    <th class="note" colspan="3" style="font-size: 22px;">טופס הרשמות לאתר</th>
                </tr>
            </thead>
            <tr style="height: 10px;">
                <td colspan="3"></td>
            </tr>
            <tr>
                <td>שם משתמש</td>
                <td>
                    <input type="text" id="username" name="username" value="<%Response.Write(username); %>" size="15" /></td>
                <td>
                    <input type="text" id="mUsername" name="musername" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>סיסמא</td>
                <td>
                    <input type="password" id="pass" name="pass" value="<%Response.Write(password);%>" size="6" /></td>
                <td>
                    <input type="text" id="mPassword" name="mPassword" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>אימות סיסמא</td>
                <td>
                    <input type="password" id="validPass" name="validPass" value="<%Response.Write(password);%>" size="6" /></td>
                <td>
                    <input type="text" id="mValidPass" name="mValidPass" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>מספר טלפון</td>
                <td>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="<%Response.Write(phoneNumber);%>" size="7" />
                <td>
                    <input type="text" id="mPhone" name="mPhone" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/>
                    <input type="text" id="mAreacode" name="mAreacode" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>שנת תאריך לידה</td>
                <td>
                    <input type="text" id="birthDateYear" name="birthDateYear" value="<% 
                            Response.Write(BirthYear); %>"
                        size="10" />
                </td>
                <td>
                    <input type="text" id="mbirthDateYear" name="mbirthDateYear" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>אימייל</td>
                <td>
                    <input type="text" id="mail" name="mail" value="<%Response.Write(email);%>" size="30" /></td>
                <td>
                    <input type="text" id="mMail" name="mMail" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>מגמה</td>
                <td>
                    <% if (megama == "הנדסת תוכנה")
                        { %>
                    <input type="radio" name="megama" id="m1" value="הנדסת תוכנה" checked />
                    הנדסת תוכנה
                    <br />
                    <% }
                        else
                        { %>
                    <input type="radio" name="megama" id="radiom1" value="הנדסת תוכנה" />
                    הנדסת תוכנה
                    <br />
                    <% }
                        if (megama == "אלקטרוניקה")
                        { %>
                    <input type="radio" name="megama" id="m2" value="אלקטרוניקה" checked />
                    אלקטרוניקה
                    <br />
                    <% }
                        else
                        { %>
                    <input type="radio" name="megama" id="radiom2" value="אלקטרוניקה" />
                    אלקטרוניקה
                    <br />
                    <% }
                        if (megama == "ביוטכנולוגיה")
                        { %>
                    <input type="radio" name="megama" id="m3" value="ביוטכנולוגיה" checked />
                    ביוטכנולוגיה<br />
                    <% }
                        else
                        { %>
                    <input type="radio" name="megama" id="radiom3" value="ביוטכנולוגיה" />
                    ביוטכנולוגיה<br />
                    <% } %>
                </td>
                <td>
                    <input type="text" id="mMegama" name="mMegama" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>תחביבים</td>
                <td>
                    <% if (hobbySport)
                        {%>
                    <input type="checkbox" name="hobby" id="hoby1" value="s" checked />ספורט
                    <% }
                        else
                        { %>
                    <input type="checkbox" name="hobby" id="hobyc1" value="s" />ספורט
                    <% }
                        if (hobbyMusic)
                        { %>
                    <input type="checkbox" name="hobby" id="hoby2" value="m" checked />נגינה
                    <% }
                        else
                        { %>
                    <input type="checkbox" name="hobby" id="hobyc2" value="m" />נגינה
                    <% }
                        if (hobbyPainting)
                        { %>
                    <input type="checkbox" name="hobby" id="hoby3" value="p" checked />ציור
                    <% }
                        else
                        { %>
                    <input type="checkbox" name="hobby" id="hobyc3" value="p" />ציור
                    <% } %>
                </td>
                <td>
                    <input type="text" id="mHobby" name="mHobby" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
            </tr>
            <tr>
                <td>מגדר</td>
                <td>
                    <% if (gender == "זכר")
                        { %>
                    <input type="radio" name="gender" id="g1" value="זכר" checked />
                    זכר
                    <br />
                    <% }
                        else
                        { %>
                    <input type="radio" name="gender" id="cg1" value="זכר" />
                    זכר
                    <br />
                    <% }
                        if (gender == "נקבה")
                        { %>
                    <input type="radio" name="gender" id="g2" value="נקבה" checked />
                    נקבה<br />
                    <% }
                        else
                        { %>
                    <input type="radio" name="gender" id="cg2" value="נקבה" />
                    נקבה<br />
                    <% } %>
                </td>
                <td>
                    <input type="text" id="mGender" name="mGender" size="15"
                        style="display: none; background-color: mediumspringgreen; font-weight: bold;"
                        disabled/></td>
                <td></td>
            </tr>
            <tr>
                <td>מקצוע</td>
                <td>
                    <select name="profession" id="profession">
                        <option value="a" selected="selected">בחר מקצוע</option>
                        <option value="b">מכירות</option>
                        <option value="c">הייטק</option>
                        <option value="c">ייצור</option>
                        <option value="e">ציבורי</option>
                        <option value="f">פיננסי</option>
                        <option value="g">אחר</option>
                    </select>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>הערות</td>
                <td>
                    <textarea rows="4" cols="50" name="remark" id="remark" placeholder="איזור טקסט להערות">
</textarea></td>
                <td></td>
            </tr>


            <tr>

                <td colspan="2">
                    <input type="submit" value="שלח" class="btnSubmit"/>
                    <input type="reset" value="נקה"/></td>

            </tr>
            <%showMessage();%>
        </table>
    </form>
</asp:Content>