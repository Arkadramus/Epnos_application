using System;
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
            ReadEdf();
        }

        private void ReadEdf()
        {
            try
            {
                string pathName = "C:\\Users\\Alexis_portable\\Documents\\Projet S10\\Epnos_application\\Epnos_application\\EDF\\test_generator.edf";
                var edfFile = new EDFFile(pathName);
                var edfHeader = edfFile.Header;
                var listEdfSignal = edfFile.Signals;
            }
            catch(Exception e){ }
        }
    }
}