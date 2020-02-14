using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;


namespace Epnos_application
{
    public class Parametres
    {
        private static string _PATH = Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.MyDocuments), "paramEPNOS.ini");

        [DllImport("kernel32", CharSet = CharSet.Unicode)]
        static extern int GetPrivateProfileString(string Section, string Key, string Default, StringBuilder RetVal, int Size, string FilePath);

        private static string Read(string Key, string Section = null)
        {
            var RetVal = new StringBuilder(255);
            GetPrivateProfileString(Section, Key, "", RetVal, 255, _PATH);
            return RetVal.ToString();
        }

        public static string pathCSV
        {
            get
            {
                return (Read("pathCSV", "Path"));
            }

        }

        public static string pathEDF
        {
            get
            {
                return (Read("pathEDF", "Path"));
            }

        }

        public static string Temps
        {
            get
            {
                return (Read("Temps", "Analyse"));
            }

        }

        public static bool Pedro
        {
            get
            {
                return Read("IsPedro", "Analyse") == "1" ? true : false;
            }
        }

        public static int NbSample
        {
            get
            {
                return int.Parse(Read("NbSample", "Analyse"));
            }
        }

        public static int BoucleLoad
        {
            get
            {
                return int.Parse(Read("boucleLoad", "EDF"));
            }
        }
    }
}