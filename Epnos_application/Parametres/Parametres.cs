using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;


namespace Epnos_application
{
    public class Parametres
    {
        //Le fichier paramEPNOS.ini sera stocké dans "Mes documents". À changer à sa convenance
        private static string _PATH = Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.MyDocuments), "paramEPNOS.ini");

        [DllImport("kernel32", CharSet = CharSet.Unicode)]
        static extern int GetPrivateProfileString(string Section, string Key, string Default, StringBuilder RetVal, int Size, string FilePath);

        /// <summary>
        /// Methode pour lire les informations contenues dans le .ini
        /// </summary>
        /// <param name="Key">Nom du champ dans le .ini</param>
        /// <param name="Section">Nom de la section contenant le champ</param>
        /// <returns></returns>
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
        
        public static string pathFileEDF
        {
            get
            {
                return (Read("pathFileEDF", "Path"));
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
    }
}