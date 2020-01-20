using System;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibEDF_DotNet;

namespace Epnos_application
{
    public partial class Analyse : System.Web.UI.Page
    {
        private readonly string PATH_CSV = "C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Epnos_application\\EDF\\";

        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        private void ReadSignal(string labelSignal1, string labelSignal2 = null)
        {
            try
            {
                string pathName = "C:\\Users\\Alexis_portable\\Downloads\\VUHA_PSG_EDF.edf";
                var edfFile = new EDFFile(pathName);

                if (labelSignal1 != null && labelSignal2 != null)//On regarde si y'a 2 label en para. Si oui, on va faire la diff
                {
                    foreach (EDFSignal signal1 in edfFile.Signals)
                    {
                        foreach (EDFSignal signal2 in edfFile.Signals)
                        {
                            if (signal1 != null && signal1.Label.Value.Replace(" ", "").ToLower() == labelSignal1.ToLower()
                            && signal2 != null && signal2.Label.Value.Replace(" ", "").ToLower() == labelSignal2.ToLower())//Pour ne pas avoir les espaces dans les labels
                            {
                                var duration = edfFile.Header.DurationOfDataRecord.Value;
                                var samples1 = signal1.Samples;
                                var samples2 = signal2.Samples;
                                var csv = new StringBuilder();
                                csv.Append("Time,Signal\n");
                                var length = 1;

                                if (samples1.Length >= samples2.Length)//On check si les tailles sont les mêmes et on prend la plus faible
                                    length = samples2.Length;
                                else
                                    length = samples1.Length;


                                for (int i = 0; i < length; i++)
                                    csv.Append((i * duration).ToString() + "," + (samples1[i] - samples2[i]).ToString() + "\n");

                                csv.Append("\n");
                                File.WriteAllText(PATH_CSV + labelSignal1 + "-" + labelSignal2 + ".csv", csv.ToString());
                            }
                        }
                    }
                }
                else if (labelSignal1 != null)
                {
                    foreach (EDFSignal signal in edfFile.Signals)
                    {
                        if (signal != null && signal.Label.Value.Replace(" ", "").ToLower() == labelSignal1.ToLower())//Pour ne pas avoir les espaces dans les labels
                        {
                            var duration = edfFile.Header.DurationOfDataRecord.Value;
                            var samples = signal.Samples;
                            var csv = new StringBuilder();
                            csv.Append("Time,Signal\n");

                            for (int i = 0; i < samples.Length; i++)
                                csv.Append((i * duration).ToString() + "," + samples[i].ToString() + "\n");

                            csv.Append("\n");
                            File.WriteAllText(PATH_CSV + labelSignal1 + ".csv", csv.ToString());
                        }
                    }
                }

            }
            catch (Exception e) { }
        }
    }
}