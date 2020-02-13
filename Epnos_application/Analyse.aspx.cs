﻿using System;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Windows.Forms;
using System.Collections;
using System.Web.UI.HtmlControls;


using EDF = SharpLib.EuropeanDataFormat;


namespace Epnos_application
{
    public partial class Analyse : System.Web.UI.Page
    {
        private EDF.File edfFile;

        protected void Page_Load(object sender, EventArgs e)
        {

            // Récupération du path du fichier que l'on souhaite ouvrir 
            String SelectedFile = Request.QueryString["path"];
            if (!IsPostBack)
            {
                InitSignal();
                if (Parametres.Pedro)
                {
                    imgPedro.Visible = true;
                    lbl_pedro.Visible = true;
                }
                hdnFiltre.Value = "EDF/Snoring.csv;EDF/E2-M1.csv;EDF/E1-M1.csv;EDF/C3-M2.csv;EDF/F3-M2.csv;EDF/O1-M2.csv;EDF/1-F.csv;EDF/1-2.csv;EDF/ECG.csv;EDF/HeartRate.csv;EDF/AudioVolumeDB.csv;EDF/Snoring.csv;EDF/AirFlow.csv;EDF/RIPFlow.csv;EDF/spO2B-B.csv;EDF/InductanceThora.csv;EDF/InductanceAbdom.csv;EDF/K.csv";
            }
        }

        private void InitDDLNeuro()
        {
            DDLGraph.Items.Clear();
            DDLGraph.Items.Add("Snoring");
            DDLGraph.Items.Add("E2-M1");
            DDLGraph.Items.Add("E1-M1");
            DDLGraph.Items.Add("C3-M2");
            DDLGraph.Items.Add("F3-M2");
            DDLGraph.Items.Add("O1-M2");
            DDLGraph.Items.Add("1-F");
            DDLGraph.Items.Add("1-2");
            DDLGraph.Items.Add("ECG");
            DDLGraph.Items.Add("HeartRate");
            DDLGraph.DataBind();
            DDLGraph2.Items.Clear();
            DDLGraph2.Items.Add("Snoring");
            DDLGraph2.Items.Add("E2-M1");
            DDLGraph2.Items.Add("E1-M1");
            DDLGraph2.Items.Add("C3-M2");
            DDLGraph2.Items.Add("F3-M2");
            DDLGraph2.Items.Add("O1-M2");
            DDLGraph2.Items.Add("1-F");
            DDLGraph2.Items.Add("1-2");
            DDLGraph2.Items.Add("ECG");
            DDLGraph2.Items.Add("HeartRate");
            DDLGraph2.DataBind();
        }

        private void InitDDLRespi()
        {
            DDLGraph.Items.Clear();
            DDLGraph.Items.Add("AudioVolumeDB");
            DDLGraph.Items.Add("Snoring");
            DDLGraph.Items.Add("AirFlow");
            DDLGraph.Items.Add("RIPFlow");
            DDLGraph.Items.Add("spO2B-B");
            DDLGraph.Items.Add("InductanceThora");
            DDLGraph.Items.Add("InductanceAbdom");
            DDLGraph.Items.Add("K");
            DDLGraph.DataBind();
            DDLGraph2.Items.Clear();
            DDLGraph2.Items.Add("AudioVolumeDB");
            DDLGraph2.Items.Add("Snoring");
            DDLGraph2.Items.Add("AirFlow");
            DDLGraph2.Items.Add("RIPFlow");
            DDLGraph2.Items.Add("spO2B-B");
            DDLGraph2.Items.Add("InductanceThora");
            DDLGraph2.Items.Add("InductanceAbdom");
            DDLGraph2.Items.Add("K");
            DDLGraph2.DataBind();
        }

