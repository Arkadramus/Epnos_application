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
                "C:\Users\Alexis_portable\Documents\Projet S10\Epnos_application\Test_edf.csv");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button runat="server" id="bnt1" Text="EDFRead" OnClick="Unnamed_Click" />
        <div id="graph" style="height: 400px; width: 400px"></div>
    </form>
</body>
</html>
