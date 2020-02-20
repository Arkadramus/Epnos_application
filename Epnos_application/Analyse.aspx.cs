using System;
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
                hdnFiltre.Value = "EDF/E1-M1.csv;EDF/E2-M1.csv;EDF/Group1.csv;EDF/Group2.csv;EDF/ECG.csv;EDF/HeartRate.csv;EDF/AudioVolumeDB.csv;EDF/Snoring.csv;EDF/AirFlow.csv;EDF/RIPFlow.csv;EDF/spO2B-B.csv;EDF/InductanceThora.csv;EDF/InductanceAbdom.csv";
            }
        }

        private void InitDDLNeuro()
        {
            DDLGraphNameColor.Items.Clear();
            DDLGraphNameColor.Items.Add("E1-M1");
            DDLGraphNameColor.Items.Add("E2-M1");
            DDLGraphNameColor.Items.Add("F4-M1");
            DDLGraphNameColor.Items.Add("F3-M2");
            DDLGraphNameColor.Items.Add("C4-M1");
            DDLGraphNameColor.Items.Add("C3-M2");
            DDLGraphNameColor.Items.Add("O2-M1");
            DDLGraphNameColor.Items.Add("O1-M2");
            DDLGraphNameColor.Items.Add("1-2");
            DDLGraphNameColor.Items.Add("1-F");
            DDLGraphNameColor.Items.Add("ECG");
            DDLGraphNameColor.Items.Add("HeartRate");
            DDLGraphNameColor.DataBind();
            DDLGraphNameFilter.Items.Clear();
            DDLGraphNameFilter.Items.Add("E1-M1");
            DDLGraphNameFilter.Items.Add("E2-M1");
            DDLGraphNameFilter.Items.Add("F4-M1");
            DDLGraphNameFilter.Items.Add("F3-M2");
            DDLGraphNameFilter.Items.Add("C4-M1");
            DDLGraphNameFilter.Items.Add("C3-M2");
            DDLGraphNameFilter.Items.Add("O2-M1");
            DDLGraphNameFilter.Items.Add("O1-M2");
            DDLGraphNameFilter.Items.Add("1-2");
            DDLGraphNameFilter.Items.Add("1-F");
            DDLGraphNameFilter.Items.Add("ECG");
            DDLGraphNameFilter.Items.Add("HeartRate");
            DDLGraphNameFilter.DataBind();
        }

        private void InitDDLRespi()
        {
            DDLGraphNameColor.Items.Clear();
            DDLGraphNameColor.Items.Add("AudioVolumeDB");
            DDLGraphNameColor.Items.Add("Snoring");
            DDLGraphNameColor.Items.Add("AirFlow");
            DDLGraphNameColor.Items.Add("RIPFlow");
            DDLGraphNameColor.Items.Add("spO2B-B");
            DDLGraphNameColor.Items.Add("InductanceThora");
            DDLGraphNameColor.Items.Add("InductanceAbdom");
            DDLGraphNameColor.DataBind();
            DDLGraphNameFilter.Items.Clear();
            DDLGraphNameFilter.Items.Add("AudioVolumeDB");
            DDLGraphNameFilter.Items.Add("Snoring");
            DDLGraphNameFilter.Items.Add("AirFlow");
            DDLGraphNameFilter.Items.Add("RIPFlow");
            DDLGraphNameFilter.Items.Add("spO2B-B");
            DDLGraphNameFilter.Items.Add("InductanceThora");
            DDLGraphNameFilter.Items.Add("InductanceAbdom");
            DDLGraphNameFilter.DataBind();
        }

        private void InitSignal()
        {
            String[] Group1 = { "F4-M1", "F3-M2", "C4-M1", "C3-M2", "O2-M1", "O1-M2" };
            GroupSignals(Group1, "Group1");

            String[] Group2 = { "1-2", "1-F" };
            GroupSignals(Group2, "Group2");

            int i = 0;
            while (i < Parametres.BoucleLoad) //On tente l'ouverture plusieurs fois jusqu'à ce qu'il n'y ait plus de OOM
            {
                try
                {
                    //edfFile = new EDF.File(Parametres.pathEDF);
                    i = Parametres.BoucleLoad;
                    //ReadSignal("E2-M1");
                    //ReadSignal("E1", "M1");
                    //ReadSignal("F4-M1");
                    //ReadSignal("F3-M2");
                    //ReadSignal("C4-M1");
                    //ReadSignal("C3-M2");
                    //ReadSignal("O2-M1");
                    //ReadSignal("O1-M2");
                    //ReadSignal("1-2");
                    //ReadSignal("1-F");
                    //ReadSignal("ECG");
                    //ReadSignal("HeartRate");

                    //ReadSignal("AudioVolumeDB");
                    //ReadSignal("Snoring");
                    //ReadSignal("AirFlow");
                    //ReadSignal("RIPFlow");
                    //ReadSignal("spO2B-B");
                    //ReadSignal("InductanceThora");
                    //ReadSignal("InductanceAbdom");
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
                    valueNeuro.Add(new PositionData("E1-M1", "E1M1"));
                    valueNeuro.Add(new PositionData("E2-M1", "E2M1"));
                    valueNeuro.Add(new PositionData("F4-M1 F3-M2 \r\n C4-M1 \r\n C3-M2 \r\n O2-M1 \r\n O1-M2", "Group1"));//On ne met pas de "-" pour les div car sinon le JS n'aime pas                
                    valueNeuro.Add(new PositionData("1-2 1-F", "Group2"));             
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
        
        protected void GroupSignals(String[] labelSignals, String groupName)
        {
            bool condX = true;
            var ListData = new List<List<int>>();
            foreach(var nameSignal in labelSignals)
            {
                var points = new List<string>();
                var columnX = new List<int>();
                var columnY = new List<int>();
                var rd = new StreamReader(Parametres.pathCSV+nameSignal +".csv");              
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
                if(condX)
                {
                    ListData.Add(columnX);
                    condX = false;
                }
                ListData.Add(columnY);
            }

            var csv = new StringBuilder();
            String entete = "Time";
            for(int i = 0;i<ListData.Count()-1;i++)
            {
                entete += ",Signal" + (i + 1).ToString();
            }
            entete += '\n';
            csv.Append(entete);

          
            for (int i = 0; i < ListData[0].Count(); i++)
            {
                int offset = 0;
                String ligne = "";
                bool condFirst = true;
                for (int j = 0; j< ListData.Count(); j++)
                {
                    if(condFirst)
                    {
                        ligne += (ListData[j][i]+offset).ToString();
                        condFirst = false;
                    }
                    else
                    {
                        ligne += "," + (ListData[j][i] + offset).ToString();
                    }
                    offset += 100000;
                }
                ligne += "\n";    
                csv.Append(ligne);               
               
            }
            File.WriteAllText(Parametres.pathCSV  + groupName + ".csv", csv.ToString());
           


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
            String graphName = DDLGraphNameFilter.SelectedValue;
            int frqCpr = int.Parse(txtboxFiltre.Text);
            String[] tab = hdnFiltre.Value.Split(';');

            filter(graphName, typeFiltre, frqCpr);

            switch (graphName)
            {
                case "E1-M1":
                    tab[1] = "EDF/Filt_"+typeFiltre+"_" + graphName + ".csv"; 
                   break;
                case "E2-M2":
                    tab[2] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "F4-M1":
                    tab[3] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "F3-M2":
                    tab[4] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "C4-M1":
                    tab[5] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "C3-M2":
                    tab[6] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "O2M1":
                    tab[7] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "O1M2":
                    tab[8] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "1-F":
                    tab[9] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "1-2":
                    tab[10] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "ECG":
                    tab[11] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "HeartRate":
                    tab[12] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "AudioVolumeDB":
                    tab[13] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "Snoring":
                    tab[14] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "AirFlow":
                    tab[15] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "RIPFlow":
                    tab[16] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "spO2B-B":
                    tab[17] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "InductanceThora":
                    tab[18] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
                case "InductanceAbdom":
                    tab[19] = "EDF/Filt_" + typeFiltre + "_" + graphName + ".csv";
                    break;
              
            }
            hdnFiltre.Value = tab[0];
            for(int i = 1; i < 20; i++) { hdnFiltre.Value += ";"+tab[i]; }
            traceGraph();
        }

        protected void filter(String file,String filter,int fc)
        {
            String pathFile = Parametres.pathCSV  + file + ".csv";
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
            File.WriteAllText(Parametres.pathCSV  + "Filt_" +filter+"_"+file+".csv", csv.ToString());
            

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