        private void InitSignal()
        {
            int i = 0;
            while (i < Parametres.BoucleLoad) //On tente l'ouverture plusieurs fois jusqu'à ce qu'il n'y ait plus de OOM
            {
                try
                {
                    //edfFile = new EDF.File(Parametres.pathEDF);
                    i = Parametres.BoucleLoad;
                    //ReadSignal("Snoring");
                    //ReadSignal("E2-M1");
                    //ReadSignal("E1", "M1");
                    //ReadSignal("C3-M2");
                    //ReadSignal("F3-M2");
                    //ReadSignal("O1-M2");
                    //ReadSignal("1-F");
                    //ReadSignal("1-2");
                    //ReadSignal("ECG");
                    //ReadSignal("HeartRate");

                    //ReadSignal("AudioVolumeDB");
                    //ReadSignal("AirFlow");
                    //ReadSignal("RIPFlow");
                    //ReadSignal("spO2B-B");
                    //ReadSignal("InductanceThora");
                    //ReadSignal("InductanceAbdom");
                    //ReadSignal("K");
                }
                catch (Exception e)
                {
                    i++;
                    if (i >= Parametres.BoucleLoad)
                        Response.Redirect("https://www.youtube.com/watch?v=4N3N1MlvVc4");
                }
            }

        }

        #region Graphique
        private class Canva
        {
            private double Min { get; set; }
            private double Max { get; set; }
            private string Couleur { get; set; }

            public Canva()
            {
                Min = Max = 0;
                Couleur = "#000000";
            }

            public Canva(double min, double max, string couleur)
            {
                Min = min;
                Max = max;
                Couleur = couleur;
            }

        }

        struct PositionData
        {
            private string nom;
            private string divID;


            /// <summary>
            /// Le nom passé en paramètre sera donnée au label et à l'id de la div
            /// </summary>
            /// <param name="nom">Donne le nom au label et à l'id de la div</param>
            public PositionData(string nom)
            {
                this.nom = nom;
                this.divID = nom;
            }

            public PositionData(string nom, string divID)
            {
                this.nom = nom;
                this.divID = divID;
            }

            public string Nom
            {
                get
                {
                    return nom;
                }
            }

            public string DivID { get { return divID; } }
        }

        private void SetRepeater(int index = 1)
        {
            var valueNeuro = new ArrayList();
            switch (index)
            {
                default:
                case 1:
                    valueNeuro.Add(new PositionData("Snoring", "SnoringN"));
                    valueNeuro.Add(new PositionData("E2-M1", "E2M1"));//On ne met pas de "-" pour les div car sinon le JS n'aime pas
                    valueNeuro.Add(new PositionData("E1-M1", "E1M1"));
                    valueNeuro.Add(new PositionData("C3-M2", "C3M2"));
                    valueNeuro.Add(new PositionData("F3-M2", "F3M2"));
                    valueNeuro.Add(new PositionData("O1-M2", "O1M2"));
                    valueNeuro.Add(new PositionData("1-F", "1F"));
                    valueNeuro.Add(new PositionData("1-2", "12"));
                    valueNeuro.Add(new PositionData("ECG"));
                    valueNeuro.Add(new PositionData("HeartRate"));

                    rptNeuro.DataSource = valueNeuro;
                    rptNeuro.DataBind();
                    break;

                case 2:
                    valueNeuro.Add(new PositionData("AudioVolumeDB"));
                    valueNeuro.Add(new PositionData("Snoring", "SnoringS"));
                    valueNeuro.Add(new PositionData("AirFlow"));
                    valueNeuro.Add(new PositionData("RIPFlow"));
                    valueNeuro.Add(new PositionData("spO2B-B", "spO2BB"));
                    valueNeuro.Add(new PositionData("InductanceThora"));
                    valueNeuro.Add(new PositionData("InductanceAbdom"));
                    valueNeuro.Add(new PositionData("K"));

                    rptNeuro.DataSource = valueNeuro;
                    rptNeuro.DataBind();
                    break;
            }
        }

