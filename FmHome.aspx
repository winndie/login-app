<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FmHome.aspx.cs" Inherits="Kangaroo.FmHome" %>

<!DOCTYPE html>
<!--
author      : Winndie Fan
created     : 28 Jan 2020
description : Main page for project
            : User click on login button to login
            : User hover on ? to learn how to login
            : User check on remember me to save username for next visit
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CodingEgret</title>
    <link rel="stylesheet" href="StyleNormal.css"/>
</head>
<body onload="onLoad()">
    <div class="FmHeader">
    <div class="TxtHeader">Welcome to CodingEgret. Please login
    <form id="FmLogin" class="FmLogin" runat="server" onsubmit="return setCookie();">
        <div class="BtnInfo"><mark>Enter Username and Password, then press Login.</mark><img class="ImgInfo" src="info.png"/></div>
        <asp:TextBox ID="TxtUsername" CssClass="TxtUsername" runat="server"/>
        <asp:TextBox ID="TxtPassword" CssClass="TxtPassword" runat="server"/>
        <asp:CheckBox ID="BtnRememberMe" CssClass="BtnRememberMe" runat="server" Text="Remember Me" />
        <asp:Button ID="BtnLogin" CssClass="BtnLogin" runat="server" Text="Login" OnClick ="OnClick" OnClientClick ="return OnClientClick();" CommandArgument="LOGIN" CausesValidation="True" />
    </form></div></div>
    <script type="text/javascript">
        const COOKIE_EXPIRE = 30;
        const txtUsername = document.getElementById("TxtUsername");
        const txtPassword = document.getElementById("TxtPassword");
        const btnRememberMe = document.getElementById("BtnRememberMe");

        txtUsername.addEventListener("focusin", function () { SetInput('focusin_username'); });
        txtUsername.addEventListener("blur", function () { SetInput('blur_username'); });

        txtPassword.addEventListener("focusin", function () { SetInput('focusin_password'); });
        txtPassword.addEventListener("blur", function () { SetInput('blur_password'); });

        // Set username as cookies, expires in COOKIE_EXPIRE
        function setCookie() {

            var cookieStr = "SameSite=None,Secure=true,";
            var exdays = 30;
            var d = new Date();
            d.setTime(d.getTime() + (COOKIE_EXPIRE * 24 * 60 * 60 * 1000));

            if (btnRememberMe.checked)
                cookieStr += "username=" + txtUsername.value;
            else
                cookieStr += "username=Username";

            cookieStr += ",path=/,expires=" + d.toUTCString() + ",";
            document.cookie = cookieStr;
        }//setCookie

        // Get cookie value for parameter cname
        function getCookie(cname) {

            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(',');

            for (var i = 0; i < ca.length; i++) {

                var x = ca[i].lastIndexOf(name);
                var y = ca[i].length - x - name.length;
                if (x == 0 && y > 0)
                    return ca[i].substring(name.length, ca[i].length);
            }
            return "";

        }//getCookie

        // On page load, retrieve username from cookies to textbox
        function onLoad() {

            var username = getCookie("username");
            SetInput('load_password');

            if (username.length > 0) {
                txtUsername.value = username;
                SetInput('blur_username');
            }
            else
                SetInput('load_username');

        }

        //SetInput
        function SetInput(option) {

            if ((option == 'load_username') ||
                (option == 'blur_username' && txtUsername.value == "")) {

                txtUsername.value = "Username";
                txtUsername.style.color = "#CCC";
                txtUsername.style.fontStyle = "italic";
            }
            else if (option == 'focusin_username' && txtUsername.value == "Username") {

                txtUsername.value = "";
                txtUsername.style.color = "#000";
                txtUsername.style.fontStyle = "normal";
            }
            else if ((option == 'load_password') ||
                (option == 'blur_password' && txtPassword.value == "")) {

                txtPassword.value = "Password";
                txtPassword.style.color = "#CCC";
                txtPassword.style.fontStyle = "italic";
                txtPassword.type = "Text";
            }
            else if (option == 'focusin_password' && txtPassword.value == "Password") {

                txtPassword.value = "";
                txtPassword.style.color = "#000";
                txtPassword.style.fontStyle = "normal";
                txtPassword.type = "Password";
            }
        } //SetInput

        //check input validity
        function OnClientClick() {

            txtUsername.setCustomValidity('');
            txtPassword.setCustomValidity('');

            if (txtUsername.value == '' || txtUsername.value == 'Username')
                txtUsername.setCustomValidity('Username is required!');
            
            if (txtPassword.value == '' || txtPassword.value == 'Password')
                txtPassword.setCustomValidity('Passwood is required!');

        }//OnClientClick

    </script>
</body>
</html>
