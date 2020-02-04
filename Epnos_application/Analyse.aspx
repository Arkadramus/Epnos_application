﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        var dataRange = 2000;
        var rangeHeight = 10;

        function highlight(canvas, area, g, tabminTab, tabmaxTab) {
            for (var i = 0; i < tabminTab.length; i++) {
                var bottom_left = g.toDomCoords(tabminTab[i], -20);
                var top_right = g.toDomCoords(tabmaxTab[i], +20);

                var left = bottom_left[0];
                var right = top_right[0];
                canvas.fillStyle = "rgba(0, 255 , 0, 1.0)";
                canvas.fillRect(left, 0, right - left, area.h);
            }
        }

        function Sono() {
            var tabminS1 = [];
            var tabmaxS1 = [];
            var canvasS1 = 1;
            s1 = new Dygraph(
                document.getElementById("AudioVolumeDB"),
                "EDF/AudioVolumeDB.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS1[tabminS1.length - 1] != minTime && tabmaxS1[tabmaxS1.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            tabminS1.push(minTime);
                            tabmaxS1.push(maxTime);
                            canvasS1 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange] });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS1.length > 0 && canvasS1 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS1 = canvas;
                                    highlight(canvasS1, area, g, tabminS1, tabmaxS1)
                                }
                            });
                        }
                    },
                });
            var tabminS2 = [];
            var tabmaxS2 = [];
            var canvasS2 = 1;
            s2 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS2[tabminS2.length - 1] != minTime && (maxTime - minTime) <= (dataRange + 1) ) {
                            tabminS2.push(minTime);
                            tabmaxS2.push(maxTime);
                            canvasS2 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS2.length > 0 && canvasS2 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS2 = canvas;
                                    highlight(canvasS2, area, g, tabminS2, tabmaxS2)
                                }
                            });
                        }
                    },
                });
            var tabminS3 = [];
            var tabmaxS3 = [];
            var canvasS3 = 1;
            s3 = new Dygraph(
                document.getElementById("AirFlow"),
                "EDF/AirFlow.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS3[tabminS3.length - 1] != minTime) {
                            tabminS3.push(minTime);
                            tabmaxS3.push(maxTime);
                            canvasS3 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS3.length > 0 && canvasS3 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS3 = canvas;
                                    highlight(canvasS3, area, g, tabminS3, tabmaxS3)
                                }
                            });
                        }
                    },
                });
            var tabminS4 = [];
            var tabmaxS4 = [];
            var canvasS4 = 1;
            s4 = new Dygraph(
                document.getElementById("RIPFlow"),
                "EDF/RIPFlow.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS4[tabminS4.length - 1] != minTime) {
                            tabminS4.push(minTime);
                            tabmaxS4.push(maxTime);
                            canvasS4 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS4.length > 0 && canvasS4 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS4 = canvas;
                                    highlight(canvasS4, area, g, tabminS4, tabmaxS4)
                                }
                            });
                        }
                    },
                });
            var tabminS5 = [];
            var tabmaxS5 = [];
            var canvasS5 = 1;
            s5 = new Dygraph(
                document.getElementById("spO2B-B"),
                "EDF/spO2B-B.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 10],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS5[tabminS5.length - 1] != minTime) {
                            tabminS5.push(minTime);
                            tabmaxS5.push(maxTime);
                            canvasS5 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 10], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS5.length > 0 && canvasS5 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS5 = canvas;
                                    highlight(canvasS5, area, g, tabminS5, tabmaxS5)
                                }
                            });
                        }
                    },
                });
            var tabminS6 = [];
            var tabmaxS6 = [];
            var canvasS6 = 1;
            s6 = new Dygraph(
                document.getElementById("InductanceThora"),
                "EDF/InductanceThora.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS6[tabminS6.length - 1] != minTime) {
                            tabminS6.push(minTime);
                            tabmaxS6.push(maxTime);
                            canvasS6 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS6.length > 0 && canvasS6 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS6 = canvas;
                                    highlight(canvasS6, area, g, tabminS6, tabmaxS6)
                                }
                            });
                        }
                    },
                });
            var tabminS7 = [];
            var tabmaxS7 = [];
            var canvasS7 = 1;
            s7 = new Dygraph(
                document.getElementById("InductanceAbdom"),
                "EDF/InductanceAbdom.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS7[tabminS7.length - 1] != minTime) {
                            tabminS7.push(minTime);
                            tabmaxS7.push(maxTime);
                            canvasS7 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS7.length > 0 && canvasS7 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS7 = canvas;
                                    highlight(canvasS7, area, g, tabminS7, tabmaxS7)
                                }
                            });
                        }
                    },
                });
            var tabminS8 = [];
            var tabmaxS8 = [];
            var canvasS8 = 1;
            s8 = new Dygraph(
                document.getElementById("K"),
                "EDF/K.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminS8[tabminS8.length - 1] != minTime) {
                            tabminS8.push(minTime);
                            tabmaxS8.push(maxTime);
                            canvasS8 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminS8.length > 0 && canvasS8 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS8 = canvas;
                                    highlight(canvasS8, area, g, tabminS8, tabmaxS8)
                                }
                            });
                        }
                    },
                });
        }

        function Neuro() {
            var tabminN01 = [];
            var tabmaxN01 = [];
            var canvasN01 = 1;
            n01 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN01[tabminN01.length - 1] != minTime) {
                            tabminN01.push(minTime);
                            tabmaxN01.push(maxTime);
                            canvasN01 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN01.length > 0 && canvasN01 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN01 = canvas;
                                    highlight(canvasN01, area, g, tabminN01, tabmaxN01)
                                }
                            });
                        }
                    },
                });
            var tabminN02 = [];
            var tabmaxN02 = [];
            var canvasN02 = 1;
            n02 = new Dygraph(
                document.getElementById("E2-M1"),
                "EDF/E2-M1.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN02[tabminN02.length - 1] != minTime) {
                            tabminN02.push(minTime);
                            tabmaxN02.push(maxTime);
                            canvasN02 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN02.length > 0 && canvasN02 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN02 = canvas;
                                    highlight(canvasN02, area, g, tabminN02, tabmaxN02)
                                }
                            });
                        }
                    },
                });
            var tabminN03 = [];
            var tabmaxN03 = [];
            var canvasN03 = 1;
            n03 = new Dygraph(
                document.getElementById("E1-M1"),
                "EDF/E1-M1.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN03[tabminN03.length - 1] != minTime) {
                            tabminN03.push(minTime);
                            tabmaxN03.push(maxTime);
                            canvasN03 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN03.length > 0 && canvasN03 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN03 = canvas;
                                    highlight(canvasN03, area, g, tabminN03, tabmaxN03)
                                }
                            });
                        }
                    },
                });
            var tabminN04 = [];
            var tabmaxN04 = [];
            var canvasN04 = 1;
            n04 = new Dygraph(
                document.getElementById("C3-M2"),
                "EDF/C3-M2.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN04[tabminN04.length - 1] != minTime) {
                            tabminN04.push(minTime);
                            tabmaxN04.push(maxTime);
                            canvasN04 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN04.length > 0 && canvasN04 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN04 = canvas;
                                    highlight(canvasN04, area, g, tabminN04, tabmaxN04)
                                }
                            });
                        }
                    },
                });
            var tabminN05 = [];
            var tabmaxN05 = [];
            var canvasN05 = 1;
            n05 = new Dygraph(
                document.getElementById("F3-M2"),
                "EDF/F3-M2.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN05[tabminN05.length - 1] != minTime) {
                            tabminN05.push(minTime);
                            tabmaxN05.push(maxTime);
                            canvasN05 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN05.length > 0 && canvasN05 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN05 = canvas;
                                    highlight(canvasN05, area, g, tabminN05, tabmaxN05)
                                }
                            });
                        }
                    },
                });
            var tabminN06 = [];
            var tabmaxN06 = [];
            var canvasN06 = 1;
            n06 = new Dygraph(
                document.getElementById("O1-M2"),
                "EDF/O1-M2.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN06[tabminN06.length - 1] != minTime) {
                            tabminN06.push(minTime);
                            tabmaxN06.push(maxTime);
                            canvasN06 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN06.length > 0 && canvasN06 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN06 = canvas;
                                    highlight(canvasN06, area, g, tabminN06, tabmaxN06)
                                }
                            });
                        }
                    },
                });
            var tabminN07 = [];
            var tabmaxN07 = [];
            var canvasN07 = 1;
            n07 = new Dygraph(
                document.getElementById("1-F"),
                "EDF/1-F.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN07[tabminN07.length - 1] != minTime) {
                            tabminN07.push(minTime);
                            tabmaxN07.push(maxTime);
                            canvasN07 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN07.length > 0 && canvasN07 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN07 = canvas;
                                    highlight(canvasN07, area, g, tabminN07, tabmaxN07)
                                }
                            });
                        }
                    },
                });
            var tabminN08 = [];
            var tabmaxN08 = [];
            var canvasN08 = 1;
            n08 = new Dygraph(
                document.getElementById("1-2"),
                "EDF/1-2.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN08[tabminN08.length - 1] != minTime) {
                            tabminN08.push(minTime);
                            tabmaxN08.push(maxTime);
                            canvasN08 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN08.length > 0 && canvasN08 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN08 = canvas;
                                    highlight(canvasN08, area, g, tabminN08, tabmaxN08)
                                }
                            });
                        }
                    },
                });
            var tabminN09 = [];
            var tabmaxN09 = [];
            var canvasN09 = 1;
            n09 = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN09[tabminN09.length - 1] != minTime) {
                            tabminN09.push(minTime);
                            tabmaxN09.push(maxTime);
                            canvasN09 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN09.length > 0 && canvasN09 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN09 = canvas;
                                    highlight(canvasN09, area, g, tabminN09, tabmaxN09)
                                }
                            });
                        }
                    },
                });
            var tabminN10 = [];
            var tabmaxN10 = [];
            var canvasN10 = 1;
            n10 = new Dygraph(
                document.getElementById("HeartRate"),
                "EDF/HeartRate.csv", {
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 10],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (tabminN10[tabminN10.length - 1] != minTime) {
                            tabminN10.push(minTime);
                            tabmaxN10.push(maxTime);
                            canvasN10 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (tabminN10.length > 0 && canvasN10 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN10 = canvas;
                                    highlight(canvasN10, area, g, tabminN10, tabmaxN10)
                                }
                            });
                        }
                    },
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
                <div class="Div_Info">
                    <asp:ImageButton runat="server" ID="imgPedro" ImageUrl="img/alpaga.jpg" Height="150px" Width="275px" Visible="false" OnClick="imgPedro_Click" />
                    <asp:Label runat="server" ID="lblPedro" Text="Pedro" Font-Size="25px" Visible="false"></asp:Label>
                    <%-- Division où il y aura les informations du patients --%>
                </div>
                <div style="width: 65%; float: right; margin-top: 1%;">
                    <%-- Division où il y aura les boutons pour chaque fonctionnalité --%>
                    <asp:Button class="btn" runat="server" Text="Générer un rapport" ID="btn_GenereRapport" Style="margin-left: 0%;" />
                    <asp:Button class="btn" runat="server" Text="Sauvegarder" ID="btn_Save" Style="margin-left: 1%;" />
                    <asp:Button class="btn" runat="server" Text="Capturer l'écran" ID="btn_CaptEcran" Style="margin-left: 1%;" />
                    <asp:Button class="btn" runat="server" Text="Voir les captures" ID="btn_VoirCapt" Style="margin-left: 1%;" />
                    <asp:Button class="btn" runat="server" Text="Neurologie" ID="btnNeuro" OnClick="btnNeuro_Click" Style="margin-left: 1%; vertical-align: bottom; float: right;" />
                    <asp:Button class="btn" runat="server" Text="Sonore" ID="btnSono" OnClick="btnSono_Click" Style="margin-left: 1%; vertical-align: bottom; float: right;" />

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
