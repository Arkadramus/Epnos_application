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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void ReadEdf(int ind)
        {
            try
            {
                string pathName = "C:\\Users\\Alexis_portable\\Downloads\\VUHA_PSG_EDF.edf";
                var edfFile = new EDFFile(pathName);
                var edfHeader = edfFile.Header;
                var listEdfSignal = edfFile.Signals;
                if (listEdfSignal[ind] != null)
                {
                    //File.Create("/test_generator.csv");
                    var duration = edfHeader.DurationOfDataRecord.Value;
                    var samples = listEdfSignal[ind].Samples;
                    var csv = new StringBuilder();
                    csv.Append("Time,Signal\n");
                    var i = 0;
                    foreach (short sample in samples)
                    {
                        csv.Append(i.ToString() + "," + sample.ToString()+"\n");
                        i += duration;
                    }
                    csv.Append("\n");
                    File.WriteAllText("C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Epnos_application\\EDF\\Test_edf.csv", csv.ToString());
                }

            }
            catch (Exception e) { }
        }

        protected void Unnamed_Click(object sender, CommandEventArgs e)
        {
            ReadEdf(int.Parse((string)e.CommandArgument));
        }
    }
}