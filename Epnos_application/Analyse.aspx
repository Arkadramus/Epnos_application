﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analyse.aspx.cs" Inherits="Epnos_application.Analyse" %>

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
            var dataRange = 60000; //en ms
            var rangeHeight = 10;
            var iDataRange = 0; //Pour savoir de combien on est décalé

            var CanvS1 = new Canva();
            var CanvS2 = new Canva();
            var CanvS3 = new Canva();
            var CanvS4 = new Canva();
            var CanvS5 = new Canva();
            var CanvS6 = new Canva();
            var CanvS7 = new Canva();
            var CanvS8 = new Canva();
            var CanvN2 = new Canva();
            var CanvN3 = new Canva();
            var CanvN4 = new Canva();
            var CanvN5 = new Canva();
            var CanvN6 = new Canva();
            var CanvN7 = new Canva();
            var CanvN8 = new Canva();
            var CanvN9 = new Canva();
            var CanvN10 = new Canva();

            var canvasS1, canvasS2, canvasS3, canvasS4, canvasS5, canvasS6, canvasS7, canvasS8 = 1;
            var canvasN01, canvasN02, canvasN03, canvasN04, canvasN05, canvasN06, canvasN07, canvasN07, canvasN08, canvasN09, canvasN10 = 1;
        }

        function GetCanva() {
            var res = "";
            var hfValue = document.getElementById("hfCanva").value;

            if (!(hfValue === "") && hfValue)
                res = hfValue;

            if (!CanvS2.IsEmpty())
                res += "s02" + CanvS2.min + "/" + CanvS2.max + "/" + CanvS2.color + ";";

            if (document.getElementById("btnNeuro").style.backgroundColor == "white") {
                if (!CanvN2.IsEmpty())
                    res += "n02" + CanvN2.min + "/" + CanvN2.max + "/" + CanvN2.color + ";";
                if (!CanvN3.IsEmpty())
                    res += "n03" + CanvN3.min + "/" + CanvN3.max + "/" + CanvN3.color + ";";
                if (!CanvN4.IsEmpty())
                    res += "n04" + CanvN4.min + "/" + CanvN4.max + "/" + CanvN4.color + ";";
                if (!CanvN5.IsEmpty())
                    res += "n05" + CanvN5.min + "/" + CanvN5.max + "/" + CanvN5.color + ";";
                if (!CanvN6.IsEmpty())
                    res += "n06" + CanvN6.min + "/" + CanvN6.max + "/" + CanvN6.color + ";";
                if (!CanvN7.IsEmpty())
                    res += "n07" + CanvN7.min + "/" + CanvN7.max + "/" + CanvN7.color + ";";
                if (!CanvN8.IsEmpty())
                    res += "n08" + CanvN8.min + "/" + CanvN8.max + "/" + CanvN8.color + ";";
                if (!CanvN9.IsEmpty())
                    res += "n09" + CanvN9.min + "/" + CanvN9.max + "/" + CanvN9.color + ";";
                if (!CanvN10.IsEmpty())
                    res += "n10" + CanvN10.min + "/" + CanvN10.max + "/" + CanvN10.color + ";";
            } else {
                if (!CanvS1.IsEmpty())
                    res += "s01" + CanvS1.min + "/" + CanvS1.max + "/" + CanvS1.color + ";";
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
                if (!CanvS8.IsEmpty())
                    res += "s08" + CanvS8.min + "/" + CanvS8.max + "/" + CanvS8.color + ";";
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
                                case "n02":
                                    CanvN2.min = min;
                                    CanvN2.max = max;
                                    CanvN2.color = color;
                                    break;

                                case "n03":
                                    CanvN3.min = min;
                                    CanvN3.max = max;
                                    CanvN3.color = color;
                                    break;

                                case "n04":
                                    CanvN4.min = min;
                                    CanvN4.max = max;
                                    CanvN4.color = color;
                                    break;

                                case "n05":
                                    CanvN5.min = min;
                                    CanvN5.max = max;
                                    CanvN5.color = color;
                                    break;

                                case "n06":
                                    CanvN6.min = min;
                                    CanvN6.max = max;
                                    CanvN6.color = color;
                                    break;

                                case "n07":
                                    CanvN7.min = min;
                                    CanvN7.max = max;
                                    CanvN7.color = color;
                                    break;
                                case "n08":
                                    CanvN8.min = min;
                                    CanvN8.max = max;
                                    CanvN8.color = color;
                                    break;

                                case "n09":
                                    CanvN9.min = min;
                                    CanvN9.max = max;
                                    CanvN9.color = color;
                                    break;

                                case "n10":
                                    CanvN10.min = min;
                                    CanvN10.max = max;
                                    CanvN10.color = color;
                                    break;

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

                                case "s08":
                                    CanvS8.min = min;
                                    CanvS8.max = max;
                                    CanvS8.color = color;
                                    break;
                            }
                        }
                    });
                }
            }
        }

        function Highlight(canvasName, area, g, Canv) {
            for (var i = 0; i < Canv.min.length; i++) {
                canvasName.fillStyle = Canv.color[i];
                //fillrectangle(x,y,width,heigh)
                canvasName.fillRect(g.toDomCoords(Canv.min[i], -20)[0], 0, g.toDomCoords(Canv.max[i], +20)[0] - g.toDomCoords(Canv.min[i], -20)[0], area.h);
            }
        }

        function MoveDiagraph(sens) {
            if (sens == 2)//Aller à droite
                iDataRange++;
            else if (sens == 1)//Aller à gauche
                iDataRange--;

            n01.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n02.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n03.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n04.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n05.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n06.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n07.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n08.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });
            n09.updateOptions({ dateWindow: [iDataRange * dataRange, (iDataRange + 1) * dataRange] });

            return false;
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

        function ChangeColor() {

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
                    n02.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[1] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "E1-M1":
                    n03.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[2] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "C3-M2":
                    n04.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[3] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "F3-M2":
                    n05.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[4] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "O1-M2":
                    n06.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[5] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "1-F":
                    n07.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[6] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "1-2":
                    n08.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[7] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "ECG":
                    n09.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[8] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "HeartRate":
                    n10.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[9] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "AudioVolumeDB":
                    s1.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[10] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "Snoring":
                    s2.updateOptions({ colors: [colorAvailable[indColor]] });
                    n01.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[11] = colorAvailable[indColor];
                    colorSets[0] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "AirFlow":
                    s3.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[12] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "RIPFlow":
                    s4.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[13] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "spO2B-B":
                    s5.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[14] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "InductanceThora":
                    s6.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[15] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "InductanceAbdom":
                    s7.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[16] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;
                case "K":
                    s8.updateOptions({ colors: [colorAvailable[indColor]] });
                    colorSets[17] = colorAvailable[indColor];
                    window.name = colorSets;
                    break;

            }

            return false;
        }

        function Undo(divGraph) {
            console.log(divGraph.id);
            switch (divGraph.id) {
                case "AudioVolumeDB":
                    CanvS1.Pop();
                    s1.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS1 = canvas;
                            Highlight(canvasS1, area, g, CanvS1)
                        }
                    });
                    break;

                case "SnoringS":
                    CanvS2.Pop();
                    s2.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS2 = canvas;
                            Highlight(canvasS2, area, g, CanvS2)
                        }
                    });
                    break;

                case "AirFlow":
                    CanvS3.Pop();
                    s3.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS3 = canvas;
                            Highlight(canvasS3, area, g, CanvS3)
                        }
                    });
                    break;

                case "RIPFlow":
                    CanvS4.Pop();
                    s4.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS4 = canvas;
                            Highlight(canvasS4, area, g, CanvS4)
                        }
                    });
                    break;

                case "spO2BB":
                    CanvS5.Pop();
                    s5.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS5 = canvas;
                            Highlight(canvasS5, area, g, CanvS5)
                        }
                    });
                    break;

                case "InductanceThora":
                    CanvS6.Pop();
                    s6.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS6 = canvas;
                            Highlight(canvasS6, area, g, CanvS6)
                        }
                    });
                    break;

                case "InductanceAbdom":
                    CanvS7.Pop();
                    s7.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS7 = canvas;
                            Highlight(canvasS7, area, g, CanvS7)
                        }
                    });
                    break;

                case "K":
                    CanvS8.Pop();
                    s8.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasS8 = canvas;
                            Highlight(canvasS8, area, g, CanvS8)
                        }
                    });
                    break;

                case "SnoringN":
                    CanvS2.Pop();
                    n01.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN01 = canvas;
                            Highlight(canvasN01, area, g, CanvS2)
                        }
                    });
                    break;

                case "E2M1":
                    CanvN2.Pop();
                    n02.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN02 = canvas;
                            Highlight(canvasN02, area, g, CanvN2)
                        }
                    });
                    break;

                case "E1M1":
                    CanvN3.Pop();
                    n03.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN03 = canvas;
                            Highlight(canvasN03, area, g, CanvN3)
                        }
                    });
                    break;

                case "C3M2":
                    CanvN4.Pop();
                    n04.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN04 = canvas;
                            Highlight(canvasN04, area, g, CanvN4)
                        }
                    });
                    break;

                case "F3M2":
                    CanvN5.Pop();
                    n05.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN05 = canvas;
                            Highlight(canvasN05, area, g, CanvN5)
                        }
                    });
                    break;

                case "O1M2":
                    CanvN6.Pop();
                    n06.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN06 = canvas;
                            Highlight(canvasN06, area, g, CanvN6)
                        }
                    });
                    break;

                case "1F":
                    CanvN7.Pop();
                    n07.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN07 = canvas;
                            Highlight(canvasN07, area, g, CanvN7)
                        }
                    });
                    break;

                case "12":
                    CanvN8.Pop();
                    n08.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN08 = canvas;
                            Highlight(canvasN08, area, g, CanvN8)
                        }
                    });
                    break;

                case "ECG":
                    CanvN9.Pop();
                    n09.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN09 = canvas;
                            Highlight(canvasN09, area, g, CanvN9)
                        }
                    });
                    break;

                case "HeartRate":
                    CanvN10.Pop();
                    n10.updateOptions({
                        underlayCallback: function (canvas, area, g) {
                            canvasN10 = canvas;
                            Highlight(canvasN10, area, g, CanvN10)
                        }
                    });
                    break;
            }
            return false;
        }

        function Sono() {
            var tab = window.name;
            colorSets = tab.split(",");
            SetCanva();
            s1 = new Dygraph(
                document.getElementById("AudioVolumeDB"),
                "EDF/AudioVolumeDB.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            axisLabelFormatter: function (v) {
                                return v + 'dB';
                            }
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
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange] });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS1.min.length > 0 && canvasS1 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS1 = canvas;
                                    Highlight(canvasS1, area, g, CanvS1);
                                }
                            });
                        }
                    },
                    colors: [colorSets[10]]
                });

            s2 = new Dygraph(
                document.getElementById("SnoringS"),
                "EDF/Snoring.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 200, label: "200µV/cm" }];
                            },
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
                                    Highlight(canvasS2, area, g, CanvS2)
                                }
                            });
                        }
                    },
                    colors: [colorSets[11]]
                });

            s3 = new Dygraph(
                document.getElementById("AirFlow"),
                "EDF/AirFlow.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 2000, label: "2000µV/cm" }, { v: 4000, label: "4000µV/cm" },
                                { v: 6000, label: "6000µV/cm" }];
                            },
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
                                    Highlight(canvasS3, area, g, CanvS3)
                                }
                            });
                        }
                    },
                    colors: [colorSets[12]]
                });

            s4 = new Dygraph(
                document.getElementById("RIPFlow"),
                "EDF/RIPFlow.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 3000, label: "3000µV/cm" },
                                { v: 6000, label: "6000µV/cm" }, { v: -3000, label: "-3000µV/cm" },
                                { v: -6000, label: "-6000µV/cm" }];
                            },
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 4],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS4.min[CanvS4.length - 1] != minTime && CanvS4.max[CanvS4.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 4 + 50)) {
                            CanvS4.push(maxTime);
                            canvasS4 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 4], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS4.min.length > 0 && canvasS4 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS4 = canvas;
                                    Highlight(canvasS4, area, g, CanvS4)
                                }
                            });
                        }
                    },
                    colors: [colorSets[13]]
                });

            s5 = new Dygraph(
                document.getElementById("spO2BB"),
                "EDF/spO2B-B.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 800, label: "80%" }, { v: 900, label: "90%" },
                                { v: 1000, label: "100%" }];
                            },
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
                                    Highlight(canvasS5, area, g, CanvS5)
                                }
                            });
                        }
                    },
                    colors: [colorSets[14]]
                });

            s6 = new Dygraph(
                document.getElementById("InductanceThora"),
                "EDF/InductanceThora.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 8000, label: "8000µV/cm" }, { v: 4000, label: "4000µV/cm" },
                                { v: 6000, label: "6000µV/cm" },];
                            },
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
                                    Highlight(canvasS6, area, g, CanvS6)
                                }
                            });
                        }
                    },
                    colors: [colorSets[15]]
                });

            s7 = new Dygraph(
                document.getElementById("InductanceAbdom"),
                "EDF/InductanceAbdom.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 8000, label: "8000µV/cm" }, { v: 4000, label: "4000µV/cm" },
                                { v: 6000, label: "6000µV/cm" },];
                            },
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
                                    Highlight(canvasS7, area, g, CanvS7)
                                }
                            });
                        }
                    },
                    colors: [colorSets[16]]
                });

            s8 = new Dygraph(
                document.getElementById("K"),
                "EDF/K.csv", {
                    showLabelsOnHighlight: true,
                    axes: {
                        x: {
                            axisLabelFormatter: function (v) {
                                return v + ' ms';  // controls formatting of the x-axis labels
                            },
                        },
                        y: {
                            ticker: function (mimn, max, pixels, opts, grpah, val) {
                                return [{ v: 0, label: "0µV/cm" }, { v: 8000, label: "8000µV/cm" }, { v: 4000, label: "4000µV/cm" },
                                { v: 6000, label: "6000µV/cm" },];
                            },
                        }
                    },
                    showRangeSelector: true,
                    rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange * 4],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS8.min[CanvS8.length - 1] != minTime && CanvS8.max[CanvS8.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 4 + 50)) {
                            CanvS8.Push(minTime, maxTime, ColorFromDDL());
                            canvasS8 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 4], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS8.min.length > 0 && canvasS8 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasS8 = canvas;
                                    Highlight(canvasS8, area, g, CanvS8)
                                }
                            });
                        }
                    },
                    colors: [colorSets[17]]
                });
        }

        function Neuro() {
            var tab = window.name;
            colorSets = tab.split(",");
            SetCanva();
            n01 = new Dygraph(
                document.getElementById("SnoringN"),
                "EDF/Snoring.csv", {
                    showLabelsOnHighlight: true,
                    //axes: {
                    //    x: {
                    //        axisLabelFormatter: function (v) {
                    //            return v + ' ms';  // controls formatting of the x-axis labels
                    //        },
                    //    },
                    //    y: {
                    //        ticker: function (mimn, max, pixels, opts, grpah, val) {
                    //            return [{ v: 0, label: "0µV/cm" }, { v: 200, label: "200µV/cm" }];
                    //        },
                    //    },
                    //},
                    //showRangeSelector: true,
                    //rangeSelectorHeight: rangeHeight,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvS2.min[CanvS2.length - 1] != minTime && CanvS2.max[CanvS2.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvS2.Push(minTime, maxTime, ColorFromDDL());
                            canvasN01 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvS2.min.length > 0 && canvasN01 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN01 = canvas;
                                    Highlight(canvasN01, area, g, CanvS2)
                                }
                            });
                        }
                    },
                    colors: [colorSets[0]]
                });

            n02 = new Dygraph(
                document.getElementById("E2M1"),
                "EDF/E2-M1.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN2.min[CanvN2.length - 1] != minTime && CanvN2.max[CanvN2.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN2.Push(minTime, maxTime, ColorFromDDL());
                            canvasN02 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN2.min.length > 0 && canvasN02 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN02 = canvas;
                                    Highlight(canvasN02, area, g, CanvN2)
                                }
                            });
                        }
                    },
                    colors: [colorSets[1]]
                });

            n03 = new Dygraph(
                document.getElementById("E1M1"),
                "EDF/E1-M1.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN3.min[CanvN3.length - 1] != minTime && CanvN3.max[CanvN3.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN3.Push(minTime, maxTime, ColorFromDDL());
                            canvasN03 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN3.min.length > 0 && canvasN03 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN03 = canvas;
                                    Highlight(canvasN03, area, g, CanvN3)
                                }
                            });
                        }
                    },
                    colors: [colorSets[2]]
                });

            n04 = new Dygraph(
                document.getElementById("C3M2"),
                "EDF/C3-M2.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN4.min[CanvN4.length - 1] != minTime && CanvN4.max[CanvN4.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN4.Push(minTime, maxTime, ColorFromDDL());
                            canvasN04 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN4.min.length > 0 && canvasN04 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN04 = canvas;
                                    Highlight(canvasN04, area, g, CanvN4)
                                }
                            });
                        }
                    },
                    colors: [colorSets[3]]
                });

            n05 = new Dygraph(
                document.getElementById("F3M2"),
                "EDF/F3-M2.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN5.min[CanvN5.length - 1] != minTime && CanvN5.max[CanvN5.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN5.Push(minTime, maxTime, ColorFromDDL());
                            canvasN05 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN5.min.length > 0 && canvasN05 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN05 = canvas;
                                    Highlight(canvasN05, area, g, CanvN5)
                                }
                            });
                        }
                    },
                    colors: [colorSets[4]]
                });

            n06 = new Dygraph(
                document.getElementById("O1M2"),
                "EDF/O1-M2.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN6.min[CanvN6.length - 1] != minTime && CanvN6.max[CanvN6.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN6.Push(maxTime);
                            canvasN06 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN6.min.length > 0 && canvasN06 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN06 = canvas;
                                    Highlight(canvasN06, area, g, CanvN6)
                                }
                            });
                        }
                    },
                    colors: [colorSets[5]]
                });

            n07 = new Dygraph(
                document.getElementById("1F"),
                "EDF/1-F.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN7.min[CanvN7.length - 1] != minTime && CanvN7.max[CanvN7.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN7.Push(minTime, maxTime, ColorFromDDL());
                            canvasN07 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN7.min.length > 0 && canvasN07 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN07 = canvas;
                                    Highlight(canvasN07, area, g, CanvN7)
                                }
                            });
                        }
                    },
                    colors: [colorSets[6]]
                });

            n08 = new Dygraph(
                document.getElementById("12"),
                "EDF/1-2.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN8.min[CanvN8.length - 1] != minTime && CanvN8.max[CanvN8.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN8.Push(minTime, maxTime, ColorFromDDL());
                            canvasN08 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN8.min.length > 0 && canvasN08 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN08 = canvas;
                                    Highlight(canvasN08, area, g, CanvN8)
                                }
                            });
                        }
                    },
                    colors: [colorSets[7]]
                });

            n09 = new Dygraph(
                document.getElementById("ECG"),
                "EDF/ECG.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN9.min[CanvN9.length - 1] != minTime && CanvN9.max[CanvN9.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange + 50)) {
                            CanvN9.Push(minTime, maxTime, ColorFromDDL());
                            canvasN09 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN9.min.length > 0 && canvasN09 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN09 = canvas;
                                    Highlight(canvasN09, area, g, CanvN9)
                                }
                            });
                        }
                    },
                    colors: [colorSets[8]]
                });

            n10 = new Dygraph(
                document.getElementById("HeartRate"),
                "EDF/HeartRate.csv", {
                    showLabelsOnHighlight: true,
                    dateWindow: [0, dataRange * 20],
                    interactionModel: Dygraph.defaultInteractionModel,
                    zoomCallback: function (minTime, maxTime, yRanges) {
                        if (CanvN10.min[CanvN10.length - 1] != minTime && CanvN10.max[CanvN10.length - 1] != maxTime
                            && (maxTime - minTime) <= (dataRange * 20 + 50)) {
                            CanvN10.Push(minTime, maxTime, ColorFromDDL());
                            canvasN10 = null;
                        }
                        this.updateOptions({ dateWindow: [minTime, minTime + dataRange * 20], });
                    },
                    drawCallback: function (graph, is_initial) {
                        if (CanvN10.min.length > 0 && canvasN10 == null) { //Drawcallbak est appelé à chaque fois que canvas est utilisé, on attend donc qu'il soit à null
                            this.updateOptions({
                                underlayCallback: function (canvas, area, g) {
                                    canvasN10 = canvas;
                                    Highlight(canvasN10, area, g, CanvN10)
                                }
                            });
                        }
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
                        <asp:ImageButton runat="server" ID="imgPedro" ImageUrl="img/alpaga.jpg" Height="75px" Width="150px" Visible="false" OnClick="imgPedro_Click" />
                        <asp:Label runat="server" ID="lbl_pedro" Text="Pedro" Font-Size="12px" Visible="false"></asp:Label>
                        <%--<asp:Button runat="server" ID="btnTest" Text="Fin de projet" OnClick="btnTest_Click" />--%>
                    </div>
                    <div class="Div_param">
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                        <asp:UpdatePanel ID="Up" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label runat="server" Text="Couleur des graphes" Style="margin-left: 5%;"></asp:Label>
                                <br />
                                <asp:Label runat="server" Text="" Style="margin-left: 5%;"></asp:Label>
                                <asp:DropDownList ID="DDLColor" AutoPostBack="True" runat="server">
                                    <asp:ListItem id="selected" Selected="True" Value="0" style="background-color: #000000; color: white;"> Noir </asp:ListItem>
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
                                <asp:DropDownList ID="DDLGraph" AutoPostBack="True" runat="server">
                                </asp:DropDownList>
                                <asp:Button runat="server" Text="Appliquer" ID="btnApplyChange" OnClientClick=" return ChangeColor()" />
                                <br />
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
                                <br />
                                <asp:Button runat="server" Text="<<" ID="btnLeft" OnClientClick=" return MoveDiagraph(1)" />
                                <asp:Button runat="server" Text=">>" ID="btnRight" OnClientClick=" return MoveDiagraph(2)" />
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
