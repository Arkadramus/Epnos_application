<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>

    <script type="text/javascript">      

     
        function Sono() {



            s01 = new Dygraph(
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
                });



            s02 = new Dygraph(
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
                });
            s03 = new Dygraph(
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
                });
            s04 = new Dygraph(
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
                });
            s05 = new Dygraph(
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
                });
            s06 = new Dygraph(
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
                });
            s07 = new Dygraph(
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
                });
            s08 = new Dygraph(
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
                });
        }

        var colorSets = [['#FF0000'], ['#00FF00'], ['#FF00FF'], ['#0000FF'], ['#FFFF00'], ['#800080'], ['#000000'], ['#00FFFF'], ['#808080'], ['#000000']]




        function changeColor() {
            g01.updateOptions({ colors: colorSets[2] });
        }

        function Neuro() {

            g01 = new Dygraph(
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
                });

            g02 = new Dygraph(
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
                });
            g03 = new Dygraph(
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
                });
            g04 = new Dygraph(
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
                });
            g05 = new Dygraph(
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
                });
            g06 = new Dygraph(
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
                });
            g07 = new Dygraph(
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
                });
            g08 = new Dygraph(
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
                });
            g09 = new Dygraph(
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
                });
            g10 = new Dygraph(
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
                <div style="height:15vh; width:30%;  margin-left: 3%; margin-bottom: 1%; float:left;">
                    <div class="Div_Info">
                         <img src="img/alpaga.jpg" height="100" width="150" />
                          <asp:Label runat="server" ID="lbl_pedro" Text="Pedro" Font-Size="12px"></asp:Label>
                        <asp:Button runat="server" ID="btnTest" Text="Test" OnClick="btnTest_Click" />
                    </div>
                    <div>
                        <tr>
                        <label>coucou</label>
                    </div>
                    


                    <%-- Division où il y aura les informations du patients --%>
                </div>
                <div style="margin-right: 3%; width: 20%; float: right; padding-top: 13.5vh; height: 17vh;">
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
                           
	                            <asp:ImageButton ID="img_Paint" runat="server" ImageUrl="img/paint.png"  OnClientClick="popupBasique('Popup_paint.aspx')" Height="20" Width="20" />
	                            
                                 
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

