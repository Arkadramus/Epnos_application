<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
    <script src="Scripts/dygraph.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function highlight(canvas, area, g, tabminTab, tabmaxTab) {
            for (var i = 0; i < tabminTab.length; i++) {
                console.log(tabminTab[i]);
                console.log(tabmaxTab[i]);
                var bottom_left = g.toDomCoords(tabminTab[i], -20);
                var top_right = g.toDomCoords(tabmaxTab[i], +20);

                var left = bottom_left[0];
                var right = top_right[0];

                canvas.fillStyle = "rgba(0, 255 , 0, 1.0)";
                canvas.fillRect(left, area.y, right - left, area.h);
            }
        }
        function setRange() {
            s1.updateOptions({
                showRangeSelector: true,
                rangeSelectorHeight: 20,
                dateWindow: [0, 1000],
            })
        }

        function Sono() {
            var tabminS1 = [];
            var tabmaxS1 = [];
            s1 = new Dygraph(
                document.getElementById("AudioVolumeDB"),
                "EDF/AudioVolumeDB.csv", {
                    showRangeSelector: false,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,
                            underlayCallback: function (canvas, area, g) {
                                if (tabminS1[tabminS1.length - 1] != minTime) {
                                    tabminS1.push(minTime);
                                    tabmaxS1.push(maxTime);
                                    highlight(canvas, area, g, tabminS1, tabmaxS1)
                                }
                            }
                        });
                    },
                });
            var tabminS2 = [];
            var tabmaxS2 = [];
            //s2 = new Dygraph(
            //    document.getElementById("Snoring"),
            //    "EDF/Snoring.csv", {
            //        valueRange: [0, 1000],
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS2[tabminS2.length - 1] != minTime) {
            //                        tabminS2.push(minTime);
            //                        tabmaxS2.push(maxTime);
            //                        highlight(canvas, area, g, tabminS2, tabmaxS2)
            //                    }
            //                }
            //            });
            //        },
            //    });
            var tabminS3 = [];
            var tabmaxS3 = [];
            //s3 = new Dygraph(
            //    document.getElementById("AirFlow"),
            //    "EDF/AirFlow.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS3[tabminS3.length - 1] != minTime) {
            //                        tabminS3.push(minTime);
            //                        tabmaxS3.push(maxTime);
            //                        highlight(canvas, area, g, tabminS3, tabmaxS3)
            //                    }
            //                }
            //            });
            //        },
            //    });
            //var tabminS4 = [];
            //var tabmaxS4 = [];
            //s4 = new Dygraph(
            //    document.getElementById("RIPFlow"),
            //    "EDF/RIPFlow.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS4[tabminS4.length - 1] != minTime) {
            //                        tabminS4.push(minTime);
            //                        tabmaxS4.push(maxTime);
            //                        highlight(canvas, area, g, tabminS4, tabmaxS4)
            //                    }
            //                }
            //            });
            //        },
            //    });
            //var tabminS5 = [];
            //var tabmaxS5 = [];
            //s5 = new Dygraph(
            //    document.getElementById("spO2B-B"),
            //    "EDF/spO2B-B.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS5[tabminS5.length - 1] != minTime) {
            //                        tabminS5.push(minTime);
            //                        tabmaxS5.push(maxTime);
            //                        highlight(canvas, area, g, tabminS5, tabmaxS5)
            //                    }
            //                }
            //            });
            //        },
            //    });
            //var tabminS6 = [];
            //var tabmaxS6 = [];
            //s6 = new Dygraph(
            //    document.getElementById("InductanceThora"),
            //    "EDF/InductanceThora.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS6[tabminS6.length - 1] != minTime) {
            //                        tabminS6.push(minTime);
            //                        tabmaxS6.push(maxTime);
            //                        highlight(canvas, area, g, tabminS6, tabmaxS6)
            //                    }
            //                }
            //            });
            //        },
            //    });
            //var tabminS7 = [];
            //var tabmaxS7 = [];
            //s7 = new Dygraph(
            //    document.getElementById("InductanceAbdom"),
            //    "EDF/InductanceAbdom.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS7[tabminS7.length - 1] != minTime) {
            //                        tabminS7.push(minTime);
            //                        tabmaxS7.push(maxTime);
            //                        highlight(canvas, area, g, tabminS7, tabmaxS7)
            //                    }
            //                }
            //            });
            //        },
            //    });
            //var tabminS8 = [];
            //var tabmaxS8 = [];
            //s8 = new Dygraph(
            //    document.getElementById("K"),
            //    "EDF/K.csv", {
            //        zoomCallback: function (minTime, maxTime, yRanges) {
            //            this.updateOptions({
            //                dateWindow: null,
            //                valueRange: null,

            //                underlayCallback: function (canvas, area, g) {
            //                    if (tabminS8[tabminS8.length - 1] != minTime) {
            //                        tabminS8.push(minTime);
            //                        tabmaxS8.push(maxTime);
            //                        highlight(canvas, area, g, tabminS8, tabmaxS8)
            //                    }
            //                }
            //            });
            //        },
            //    });
        }

        function Neuro() {
            var tabminN01 = [];
            var tabmaxN01 = [];
            n01 = new Dygraph(
                document.getElementById("Snoring"),
                "EDF/Snoring.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN01[tabminN01.length - 1] != minTime) {
                                    tabminN01.push(minTime);
                                    tabmaxN01.push(maxTime);
                                    highlight(canvas, area, g, tabminN01, tabmaxN01)
                                }
                            }
                        });
                    },
                });
            var tabminN02 = [];
            var tabmaxN02 = [];
            n02 = new Dygraph(
                document.getElementById("E2-M1"),
                "EDF/E2-M1.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN02[tabminN02.length - 1] != minTime) {
                                    tabminN02.push(minTime);
                                    tabmaxN02.push(maxTime);
                                    highlight(canvas, area, g, tabminN02, tabmaxN02)
                                }
                            }
                        });
                    },
                });
            var tabminN03 = [];
            var tabmaxN03 = [];
            n03 = new Dygraph(
                document.getElementById("E1-M1"),
                "EDF/E1-M1.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN03[tabminN03.length - 1] != minTime) {
                                    tabminN03.push(minTime);
                                    tabmaxN03.push(maxTime);
                                    highlight(canvas, area, g, tabminN03, tabmaxN03)
                                }
                            }
                        });
                    },
                });
            var tabminN04 = [];
            var tabmaxN04 = [];
            n04 = new Dygraph(
                document.getElementById("C3-M2"),
                "EDF/C3-M2.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN04[tabminN04.length - 1] != minTime) {
                                    tabminN04.push(minTime);
                                    tabmaxN04.push(maxTime);
                                    highlight(canvas, area, g, tabminN04, tabmaxN04)
                                }
                            }
                        });
                    },
                });
            var tabminN05 = [];
            var tabmaxN05 = [];
            n05 = new Dygraph(
                document.getElementById("F3-M2"),
                "EDF/F3-M2.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN05[tabminN05.length - 1] != minTime) {
                                    tabminN05.push(minTime);
                                    tabmaxN05.push(maxTime);
                                    highlight(canvas, area, g, tabminN05, tabmaxN05)
                                }
                            }
                        });
                    },
                });
            var tabminN06 = [];
            var tabmaxN06 = [];
            n06 = new Dygraph(
                document.getElementById("O1-M2"),
                "EDF/O1-M2.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN06[tabminN06.length - 1] != minTime) {
                                    tabminN06.push(minTime);
                                    tabmaxN06.push(maxTime);
                                    highlight(canvas, area, g, tabminN06, tabmaxN06)
                                }
                            }
                        });
                    },
                });
            var tabminN07 = [];
            var tabmaxN07 = [];
            n07 = new Dygraph(
                document.getElementById("1-F"),
                "EDF/1-F.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN07[tabminN07.length - 1] != minTime) {
                                    tabminN07.push(minTime);
                                    tabmaxN07.push(maxTime);
                                    highlight(canvas, area, g, tabminN07, tabmaxN07)
                                }
                            }
                        });
                    },
                });
            var tabminN08 = [];
            var tabmaxN08 = [];
            n08 = new Dygraph(
                document.getElementById("1-2"),
                "EDF/1-2.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN08[tabminN08.length - 1] != minTime) {
                                    tabminN08.push(minTime);
                                    tabmaxN08.push(maxTime);
                                    highlight(canvas, area, g, tabminN08, tabmaxN08)
                                }
                            }
                        });
                    },
                });
            var tabminN09 = [];
            var tabmaxN09 = [];
            n09 = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN09[tabminN09.length - 1] != minTime) {
                                    tabminN09.push(minTime);
                                    tabmaxN09.push(maxTime);
                                    highlight(canvas, area, g, tabminN09, tabmaxN09)
                                }
                            }
                        });
                    },
                });
            var tabminN10 = [];
            var tabmaxN10 = [];
            n10 = new Dygraph(
                document.getElementById("HeartRate"),
                "EDF/HeartRate.csv", {
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({
                            dateWindow: null,
                            valueRange: null,

                            underlayCallback: function (canvas, area, g) {
                                if (tabminN10[tabminN10.length - 1] != minTime) {
                                    tabminN10.push(minTime);
                                    tabmaxN10.push(maxTime);
                                    highlight(canvas, area, g, tabminN10, tabmaxN10)
                                }
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
                <div class="Div_Info">
                    <asp:ImageButton runat="server" ID="imgPedro" ImageUrl="img/alpaga.jpg" Height="150px" Width="275px" Visible="false" OnClick="imgPedro_Click" />
                    <asp:Label runat="server" ID="lblPedro" Text="Pedro" Font-Size="25px" Visible="false"></asp:Label>
                    <%-- Division où il y aura les informations du patients --%>
                </div>
                <div style="width: 65%; float: right; margin-top: 1%;">
                    <%-- Division où il y aura les boutons pour chaque fonctionnalité --%>
                    <asp:Button class="btn" runat="server" Text="Générer un rapport" ID="btn_test" OnClientClick="setRange()" Style="margin-left: 0%;" />
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
