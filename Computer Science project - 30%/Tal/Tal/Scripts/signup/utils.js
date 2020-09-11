function checkForm() {
    var allCheck = true;
    if (!checkUserName()) allCheck = false;
    if (!checkPassword()) allCheck = false;
    if (!checkValidPassword()) allCheck = false;
    if (!checkBirthYear()) allCheck = false;
    if (!checkPhone()) allCheck = false;
    if (!checkEmail()) allCheck = false;
    if (!checkMegama()) allCheck = false;
    if (!checkHobby()) allCheck = false;
    if (!checkGender()) allCheck = false;

    return allCheck;
}
function checkBirthYear() {
    var flag = true;
    var n1 = document.getElementById("birthDateYear").value;
    if (isNaN(n1) || n1 == "" || n1 < 1800) {
        document.getElementById("mbirthDateYear").value = "הכנס שנה בעלת 4 ספרות";
        document.getElementById("mbirthDateYear").style.display = "inline";
        flag = false;

    }
    else
        document.getElementById("mbirthDateYear").style.display = "none";
    return flag;
}
function checkHobby() {
    var flag = true;
    var count = 0;
    var h = document.getElementsByName("hobby");
    for (i = 0; i < h.length; i++) {

        if (h[i].checked == true)
            count++;
    }
    if (count == 0) {
        document.getElementById("mHobby").value = "בחר מגמה";
        document.getElementById("mHobby").style.display = "inline";
        flag = false;
    }
    else
        document.getElementById("mHobby").style.display = "none";
    return flag;
}
function checkMegama() {
    var flag = true;
    var flagRadio = false;
    var m = document.getElementsByName("megama");
    for (i = 0; i < m.length; i++) //הרדיו כפתורי מערך על מעבר
    {
        if (m[i].checked == true) // מסומן שנבדק הכפתור אם
            flagRadio = true;
    }
    if (flagRadio) {
        document.getElementById("mMegama").value = "בחר מגמה";
        document.getElementById("mMegama").style.display = "inline";
        flag = false;
    }
    else
        document.getElementById("mMegama").style.display = "none";

    return flag;
}
function checkEmail() {
    var flag = true;
    var e = document.getElementById("mail").value;
    if ((e.indexOf("@") < 2) || (e.lastIndexOf('.') < e.indexOf('@') + 3)) {
        document.getElementById("mMail").value = "כתובת מייל אינה נכונה";
        document.getElementById("mMail").style.display = "inline";
        flag = false;
    }
    else {
        document.getElementById("mMail").style.display = "none";
        var status = false;
        for (i = 0; i < e.length; i++) {
            if (e.charAt(i) == " ") status = true;
        }
        if (status == true) {
            document.getElementById("mMail").value = "כתובת מייל אינה נכונה";
            document.getElementById("mMail").style.display = "inline";
            flag = false;
        }
        else
            document.getElementById("mUsername").style.display = "none";

    }
    return flag;
}

function checkPhone() {
    var flag = true;
    var n1 = document.getElementById("phoneNumber").value;
    if (isNaN(n1) || n1 == "" || n1.length != 10) {
        document.getElementById("mPhone").value = "הכנס מספר בעל 10 ספרות";
        document.getElementById("mPhone").style.display = "inline";
        flag = false;

    }
    else
        document.getElementById("mPhone").style.display = "none";
    return flag;
}

function checkValidPassword() {
    var flag = true;
    var n1 = document.getElementById("pass").value;
    var n2 = document.getElementById("validPass").value;
    if (n1 != n2) {
        document.getElementById("mValidPass").value = "אימות סיסמא אינו תואם לסיסמתך";
        document.getElementById("mValidPass").style.display = "inline";
        flag = false;

    }
    else
        document.getElementById("mValidPass").style.display = "none";
    return flag;
}
function checkUserName() {

    var flag = true;
    var n = document.getElementById("username").value;
    if (n == "") {
        document.getElementById("mUsername").value = "חובה שם משתמש";
        document.getElementById("mUsername").style.display = "inline";
        flag = false;
    }
    else
        document.getElementById("mUsername").style.display = "none";
    return flag;
}
function checkPassword() {

    var flag = true;
    var n = document.getElementById("pass").value;
    if (n == "") {
        document.getElementById("mPassword").value = "חובה סיסמא";
        document.getElementById("mPassword").style.display = "inline";
        flag = false;

    }
    else {
        document.getElementById("mPassword").style.display = "none";
        if (n.length >= 1 && n.length <= 5) {
            document.getElementById("mPassword").value = "סיסמא קצרה מידי הכנס מעל 5 תווים";
            document.getElementById("mPassword").style.display = "inline";
            flag = false;
        }
        else
            document.getElementById("mPassword").style.display = "none";

    }
    return flag;
}

function checkGender() {
    var flag = true;
    var isChecked = false;
    var gender = document.getElementsByName("gender");
    
    for (i = 0; i < gender.length; i++)
    {
        if (gender[i].checked) 
            isChecked = true;
    }
    if (!isChecked) {
        document.getElementById("mGender").value = "חובה מגדר";
        document.getElementById("mGender").style.display = "inline";
        flag = false;
    }
    else
        document.getElementById("mGender").style.display = "none";
        
    return flag;
}