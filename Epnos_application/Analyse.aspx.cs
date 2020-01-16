using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void ReadEdf()
        {
            try
            {
                string pathName = "C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Epnos_application\\EDF\\VUHA_PSG_EDF.edf";
                var edfFile = new EDFFile(pathName);
                var edfHeader = edfFile.Header;
                var listEdfSignal = edfFile.Signals;
                if (listEdfSignal[1] != null)
                {
                    //File.Create("/test_generator.csv");
                    var duration = edfHeader.DurationOfDataRecord.Value;
                    var samples = listEdfSignal[1].Samples;
                    string res = "Time,Signal\n";
                    var i = 0;
                    foreach (short sample in samples)
                    {
                        res += i.ToString() + "," + sample.ToString() + "\n";
                        i += duration;
                    }
                    File.WriteAllText("C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Test_edf.csv", res);
                }

            }
            catch (Exception e) { }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            ReadEdf();
        }
    }
}