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
        class Canva {
            //Possède une tableau de min, de max et de couleur
            constructor(Min = null, Max = null, Color = null) {
                this.min = (Min) ? Min : [];
                this.max = (Max) ? Max : [];
                this.color = (Color != null) ? Color : [];
            }

            Push(Min, Max, Color) {
                this.min.push(Min);
                this.max.push(Max);
                this.color.push(Color);
            }

            Pop() {
                this.min.pop();
                this.max.pop();
                this.color.pop();
            }

            IsEmpty() {
                var res = true;
                if (this.min.length > 0)
                    res = false;
                if (this.max.length > 0)
                    res = false;
                if (this.color.length > 0)
                    res = false;

                return res;
            }
        }

        //Variables
        {
            var dataRange = 2000;
            var rangeHeight = 10;

            var CanvS1 = new Canva();
            var CanvS2 = new Canva();
            var CanvS3 = new Canva();
            var CanvS4 = new Canva();
            var CanvS5 = new Canva();
            var CanvS6 = new Canva();
            var CanvS7 = new Canva();
           
          

            var canvasS1, canvasS2, canvasS3, canvasS4, canvasS5, canvasS6, canvasS7= 1;
           
        }

        function GetCanva() {
            var res = "";
            var hfValue = document.getElementById("hfCanva").value;

            if (!(hfValue === "") && hfValue)
                res = hfValue;       
            if (document.getElementById("btnNeuro").style.backgroundColor == "white") {             
            } else {
                if (!CanvS1.IsEmpty())
                    res += "s01" + CanvS1.min + "/" + CanvS1.max + "/" + CanvS1.color + ";";
                if (!CanvS2.IsEmpty())
                    res += "s02" + CanvS2.min + "/" + CanvS2.max + "/" + CanvS2.color + ";";
                if (!CanvS3.IsEmpty())
                    res += "s03" + CanvS3.min + "/" + CanvS3.max + "/" + CanvS3.color + ";";
                if (!CanvS4.IsEmpty())
                    res += "s04" + CanvS4.min + "/" + CanvS4.max + "/" + CanvS4.color + ";";
                if (!CanvS5.IsEmpty())
                    res += "s05" + CanvS5.min + "/" + CanvS5.max + "/" + CanvS5.color + ";";
                if (!CanvS6.IsEmpty())
                    res += "s06" + CanvS6.min + "/" + CanvS6.max + "/" + CanvS6.color + ";";
                if (!CanvS7.IsEmpty())
                    res += "s07" + CanvS7.min + "/" + CanvS7.max + "/" + CanvS7.color + ";";
               
            }
            document.getElementById("hfCanva").value = res;
        }

        function SetCanva() {
            var hfValue = document.getElementById("hfCanva").value;
            if (!(hfValue === "") && hfValue) {
                var tCanva = hfValue.split(';');
                if (!(tCanva === "") && tCanva) {
                    tCanva.forEach(function (element) {
                        if (!(element === "") && tCanva) {
                            var min = element.substring(3).split('/')[0].split(',');
                            var max = element.substring(3).split('/')[1].split(',');
                            var color = element.substring(3).split('/')[2].split(',');
                            switch (element.substring(0, 3)) {                            
                                case "s01":
                                    CanvS1.min = min;
                                    CanvS1.max = max;
                                    CanvS1.color = color;
                                    break;

                                case "s02":
                                    CanvS2.min = min;
                                    CanvS2.max = max;
                                    CanvS2.color = color;
                                    break;
                                case "s03":
                                    CanvS3.min = min;
                                    CanvS3.max = max;
                                    CanvS3.color = color;
                                    break;

                                case "s04":
                                    CanvS4.min = min;
                                    CanvS4.max = max;
                                    CanvS4.color = color;
                                    break;

                                case "s05":
                                    CanvS5.min = min;
                                    CanvS5.max = max;
                                    CanvS5.color = color;
                                    break;

                                case "s06":
                                    CanvS6.min = min;
                                    CanvS6.max = max;
                                    CanvS6.color = color;
                                    break;

                                case "s07":
                                    CanvS7.min = min;
                                    CanvS7.max = max;
                                    CanvS7.color = color;
                                    break;
                            }
                        }
                    });
                }
            }
        }

        function highlight(canvasName, area, g, Canv) {
            for (var i = 0; i < Canv.min.length; i++) {
                canvasName.fillStyle = Canv.color[i];
                //fillrectangle(x,y,width,heigh)
                canvasName.fillRect(g.toDomCoords(Canv.min[i], -20)[0], 0, g.toDomCoords(Canv.max[i], +20)[0] - g.toDomCoords(Canv.min[i], -20)[0], area.h);
            }
        }

        function ColorFromDDL() {
            var e = document.getElementById("DDLScoring");
            var indColor = parseInt(e.options[e.selectedIndex].value);
            var color = "#000000";
            switch (indColor) {
                case 0:
                    color = "#000000";
                    break;

                case 1:
                    color = "#FF0000";
                    break;

                case 2:
                    color = "#FFA500";
                    break;

                case 3:
                    color = "#FFFF00";
                    break;

                case 4:
                    color = "#00FF00";
                    break;

                case 5:
                    color = "#00008B";

                case 6:
                    color = "#00BFFF";
                    break;

                case 7:
                    color = "#9400D3";
                    break;

                case 8:
                    color = "#FF1493";
                    break;

                case 9:
                    color = "#8B4513";
                    break;
            }

            return color;
        }

        function Undo(divGraph) {
            console.log(divGraph.id);
            switch (divGraph.id) {
                case "AudioVolumeDB":
                    CanvS1.Pop();
                    s1.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS1 = canvas;
                            highlight(canvasS1, area, g, CanvS1)
                        }
                    });
                    break;

                case "SnoringS":
                    CanvS2.Pop();
                    s2.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS2 = canvas;
                            highlight(canvasS2, area, g, CanvS2)
                        }
                    });
                    break;

                case "AirFlow":
                    CanvS3.Pop();
                    s3.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS3 = canvas;
                            highlight(canvasS3, area, g, CanvS3)
                        }
                    });
                    break;

                case "RIPFlow":
                    CanvS4.Pop();
                    s4.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS4 = canvas;
                            highlight(canvasS4, area, g, CanvS4)
                        }
                    });
                    break;

                case "spO2BB":
                    CanvS5.Pop();
                    s5.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS5 = canvas;
                            highlight(canvasS5, area, g, CanvS5)
                        }
                    });
                    break;

                case "InductanceThora":
                    CanvS6.Pop();
                    s6.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS6 = canvas;
                            highlight(canvasS6, area, g, CanvS6)
                        }
                    });
                    break;

                case "InductanceAbdom":
                    CanvS7.Pop();
                    s7.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS7 = canvas;
                            highlight(canvasS7, area, g, CanvS7)
                        }
                    });
                    break;
            }
            return false;
        }

        function Sono() {
            var tabminS1 = [];
            var tabmaxS1 = [];
            var canvasS1 = 1;
            var colorSets = [['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0']];
            var tab = window.name;
            tab = tab.split(",");
            for (var i = 0; i < 38; i++) {
                if (tab[i] != "") {
                    colorSets[i] = tab[i]
                }
            }
            var e = document.getElementById("hdnFiltre");
            var CSV = e.value;
            var tabCSV = CSV.split(";");
            console.log(tabCSV);
            console.log(colorSets);
            SetCanva();

            // Exemple création graphe avec deux courbes 
            s1 = new Dygraph(
                document.getElementById("AudioVolumeDB"),
                tabCSV[6], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS1.min[CanvS1.length - 1] != minTime && CanvS1.max[CanvS1.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvS1.Push(minTime, maxTime, ColorFromDDL());
                            canvasS1 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS1.min.length > 0 && canvasS1 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS1 = canvas;
                                    highlight(canvasS1, area, g, CanvS1)
                                }
                            });
                        }
                    },
                    colors: [colorSets[12]],
                    fillGraph: parseInt(colorSets[31])
                });
            

            s2 = new Dygraph(
                document.getElementById("SnoringS"),
                tabCSV[7], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS2.min[CanvS2.length - 1] != minTime && CanvS2.max[CanvS2.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvS2.Push(minTime, maxTime, ColorFromDDL());
                            canvasS2 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS2.min.length > 0 && canvasS2 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS2 = canvas;
                                    highlight(canvasS2, area, g, CanvS2)
                                }
                            });
                        }
                    },
                    colors: [colorSets[13]],
                    fillGraph: parseInt(colorSets[32])
                });

            s3 = new Dygraph(
                document.getElementById("AirFlow"),
                tabCSV[8], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                          
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS3.min[CanvS3.length - 1] != minTime && CanvS3.max[CanvS3.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvS3.Push(minTime, maxTime, ColorFromDDL());
                            canvasS3 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS3.min.length > 0 && canvasS3 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS3 = canvas;
                                    highlight(canvasS3, area, g, CanvS3)
                                }
                            });
                        }
                    },
                    colors: [colorSets[14]],
                    fillGraph: parseInt(colorSets[33])
                });

            s4 = new Dygraph(
                document.getElementById("RIPFlow"),
                tabCSV[9], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {

                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS4.min[CanvS4.length - 1] != minTime && CanvS4.max[CanvS4.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvS4.Push(minTime, maxTime, ColorFromDDL());
                            canvasS4 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS4.min.length > 0 && canvasS4 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS4 = canvas;
                                    highlight(canvasS4, area, g, CanvS4)
                                }
                            });
                        }
                    },
                    colors: [colorSets[15]],
                    fillGraph: parseInt(colorSets[34])
                });

            s5 = new Dygraph(
                document.getElementById("spO2BB"),
                tabCSV[10], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 20],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS5.min[CanvS5.length - 1] != minTime && CanvS5.max[CanvS5.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 20 + 50)) {
                            CanvS5.Push(minTime, maxTime, ColorFromDDL());
                            canvasS5 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 20], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS5.min.length > 0 && canvasS5 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS5 = canvas;
                                    highlight(canvasS5, area, g, CanvS5)
                                }
                            });
                        }
                    },
                    colors: [colorSets[16]],
                    fillGraph: parseInt(colorSets[35])
                });

            s6 = new Dygraph(
                document.getElementById("InductanceThora"),
                tabCSV[11], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                          
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 4],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS6.min[CanvS6.length - 1] != minTime && CanvS6.max[CanvS6.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 4 + 50)) {
                            CanvS6.Push(minTime, maxTime, ColorFromDDL());
                            canvasS6 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 4], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS6.min.length > 0 && canvasS6 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS6 = canvas;
                                    highlight(canvasS6, area, g, CanvS6)
                                }
                            });
                        }
                    },
                    colors: [colorSets[17]],
                    fillGraph: parseInt(colorSets[36])
                });

            s7 = new Dygraph(
                document.getElementById("InductanceAbdom"),
                tabCSV[12], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 4],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS7[CanvS7.length - 1] != minTime && CanvS7.max[CanvS7.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 4 + 50)) {
                            CanvS7.Push(minTime, maxTime, ColorFromDDL());
                            canvasS7 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 4], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS7.min.length > 0 && canvasS7 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS7 = canvas;
                                    highlight(canvasS7, area, g, CanvS7)
                                }
                            });
                        }
                    },
                    colors: [colorSets[18]],
                    fillGraph: parseInt(colorSets[37])
                });          
        }

        function ChangeColor() {

            var colorAvailable = [['#000000'], ['#FF0000'], ['#FFA500'], ['#FFFF00'], ['#00FF00'], ['#00008B'], ['#00BFFF'], ['#9400D3'], ['#FF1493'], ['#8B4513']];

            var e = document.getElementById("DDLColor");
            var indColor = parseInt(e.options[e.selectedIndex].value);
            var e = document.getElementById("DDLGraph");
            var graphName = e.options[e.selectedIndex].value;
            var e = document.getElementById("DDLType");
            var type = e.options[e.selectedIndex].value;
            console.log(type);

            var colorSets = [['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0']];
            var tab = window.name;
            tab = tab.split(",");

            for (var i = 0; i < 38; i++)
            {
                if (tab[i] != "")
                {
                    colorSets[i] = tab[i]
                }
                
            }

            
            switch (graphName) {

                case "E1-M1":   
                    colorSets[0] = colorAvailable[indColor];
                    if (type == "1") { colorSets[19] = ['1'];}
                    window.name = colorSets;
                    n01.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[19]) });
                    break;
                case "E2-M1":
                    colorSets[1] = colorAvailable[indColor];
                    if (type == "1") { colorSets[20] = ['1']; }
                    window.name = colorSets;
                    n02.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[20]) });
                    break;
                case "F4-M1":
                    colorSets[2] = colorAvailable[indColor];
                    if (type == "1") { colorSets[21] = ['1']; }
                    window.name = colorSets;
                    
                    break;
                case "F3-M2":
                    colorSets[3] = colorAvailable[indColor];
                    if (type == "1") { colorSets[22] = ['1']; }
                    window.name = colorSets;
                    n03.F3M2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[22]) });
                    break;
                case "C4-M1":
                    colorSets[4] = colorAvailable[indColor];
                    if (type == "1") { colorSets[23] = ['1']; }
                    window.name = colorSets;
                    n03.C4M1.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[23]) });
                    break;
                case "C3-M2":
                    colorSets[5] = colorAvailable[indColor];
                    if (type == "1") { colorSets[24] = ['1']; }
                    window.name = colorSets;
                    n03.C3M2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[24]) });
                    break;
                case "O2-M1":
                    colorSets[6] = colorAvailable[indColor];
                    if (type == "1") { colorSets[25] = ['1']; }
                    window.name = colorSets;
                    n03.O2M1.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[25]) });
                    break;
                case "O1-M2":
                    colorSets[7] = colorAvailable[indColor];
                    if (type == "1") { colorSets[26] = ['1']; }
                    window.name = colorSets;
                    n03.O1M2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[26]) });
                    break;
                case "1-2":
                    colorSets[8] = colorAvailable[indColor];
                    if (type == "1") { colorSets[27] = ['1']; }
                    window.name = colorSets;
                    n04.g12.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[27]) });
                    break;
                case "1-F":
                    colorSets[9] = colorAvailable[indColor];
                    if (type == "1") { colorSets[28] = ['1']; }
                    window.name = colorSets;
                    n04.g1F.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[28]) });
                    break;
                case "ECG":
                    colorSets[10] = colorAvailable[indColor];
                    if (type == "1") { colorSets[29] = ['1']; }
                    window.name = colorSets;
                    n05.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[29]) });
                    break;
                case "HeartRate":
                    colorSets[11] = colorAvailable[indColor];
                    if (type == "1") { colorSets[30] = ['1']; }
                    window.name = colorSets;
                    n06.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[30]) });
                    break;
                case "AudioVolumeDB":
                    colorSets[12] = colorAvailable[indColor];
                    if (type == "1") { colorSets[31] = ['1']; }
                    window.name = colorSets;
                    s1.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[31]) });
                    break;
                case "Snoring":
                    colorSets[13] = colorAvailable[indColor];
                    colorSets[0] = colorAvailable[indColor];
                    if (type == "1") { colorSets[32] = ['1']; colorSets[18] = ['1']; }
                    s2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[32]) });
                    window.name = colorSets;
                    break;
                case "AirFlow":
                    colorSets[14] = colorAvailable[indColor];
                    if (type == "1") { colorSets[33] = ['1']; }
                    window.name = colorSets;
                    s3.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[33]) });
                    break;
                case "RIPFlow":
                    colorSets[15] = colorAvailable[indColor];
                    if (type == "1") { colorSets[34] = ['1']; }
                    window.name = colorSets;
                    s4.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[34]) });
                    break;
                case "spO2B-B":
                    colorSets[16] = colorAvailable[indColor];
                    if (type == "1") { colorSets[35] = ['1']; }
                    window.name = colorSets;
                    s2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[35]) });
                    break;
                case "InductanceThora":
                    colorSets[17] = colorAvailable[indColor];
                    if (type == "1") { colorSets[36] = ['1']; }
                    window.name = colorSets;
                    s2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[36]) });
                    break;
                case "InductanceAbdom":
                    colorSets[18] = colorAvailable[indColor];
                    if (type == "1") { colorSets[37] = ['1']; }
                    window.name = colorSets;
                    s2.updateOptions({ colors: [colorAvailable[indColor]], fillGraph: parseInt(colorSets[37]) });
                    break;
                

            }

          
            return false;

        }

        function Neuro() {

            var colorSets = [['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['#000000'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0'], ['0']];
            var tab = window.name;

            tab = tab.split(",");

            for (var i = 0; i < 38; i++) {
                if (tab[i] != "") {
                    colorSets[i] = tab[i]
                }
            }

            var e = document.getElementById("hdnFiltre");
            var CSV = e.value;
            var tabCSV = CSV.split(";");
            console.log(tabCSV);

            console.log(colorSets);
            var tabminN01 = [];
            var tabmaxN01 = [];
            var canvasN01 = 1;
            SetCanva();

            n01 = new Dygraph(
                document.getElementById("E1M1"),
                tabCSV[0], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           
                        },
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {            
                        this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                    colors: [colorSets[0]],
                    fillGraph: parseInt(colorSets[19])

                });

            n02 = new Dygraph(
                document.getElementById("E2M1"),
                tabCSV[1], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           

                        },
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                    colors: [colorSets[1]],
                    fillGraph: parseInt(colorSets[20])
                });

            n03 = new Dygraph(
                document.getElementById("Group1"),
                tabCSV[2], {
                    showLabelsOnHighlight: true,
                    //labels: ['Time','F4-M1', 'F3-M2', 'C4-M1', 'C3-M2', 'O2-M1', 'O1-M2'],
                    series: {
                        F4M1: {
                            color: [colorSets[2]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[21])
                        },
                        F3M2: {
                            color: [colorSets[3]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[22])
                        },
                        C4M1: {
                            color: [colorSets[4]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[23])
                        },
                        C3M2: {
                            color: [colorSets[5]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[24])
                        },
                        O2M1: {
                            color: [colorSets[6]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[25])
                        },
                        O1M2: {
                            color: [colorSets[7]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[26])
                        },
                    },
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           
                        },
                    },

                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                                        
                    
                });

            n04 = new Dygraph(
                document.getElementById("Group2"),
                tabCSV[3], {
                    showLabelsOnHighlight: true,
                    // labels: ['Time','12', '1F'],
                    series: {
                        g12: {
                            color: [colorSets[8]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[27])
                        },
                        g1F: {
                            color: [colorSets[9]],
                            strokeWidth: 2,
                            fillGraph: parseInt(colorSets[28])
                        },
                    },
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {

                        },
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                         this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                        
                        
                    
                });
            


            n05 = new Dygraph(
                document.getElementById("ECG"),
                tabCSV[4], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                           
                        },
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                    colors: [colorSets[10]],
                    fillGraph: parseInt(colorSets[29])
                });

            n06 = new Dygraph(
                document.getElementById("HeartRate"),
                tabCSV[5], {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            
                        },
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        this.updateOptions({ dateWindow: [0, dataRange], });
                    },
                    colors: [colorSets[11]],
                    fillGraph: parseInt(colorSets[30])
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
                        <asp:ImageButton runat="server" ID="imgPedro" ImageUrl="img/alpaga.jpg" Height="75px" Width="150px" Visible="false" OnClick="imgPedro_Click" />
                        <asp:Label runat="server" ID="lbl_pedro" Text="Pedro" Font-Size="12px" Visible="false"></asp:Label>

                        <asp:Button runat="server" ID="btnTest" Text="Test"  />
                    </div>
                    <div class="Div_param">
                         <asp:ScriptManager ID="ScriptManager2" runat="server" />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                        <asp:Label runat="server" Text="Couleur des graphes" Style="margin-left: 5%;"></asp:Label>
                        <br />
                        <asp:Label runat="server" Text="" Style="margin-left: 5%;"></asp:Label>
                        <asp:DropDownList ID="DDLColor" AutoPostBack="True" runat="server" >
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
                        <asp:DropDownList ID="DDLType" AutoPostBack="True" runat="server" >
                            <asp:ListItem Selected="True" Value="0"> Vide </asp:ListItem>
                            <asp:ListItem Value="1"> Plein </asp:ListItem>                      
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLGraph" AutoPostBack="True" runat="server" >
                        </asp:DropDownList>
                        <asp:Button runat="server" Text="Appliquer" ID="btnApplyChange" OnClientClick=" return ChangeColor()" />
                                <br /><br />
                                <asp:Label runat="server" Text="Couleur des scoring" Style="margin-left: 5%;"></asp:Label>
                                <br />
                                <asp:Label runat="server" Text="" Style="margin-left: 5%;"></asp:Label>
                                <asp:DropDownList ID="DDLScoring" AutoPostBack="True" runat="server">
                                    <asp:ListItem Selected="True" Value="0" style="background-color: #000000; color: white;"> Noir </asp:ListItem>
                                    <asp:ListItem Value="1" style="background-color: #FF0000;"> Rouge </asp:ListItem>
                                    <asp:ListItem Value="2" style="background-color: #FFA500;"> Orange </asp:ListItem>
                                    <asp:ListItem Value="3" style="background-color: #FFFF00;"> Jaune </asp:ListItem>
                                    <asp:ListItem Value="4" style="background-color: #00FF00;"> Vert </asp:ListItem>
                                    <asp:ListItem Value="5" style="background-color: #00008B; color: white;"> Bleu </asp:ListItem>
                                    <asp:ListItem Value="6" style="background-color: #00BFFF;"> Cyan </asp:ListItem>
                                    <asp:ListItem Value="7" style="background-color: #9400D3;"> Violet </asp:ListItem>
                                    <asp:ListItem Value="8" style="background-color: #FF1493;"> Rose </asp:ListItem>
                                    <asp:ListItem Value="9" style="background-color: #8B4513;"> Marron </asp:ListItem>
                                </asp:DropDownList>
                                <br /><br />
                        <asp:Label runat="server" Text="Filtrage" Style="margin-left:5%;"></asp:Label>
                        <br />
                         <asp:Label runat="server" Text="" Style="margin-left: 5%;"></asp:Label>
                        <asp:DropDownList ID="DDLFiltre" AutoPostBack="True" runat="server">
                            <asp:ListItem Selected="True" Value="Low" > Passe-bas </asp:ListItem>
                            <asp:ListItem Value="High"> Passe-haut </asp:ListItem>                      
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDLGraph2" AutoPostBack="True" runat="server" >
                        </asp:DropDownList>
                        <asp:TextBox ID="txtboxFiltre" runat="server" Text="Fc" Width="30px"></asp:TextBox>
                        <asp:Button runat="server" Text="Appliquer" ID="btnFilt" OnClick="btnFilt_Click" />
                        <asp:HiddenField runat="server" Value="" ID="hdnFiltre"  />
                                  </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div style="margin-right: 3%; width: 20%; float: right; padding-top: 15vh;">
                    <asp:Button class="btn_sono" runat="server" Text="Neurologie" ID="btnNeuro" Style="margin-bottom: 0%; float: right;" OnClientClick="GetCanva();" OnClick="btnNeuro_Click" />
                    <asp:Button class="btn_sono" runat="server" Text="Sonore" ID="btnSono" Style="float: right;" OnClientClick="GetCanva();" OnClick="btnSono_Click" />
                </div>
                <div style="width: 42%; float: right; padding-top: 1%; height: 17vh;">
                    <%-- Division où il y aura les boutons pour chaque fonctionnalité --%>
                    <asp:Button class="btns" runat="server" Text="Générer un rapport" ID="btn_GenereRapport" Style="margin-left: 0%;" />
                    <asp:Button class="btns" runat="server" Text="Sauvegarder" ID="btn_Save" Style="margin-left: 1%;" />
                    <asp:Button class="btns" runat="server" Text="Capturer l'écran" ID="btn_CaptEcran" Style="margin-left: 1%;" OnClick="btn_CaptEcran_Click" />
                    <asp:Button class="btns" runat="server" Text="Voir les captures" ID="btn_VoirCapt" Style="margin-left: 1%;" OnClick="btn_VoirCapt_Click" />
                </div>
            </div>
            <asp:HiddenField runat="server" ID="hfCanva" />
            <div class="Div_Graphe" style="padding-top: 2%">
                <asp:Repeater ID="rptNeuro" OnItemCommand="rptNeuro_ItemCommand" runat="server">
                    <ItemTemplate>
                        <td>
                            <div class="labelRepeater">
                                <asp:LinkButton ID="lbRepeater" runat="server" Style="padding-top: 5px; padding-right: 10px;" Text='<%# DataBinder.Eval(Container.DataItem,"Nom")%>'></asp:LinkButton>
                                <asp:ImageButton runat="server" ImageUrl="img/undo32.png" Width="16px" Height="16px" ID="btnUndo" Text="Undo" Style="float: left; margin: 5px; padding-top: 15px;"
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"divID")%>' OnClientClick='<%# " return Undo("+Eval("divID")+")"%>' />
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
