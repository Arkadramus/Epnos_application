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
                "EDF/Test_edf.csv");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button runat="server" id="bnt1" Text="EDFRead1" OnCommand="Unnamed_Click" CommandArgument="1"/>
        <asp:Button runat="server" id="bnt2" Text="EDFRead2" OnCommand="Unnamed_Click" CommandArgument="2"/>
        <asp:Button runat="server" id="bnt3" Text="EDFRead3" OnCommand="Unnamed_Click" CommandArgument="3"/>
        <asp:Button runat="server" id="bnt4" Text="EDFRead4" OnCommand="Unnamed_Click" CommandArgument="4"/>
        <div id="graph" style="height: 400px; width: 400px"></div>
    </form>
</body>
</html>
