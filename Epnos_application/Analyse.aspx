<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("graph"),
                "Date,Temperature\n" +
                "2008-05-07,75\n" +
                "2008-05-08,70\n" +
                "2008-05-09,80\n");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button runat="server" ID="btn1" Text="clique" />
        <asp:Panel runat="server" Height="1000px" Width="1000px">
            <div id="graph"></div>
        </asp:Panel>
    </form>
</body>
</html>
