<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FmShowMsg.aspx.cs" Inherits="Kangaroo.FmShowMsg" %>

<!DOCTYPE html>
<!--
author      : Winndie Fan
created     : 28 Jan 2020
description : Show message page
            : Receive and display session value from main page
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CodingEgret</title>
    <link rel="stylesheet" href="StyleNormal.css"/>
</head>
<body>
    <form id="FmShowMsg" runat="server">
        <asp:Label ID="TxtShowMsg" runat="server"></asp:Label>
    </form>
</body>
</html>
