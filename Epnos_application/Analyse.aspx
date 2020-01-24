<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            g01 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv");
            g02 = new Dygraph(
                document.getElementById("E2-M1"),
                "EDF/E2-M1.csv");
            g03 = new Dygraph(
                document.getElementById("E1-M1"),
                "EDF/E1-M1.csv");
            g04 = new Dygraph(
                document.getElementById("C3-M2"),
                "EDF/C3-M2.csv");
            g05 = new Dygraph(
                document.getElementById("F3-M2"),
                "EDF/F3-M2.csv");
            g06 = new Dygraph(
                document.getElementById("O1-M2"),
                "EDF/O1-M2.csv");
            g07 = new Dygraph(
                document.getElementById("1-F"),
                "EDF/1-F.csv");
            g08 = new Dygraph(
                document.getElementById("1-2"),
                "EDF/1-2.csv");
            g09 = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv");
            g10 = new Dygraph(
                document.getElementById("HeartRate"),
                "EDF/HeartRate.csv");
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="Haut_page">
            <asp:Image runat="server" CssClass="Logo" src="img/navbar-logo.png" Style="margin-top: 5px" />
        </header>
        <section class="Fond_page">
            <div class="Head_option">
                <div class="Div_Info">
                    <%-- Division où il y aura les informations du patients --%>
                </div>
                <div style="width: 65%; float: right; margin-top: 1%;">
                    <%-- Division où il y aura les boutons pour chaque fonctionnalité --%>
                    <asp:Button class="btn" runat="server" Text="Générer un rapport" ID="btn_GenereRapport" Style="margin-left: 0%;" />
                    <asp:Button class="btn" runat="server" Text="Sauvegarder" ID="btn_Save" Style="margin-left: 1%;" />
                    <asp:Button class="btn" runat="server" Text="Capturer l'écran" ID="btn_CaptEcran" Style="margin-left: 1%;" OnClick="btn_CaptEcran_Click" />
                    <asp:Button class="btn" runat="server" Text="Voir les captures" ID="btn_VoirCapt" Style="margin-left: 1%;" OnClick="btn_VoirCapt_Click" />
                    <asp:Button class="btn" runat="server" Text="Neurologie" ID="btnNeuro" Style="margin-left: 1%; vertical-align: bottom; float: right;" />
                    <asp:Button class="btn" runat="server" Text="Sonore" ID="btnSono" Style="margin-left: 1%; vertical-align: bottom; float: right;" />


                </div>
            </div>
            <div class="Div_Graphe">
                <asp:Repeater ID="rptNeuro" runat="server">
                    <ItemTemplate>
                        <td>
                            <div class="labelRepeater">
                                <asp:LinkButton runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Nom")%>'></asp:LinkButton>
                            </div>
                        </td>
                        <td>
                            <div class="graphRepeater" id='<%# DataBinder.Eval(Container.DataItem,"divID")%>'></div>
                        </td>
                    </ItemTemplate>
                </asp:Repeater>
            </div>


        </section>
    </form>
</body>
</html>
