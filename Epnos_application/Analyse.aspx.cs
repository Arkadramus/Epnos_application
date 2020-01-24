using System;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.UI.HtmlControls;

using EDF = SharpLib.EuropeanDataFormat;



//using LibEDF_DotNet;

namespace Epnos_application
{
    public partial class Analyse : System.Web.UI.Page
    {
        private readonly string PATH_CSV = "C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Epnos_application\\EDF\\";
        private readonly int NB_SAMPLE = 10000;
        private EDF.File edfFile;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSignal();
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

        private void InitSignal()
        {
            try
            {
                string pathName = "C:\\Users\\Alexis_portable\\Downloads\\VUHA_PSG_EDF.edf";
                edfFile = new EDF.File(pathName);

                ReadSignal("Snoring");
                ReadSignal("E2-M1");
                ReadSignal("E1", "M1");
                ReadSignal("C3-M2");
                ReadSignal("F3-M2");
                ReadSignal("O1-M2");
                ReadSignal("1-F");
                ReadSignal("1-2");
                ReadSignal("ECG");
                ReadSignal("HeartRate");

                ReadSignal("AudioVolumeDB");
                ReadSignal("Snoring");
                ReadSignal("AirFlow");
                ReadSignal("RIPFlow");
                ReadSignal("spO2B-B");
                ReadSignal("InductanceThora");
                ReadSignal("InductanceAbdom");
                ReadSignal("K");
            }
            catch (Exception e) { }
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
                            for (int i = 0; i < NB_SAMPLE; i++)
                                csv.Append((i * durationMS).ToString() + "," + (samples1[i] - samples2[i]).ToString() + "\n");

                            csv.Append("\n");
                            File.WriteAllText(PATH_CSV + labelSignal1 + "-" + labelSignal2 + ".csv", csv.ToString());
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

                        if (samples.Count > NB_SAMPLE)//Pour le heartRate qui est limité à 110000 samples
                        {
                            for (int i = 0; i < NB_SAMPLE; i++)
                                csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        }
                        else
                        {
                            for (int i = 0; i < samples.Count; i++)
                                csv.Append((i * durationMS).ToString() + "," + samples[i].ToString() + "\n");
                        }
                        csv.Append("\n");
                        File.WriteAllText(PATH_CSV + labelSignal1 + ".csv", csv.ToString());
                    }
                }
            }
        }

        protected void btnNeuro_Click(object sender, EventArgs e)
        {
            SetRepeater(1);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Neuro()", true);
        }

        protected void btnSono_Click(object sender, EventArgs e)
        {
            SetRepeater(2);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Sono()", true);
        }
    }
}