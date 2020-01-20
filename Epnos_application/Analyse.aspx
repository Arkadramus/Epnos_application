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
            g = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("E2-M1"),
                "EDF/E2-M1.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("E1-M1"),
                "EDF/E1-M1.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("C3-M2"),
                "EDF/C3-M2.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("F3-M2"),
                "EDF/F3-M2.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("O1-M2"),
                "EDF/O1-M2.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("1-F"),
                "EDF/1-F.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("1-2"),
                "EDF/1-2.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv");
        })
    </script>
    <script>
        $(function () {
            g = new Dygraph(
                document.getElementById("Heart rate"),
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
                    <asp:Button class="btn" runat="server" Text="Capturer l'écran" ID="btn_CaptEcran" Style="margin-left: 1%;" />
                    <asp:Button class="btn" runat="server" Text="Voir les captures" ID="btn_VoirCapt" Style="margin-left: 1%;" />

                </div>
            </div>
            <div class="Div_Graphe">
                <div>
                    <div style="width: 50px">
                        <asp:Label runat="server" Text="Snoring"></asp:Label>
                    </div>
                    <div style="width: 1682.44px;">
                        <div id="Snoring" style="height: 100px; "></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="E2-M1"></asp:Label>
                    </div>
                    <div>
                        <div id="E2-M1" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="E1-M1"></asp:Label>
                    </div>
                    <div>
                        <div id="E1-M1" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="C3-M2"></asp:Label>
                    </div>
                    <div>
                        <div id="C3-M2" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="F3-M2"></asp:Label>
                    </div>
                    <div>
                        <div id="F3-M2" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="O1-M2"></asp:Label>
                    </div>
                    <div>
                        <div id="O1-M2" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="1-F"></asp:Label>
                    </div>
                    <div>
                        <div id="1-F" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="1-2"></asp:Label>
                    </div>
                    <div>
                        <div id="1-2" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="ECG"></asp:Label>
                    </div>
                    <div>
                        <div id="ECG" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label runat="server" Text="Heart rate"></asp:Label>
                    </div>
                    <div>
                        <div id="Heart rate" style="height: 75px; width: 100%"></div>
                    </div>
                </div>
            </div>

        </section>
    </form>
</body>
</html>