        private void ReadSignal(string labelSignal1, string labelSignal2 = null)
        {
            if (labelSignal1 != null && labelSignal2 != null)//On regarde si y'a 2 label en para. Si oui, on va faire la diff
            {
                foreach (EDF.Signal signal1 in edfFile.Signals)
                {
                    foreach (EDF.Signal signal2 in edfFile.Signals)
                    {
                        if (signal1 != null && signal1.Label.Value.Replace(" ", "").ToLower() == labelSignal1.ToLower()
                        && signal2 != null && signal2.Label.Value.Replace(" ", "").ToLower() == labelSignal2.ToLower())//Pour ne pas avoir les espaces dans les labels
                        {
                            double durationMS = edfFile.Header.RecordDurationInSeconds.Value * 1000 / signal1.SampleCountPerRecord.Value;
                            var samples1 = signal1.Samples;
                            var samples2 = signal2.Samples;
                            var csv = new StringBuilder();
                            csv.Append("Time,Signal\n");
                            var length = 1;

                            if (samples1.Count >= samples2.Count)//On check si les tailles sont les mêmes et on prend la plus faible
                                length = samples2.Count;
                            else
                                length = samples1.Count;


                            //for (int i = 0; i < length; i++)
                            //for (int i = 0; i < Parametres.NbSample; i++)
                            for (int i = 0; i < length; i++)
                                csv.Append((i * durationMS).ToString() + "," + (samples1[i] - samples2[i]).ToString() + "\n");
                            csv.Append("\n");
                            File.WriteAllText(Parametres.pathCSV + labelSignal1 + "-" + labelSignal2 + ".csv", csv.ToString());
                        }
                    }
                }
            }
            else if (labelSignal1 != null)
            {
                foreach (EDF.Signal signal in edfFile.Signals)
                {
                    if (signal != null && signal.Label.Value.Replace(" ", "").ToLower() == labelSignal1.ToLower())//Pour ne pas avoir les espaces dans les labels
                    {
                        double durationMS = edfFile.Header.RecordDurationInSeconds.Value * 1000 / signal.SampleCountPerRecord.Value;
                        var samples = signal.Samples;
                        var csv = new StringBuilder();
                        csv.Append("Time,Signal\n");

                        //if (samples.Count > Parametres.NbSample)//Pour le heartRate qui est limité à 110000 samples
                        //{
                        //    for (int i = 0; i < Parametres.NbSample; i++)
                        //        csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        //}
                        //else
                        //{
                        for (int i = 0; i < 3800000; i++)
                            csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        //}
                        csv.Append("\n");
                        File.WriteAllText(Parametres.pathCSV + labelSignal1 + ".csv", csv.ToString());
                    }
                }
            }
        }
        #endregion

        #region Button
        protected void btn_CaptEcran_Click(object sender, EventArgs e)
        {

            Bitmap bmp = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.CopyFromScreen(0, 0, 0, 0, Screen.PrimaryScreen.Bounds.Size);
                String nameDate = DateTime.Now.Ticks.ToString();
                bmp.Save("C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\Server\\screen\\" + nameDate + "+.png");  // saves the image
            }

            traceGraph();
        }


