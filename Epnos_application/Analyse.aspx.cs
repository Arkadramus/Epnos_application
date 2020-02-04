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
                //InitSignal();
                if (Parametres.Pedro)
                {
                    imgPedro.Visible = true;
                    lbl_pedro.Visible = true;
                }
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

        private void SetRepeater(int index = 1)
        {
            var valueNeuro = new ArrayList();
            switch (index)
            {
                default:
                case 1:
                    valueNeuro.Add(new PositionData("Snoring"));
                    valueNeuro.Add(new PositionData("E2-M1"));
                    valueNeuro.Add(new PositionData("E1-M1"));
                    valueNeuro.Add(new PositionData("C3-M2"));
                    valueNeuro.Add(new PositionData("F3-M2"));
                    valueNeuro.Add(new PositionData("O1-M2"));
                    valueNeuro.Add(new PositionData("1-F"));
                    valueNeuro.Add(new PositionData("1-2"));
                    valueNeuro.Add(new PositionData("ECG"));
                    valueNeuro.Add(new PositionData("HeartRate"));

                    rptNeuro.DataSource = valueNeuro;
                    rptNeuro.DataBind();
                    break;

                case 2:
                    valueNeuro.Add(new PositionData("AudioVolumeDB"));
                    valueNeuro.Add(new PositionData("Snoring"));
                    valueNeuro.Add(new PositionData("AirFlow"));
                    valueNeuro.Add(new PositionData("RIPFlow"));
                    valueNeuro.Add(new PositionData("spO2B-B"));
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
                            for (int i = 0; i < Parametres.NbSample; i++)
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

                        if (samples.Count > Parametres.NbSample)//Pour le heartRate qui est limité à 110000 samples
                        {
                            for (int i = 0; i < Parametres.NbSample; i++)
                                csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        }
                        else
                        {
                            for (int i = 0; i < samples.Count; i++)
                                csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        }
                        csv.Append("\n");
                        File.WriteAllText(Parametres.pathCSV + labelSignal1 + ".csv", csv.ToString());
                    }
                }
            }
        }

        protected void btn_CaptEcran_Click(object sender, EventArgs e)
        {

            Bitmap bmp = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.CopyFromScreen(0, 0, 0, 0, Screen.PrimaryScreen.Bounds.Size);
                String nameDate = DateTime.Now.Ticks.ToString();
                bmp.Save("C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\Server\\screen\\" + nameDate + "+.png");  // saves the image
            }
        }

        protected void btn_VoirCapt_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Epnos_application\\Epnos_application\\Server\\screen");
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
            btnNeuro.BackColor = ColorTranslator.FromHtml("#00456f");
            btnNeuro.ForeColor = Color.White;
            btnSono.BackColor = Color.White;
            btnSono.ForeColor = ColorTranslator.FromHtml("#00456f");
            InitDDLRespi();
            SetRepeater(2);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Sono()", true);
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

        protected void DDLGraph_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void DDLColor_SelectedIndexChanged(object sender, EventArgs e)
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
    }
}