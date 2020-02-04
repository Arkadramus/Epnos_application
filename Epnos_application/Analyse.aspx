<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>

    <script type="text/javascript">  
        function Sono() {

            var tab = window.name;
            colorSets = tab.split(",");
            console.log(colorSets);
            S1 = new Dygraph(
                document.getElementById("AudioVolumeDB"),
                "EDF/AudioVolumeDB.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[10]]
                });



            S2 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[11]]
                });
            S3 = new Dygraph(
                document.getElementById("AirFlow"),
                "EDF/AirFlow.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[12]]
                });
            S4 = new Dygraph(
                document.getElementById("RIPFlow"),
                "EDF/RIPFlow.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[13]]
                });
            S5 = new Dygraph(
                document.getElementById("spO2B-B"),
                "EDF/spO2B-B.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[14]]
                });
            S6 = new Dygraph(
                document.getElementById("InductanceThora"),
                "EDF/InductanceThora.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[15]]
                });
            S7 = new Dygraph(
                document.getElementById("InductanceAbdom"),
                "EDF/InductanceAbdom.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[16]]
                });
            S8 = new Dygraph(
                document.getElementById("K"),
                "EDF/K.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[17]]
                });
        }

        function changeColor() {

            var colorAvailable = [['#000000'], ['#FF0000'], ['#FFA500'], ['#FFFF00'], ['#00FF00'], ['#00008B'], ['#00BFFF'], ['#9400D3'], ['#FF1493'], ['#8B4513']];

            var e = document.getElementById("DDLColor");
            var indColor = parseInt(e.options[e.selectedIndex].value);
            var e = document.getElementById("DDLGraph");
            var graphName = e.options[e.selectedIndex].value;

            var colorSets = [['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000']];
            var tab = window.name;
            colorSets = tab.split(",");

            switch (graphName) {

                case "E2-M1":
                    colorSets[1] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "E1-M1":
                    colorSets[2] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "C3-M2":
                    colorSets[3] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "F3-M2":
                    colorSets[4] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "O1-M2":
                    colorSets[5] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "1-F":
                    colorSets[6] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "1-2":
                    colorSets[7] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "ECG":
                    colorSets[8] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "HeartRate":
                    colorSets[9] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "AudioVolumeDB":
                    colorSets[10] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "Snoring":
                    colorSets[11] = colorAvailable[indColor];
                    colorSets[0] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "AirFlow":
                    colorSets[12] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "RIPFlow":
                    colorSets[13] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "spO2B-B":
                    colorSets[14] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "InductanceThora":
                    colorSets[15] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "InductanceAbdom":
                    colorSets[16] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "K":
                    colorSets[17] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;

            }

            var Button = document.getElementById("btnNeuro");
            var colorButton = Button.style.backgroundColor;
            if (colorButton == "white") {
                Neuro();
            }
            else {
                Sono();
            }

            return false;

        }

        function Neuro() {

            var tab = window.name;
            colorSets = tab.split(",");
            console.log(colorSets);
            N01 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,
                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }

                        });
                    },
                    colors: [colorSets[0]]
                });

            N02 = new Dygraph(
                document.getElementById("E2-M1"),
                "EDF/E2-M1.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });

                    },
                    colors: [colorSets[1]]
                });
            N03 = new Dygraph(
                document.getElementById("E1-M1"),
                "EDF/E1-M1.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[2]]
                });
            N04 = new Dygraph(
                document.getElementById("C3-M2"),
                "EDF/C3-M2.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[3]]
                });
            N05 = new Dygraph(
                document.getElementById("F3-M2"),
                "EDF/F3-M2.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[4]]
                });
            N06 = new Dygraph(
                document.getElementById("O1-M2"),
                "EDF/O1-M2.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[5]]
                });
            N07 = new Dygraph(
                document.getElementById("1-F"),
                "EDF/1-F.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[6]]
                });
            N08 = new Dygraph(
                document.getElementById("1-2"),
                "EDF/1-2.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[7]]
                });
            N09 = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[8]]
                });
            N10 = new Dygraph(
                document.getElementById("HeartRate"),
                "EDF/HeartRate.csv", {
                    zoomCallback: function (minDate, maxDate, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                var bottom_left = g.toDomCoords(minDate, -20);
                                var top_right = g.toDomCoords(maxDate, +20);

                                var left = bottom_left[0];
                                var right = top_right[0];

                                canvas.fillStyle = "rgba(0, 255, 0, 1.0)";
                                canvas.fillRect(left, area.y, right - left, area.h);
                            }
                        });
                    },
                    colors: [colorSets[9]]
                });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="Haut_page">
            <asp:Image runat="server" CssClass="Logo" src="img/navbar-logo.png" Style="margin-top: 5px" />
        </header>
        <section class="Fond_page">
            <div class="Head_option">
                <div style="height: 15vh; width: 30%; margin-left: 3%; margin-bottom: 1%; float: left;">
                    <div class="Div_Info">
                        <img src="img/alpaga.jpg" height="100" width="150" />
                        <asp:Label runat="server" ID="lbl_pedro" Text="Pedro" Font-Size="12px"></asp:Label>
                        <asp:Button runat="server" ID="btnTest" Text="Test" OnClick="btnTest_Click" />
                    </div>
                    <div class="Div_param">
                        <asp:Label runat="server" Text="Couleur des graphes" Style="margin-left: 5%;"></asp:Label>
                        <br />
                        <asp:Label runat="server" Text="" Style="margin-left: 5%;"></asp:Label>
                        <asp:DropDownList ID="DDLColor" AutoPostBack="True" runat="server" OnSelectedIndexChanged="DDLColor_SelectedIndexChanged">
                            <asp:ListItem id="selected" Selected="True" Value="0" style="background-color: #000000; color: white;"> Noir </asp:ListItem>
                            <asp:ListItem Value="1" style="background-color: #FF0000;"> Rouge </asp:ListItem>
                            <asp:ListItem Value="2" style="background-color: #FFA500;"> Orange </asp:ListItem>
                            <asp:ListItem Value="3" style="background-color: #FFFF00;"> Jaune </asp:ListItem>
                            <asp:ListItem Value="4" style="background-color: #00FF00;"> Vert </asp:ListItem>
                            <asp:ListItem Value="5" style="background-color: #00008B;"> Bleu </asp:ListItem>
                            <asp:ListItem Value="6" style="background-color: #00BFFF;"> Cyan </asp:ListItem>
                            <asp:ListItem Value="7" style="background-color: #9400D3;"> Violet </asp:ListItem>
                            <asp:ListItem Value="8" style="background-color: #FF1493;"> Rose </asp:ListItem>
                            <asp:ListItem Value="9" style="background-color: #8B4513;"> Marron </asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLGraph" AutoPostBack="True" runat="server" OnSelectedIndexChanged="DDLGraph_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:Button runat="server" Text="Appliquer" ID="btnApplyChange" OnClientClick=" return changeColor()" />
                        <br />

                    </div>



                    <%-- Division où il y aura les informations du patients --%>
                </div>
                <div style="margin-right: 3%; width: 20%; float: right; padding-top: 15vh;">
                    <asp:Button class="btn_sono" runat="server" Text="Neurologie" ID="btnNeuro" Style="margin-bottom: 0%; float: right;" OnClick="btnNeuro_Click" />
                    <asp:Button class="btn_sono" runat="server" Text="Sonore" ID="btnSono" Style="float: right;" OnClick="btnSono_Click" />
                </div>
                <div style="width: 42%; float: right; padding-top: 1%; height: 17vh;">
                    <%-- Division où il y aura les boutons pour chaque fonctionnalité --%>
                    <asp:Button class="btns" runat="server" Text="Générer un rapport" ID="btn_GenereRapport" Style="margin-left: 0%;" />
                    <asp:Button class="btns" runat="server" Text="Sauvegarder" ID="btn_Save" Style="margin-left: 1%;" />
                    <asp:Button class="btns" runat="server" Text="Capturer l'écran" ID="btn_CaptEcran" Style="margin-left: 1%;" OnClick="btn_CaptEcran_Click" />
                    <asp:Button class="btns" runat="server" Text="Voir les captures" ID="btn_VoirCapt" Style="margin-left: 1%;" OnClick="btn_VoirCapt_Click" />
                </div>

            </div>

            <div class="Div_Graphe" style="padding-top: 2%">



                <asp:Repeater ID="rptNeuro" OnItemCommand="rptNeuro_ItemCommand" runat="server">
                    <ItemTemplate>
                        <td>
                            <div class="labelRepeater">
                                <asp:LinkButton ID="linkButton_Name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Nom")%>'></asp:LinkButton>
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