        protected void btn_VoirCapt_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\Server\\screen");
            traceGraph();
        }

        protected void btnNeuro_Click(object sender, EventArgs e)
        {
            SetRepeater(1);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Neuro()", true);
            btnNeuro.BackColor = Color.White;
            btnNeuro.ForeColor = ColorTranslator.FromHtml("#00456f");
            btnSono.BackColor = ColorTranslator.FromHtml("#00456f");
            btnSono.ForeColor = Color.White;
            InitDDLNeuro();
        }

        protected void btnSono_Click(object sender, EventArgs e)
        {
            SetRepeater(2);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Sono()", true);
            btnNeuro.BackColor = ColorTranslator.FromHtml("#00456f");
            btnNeuro.ForeColor = Color.White;
            btnSono.BackColor = Color.White;
            btnSono.ForeColor = ColorTranslator.FromHtml("#00456f");
            InitDDLRespi();
        }

        protected void rptNeuro_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            foreach (RepeaterItem item2 in rptNeuro.Items)
            {

                ImageButton linkbutton = (ImageButton)item2.FindControl("img_Paint");
                lbl_pedro.Text = rptNeuro.Items[e.Item.ItemIndex].ItemIndex.ToString();

            }

            if (btnNeuro.BackColor == Color.White)
            {
                SetRepeater(1);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Neuro()", true);
            }
            else
            {
                SetRepeater(2);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Sono()", true);
            }
        }

        protected void imgPedro_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script> window.open('" + "https://www.youtube.com/watch?v=FSKZ4IowkYU" + "','_blank'); </script>");
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            traceGraph();
        }

        protected void traceGraph()
        {
            if (btnNeuro.BackColor == Color.White)
            {
                SetRepeater(1);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Neuro()", true);
            }
            else
            {
                SetRepeater(2);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Sono()", true);
            }
        }

        protected void btnFilt_Click(object sender, EventArgs e)
        {
            String typeFiltre = DDLFiltre.SelectedValue;
            String graphName = DDLGraph2.SelectedValue;
            int frqCpr = int.Parse(txtboxFiltre.Text);
            String[] tab = hdnFiltre.Value.Split(';');

            filter(graphName, typeFiltre, frqCpr);

            switch (graphName)
            {
                case "E2-M1":
                    tab[1] = "EDF/Filt_"+typeFiltre+"_" + graphName + ".csv"; 
                   break;
                case "E1-M1":
                    tab[2] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "C3-M2":
                    tab[3] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "F3-M2":
                    tab[4] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "O1-M2":
                    tab[5] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "1-F":
                    tab[6] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "1-2":
                    tab[7] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "ECG":
                    tab[8] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "HeartRate":
                    tab[9] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "AudioVolumeDB":
                    tab[10] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "Snoring":
                    tab[0] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    tab[11] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "AirFlow":
                    tab[12] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "RIPFlow":
                    tab[13] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "spO2B-B":
                    tab[14] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "InductanceThora":
                    tab[15] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "InductanceAbdom":
                    tab[16] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "K":
                    tab[17] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
            }
            hdnFiltre.Value = tab[0];
            for(int i = 1; i < 18; i++) { hdnFiltre.Value += ";"+tab[i]; }
            traceGraph();
        }

        protected void filter(String file,String filter,int fc)
        {
            String pathFile = "C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\EDF\\" + file + ".csv";
            // Définition des variables
            var points = new List<string>();
            var columnX = new List<int>();
            var columnY = new List<int>();
            //Lecture du CSV
            var rd = new StreamReader(pathFile);
            while (!rd.EndOfStream)
            {
                var splits = rd.ReadLine().Split('\n');
                points.Add(splits[0]);

            }
            foreach (var element in points)
            {
                if (!string.IsNullOrEmpty(element))
                {
                    var val = element.Split(',');

                    if (element != points[0])
                    {
                        columnX.Add(int.Parse(val[0]));
                        columnY.Add(int.Parse(val[1]));
                    }
                }
            }
            // Filtrage
            var dt = columnX[1] - columnX[0];
            var filteredPoints = new List<int>();
            switch (filter)
            {
                default:
                    break;
                case "Low":
                    filteredPoints = LowPass(columnY, dt, fc);
                    break;
                case "High":
                    filteredPoints = HighPass(columnY, dt, fc);
                    break;
            }
            // Enregistrement dans un nouveau CSV
            var csv = new StringBuilder();
            csv.Append("Time,Signal\n");
            for (int i = 0; i < filteredPoints.Count(); i++)
                csv.Append(columnX[i].ToString() + "," + filteredPoints[i].ToString() + "\n");
            csv.Append("\n");
            File.WriteAllText("C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\EDF\\" + "Filt_" +filter+"_"+file+".csv", csv.ToString());
            

        }

        protected List<int> LowPass(List<int> x, int dt , int fc)
        {
            var y = new List<int>();
            var a = dt / ((1 / (2 * Math.PI * fc)) + dt);
            y.Add((int)(a * x[0]));
            for(int i=1;i<x.Count();i++)
            {
                y.Add((int)(a * x[i] + (1 - a) * y[i - 1]));
            }
            return y;
        }

        protected List<int> HighPass(List<int> x,int dt , int fc)
        {
            var y = new List<int>();
            var a = (1 / (2 * Math.PI * fc)) / ((1 / (2 * Math.PI * fc)) + dt);
            y.Add(x[0]);
            for (int i = 1; i < x.Count(); i++)
            {
                y.Add((int)(a * y[i - 1] + a * (x[i] - x[i - 1])));
            }
            return y;
        }

       

        #endregion
    }
}