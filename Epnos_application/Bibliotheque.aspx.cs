using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Collections;

using EDF = SharpLib.EuropeanDataFormat;

namespace Epnos_application
{
 
    public partial class Bibliotèque : System.Web.UI.Page
    {
        /// <summary>
        /// Lancement de la page
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int i = 0;
                while (i < Parametres.BoucleLoad) //On tente l'ouverture plusieurs fois jusqu'à ce qu'il n'y ait plus de OOM
                {
                    try
                    {
                        
                        Fill_Table();
            i = Parametres.BoucleLoad;
                    }
                    catch (Exception ex)
                    {
                        i++;
                        if (i >= Parametres.BoucleLoad)
                            Response.Redirect("https://www.youtube.com/watch?v=4N3N1MlvVc4");
                    }
                }
                
            }

        }

        /// <summary>
        /// Récupération des différents fichiers et affichage de leurs informations dans un tableau
        /// </summary>
        protected void Fill_Table()
        {
            
                ArrayList values = new ArrayList();

                List<string> dirs = new List<string>(Directory.EnumerateFiles("C:\\Users\\Maurine\\Documents\\Cours_Polytech\\5A\\PFE_EPNOS\\Edf"));
                hiddenField_paths.Value = "";
                foreach (var file in dirs)
                {
                    hiddenField_paths.Value = hiddenField_paths.Value + " "+ file ;
                    var edfFile = new EDF.File(file);
                    var edfHeader = edfFile.Header;
                    var idPatient = edfHeader.PatientID;
                    var dateRecord = edfHeader.RecordingStartDate;
                    var timeRecord = edfHeader.RecordingStartTime;
                    var durationRecord = edfHeader.RecordDurationInSeconds;
                    var numberOfDataRecord = edfHeader.RecordCount;

                    values.Add(new PositionData(idPatient.Value, dateRecord.Value + " | " + timeRecord.Value, (durationRecord.Value * numberOfDataRecord.Value / 3600).ToString(), "", "", ""));


                    Repeater1.DataSource = values;
                    Repeater1.DataBind();
                }

            
        }

        /// <summary>
        /// Coloration de la ligne sélectionnée dans le tableau des fichiers et récupération de son indice
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
         
            int ind = 0;
            foreach (RepeaterItem item2 in Repeater1.Items)
            {
                HtmlTableRow tr = (HtmlTableRow)item2.FindControl("trID");
                LinkButton linkbutton = (LinkButton)item2.FindControl("LinkButton1");
                if (ind == Repeater1.Items[e.Item.ItemIndex].ItemIndex)
                {
                    
                    tr.Attributes.Add("style", "background-color:grey; color:white;");
                    linkbutton.ForeColor = System.Drawing.Color.White;
                    hiddenField_ind.Value = Repeater1.Items[e.Item.ItemIndex].ItemIndex.ToString();
                }
                else
                {
                    tr.Attributes.Add("style", "background-color:White;");
                    linkbutton.ForeColor = System.Drawing.Color.Black;
                    
                }
                ind++;
                
            }
        }

        /// <summary>
        /// Affichage du tableau des fichiers lors d'un clic
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void linkbtn_Biblio_Click(object sender, EventArgs e)
        {
            Repeater1.Visible = true;
        }

        /// <summary>
        /// Passage du path du fichier selectionné dans la seconde page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Ouvrir_Click(object sender, EventArgs e)
        {
            string url;
            String paths = hiddenField_paths.Value;
            String[] listPaths = paths.Split(' ');
            url = "~/Analyse.aspx?path=" + listPaths[Int16.Parse(hiddenField_ind.Value) + 1];
            Response.Redirect(url);
        }

        /// <summary>
        /// Gestion des recherches de fichiers dans le dossier affiché
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Recherche_Click(object sender, ImageClickEventArgs e)
        {
            int i = 0;
            while (i < Parametres.BoucleLoad) //On tente l'ouverture plusieurs fois jusqu'à ce qu'il n'y ait plus de OOM
            {
                try
                {
                    i = Parametres.BoucleLoad;
                    Fill_Table();
                }
                catch (Exception ex)
                {
                    i++;
                    if (i >= Parametres.BoucleLoad)
                        Response.Redirect("https://www.youtube.com/watch?v=4N3N1MlvVc4");
                }
            }


            String searchText = input_Search.Value;
            ArrayList values = new ArrayList();
            List<string> dirs = new List<string>();

            String paths = hiddenField_paths.Value;
            String[] listPaths = paths.Split(' ');
            int ind = 0;

            foreach (RepeaterItem item2 in Repeater1.Items)
            {         
                LinkButton linkbutton = (LinkButton)item2.FindControl("LinkButton1");
               
                if (linkbutton.Text.ToLower().Contains(searchText.ToLower()))
                {                   
                    dirs.Add(listPaths[ind+1]);                   
                }
                ind++;              
            }

            hiddenField_paths.Value = "";
            foreach (var file in dirs)
            {
                hiddenField_paths.Value = hiddenField_paths.Value + " " + file;
                var edfFile = new EDF.File(file);
                var edfHeader = edfFile.Header;
                var idPatient = edfHeader.PatientID;
                var dateRecord = edfHeader.RecordingStartDate;
                var timeRecord = edfHeader.RecordingStartTime;
                var durationRecord = edfHeader.RecordDurationInSeconds;
                var numberOfDataRecord = edfHeader.RecordCount;

                values.Add(new PositionData(idPatient.Value, dateRecord.Value + " | " + timeRecord.Value, (durationRecord.Value * numberOfDataRecord.Value / 3600).ToString(), "", "", ""));


                Repeater1.DataSource = values;
                Repeater1.DataBind();
            }

        }

        
    }

    /// <summary>
    /// Class permettant la gestion du repeater affichant les informations des fichiers 
    /// </summary>
    public class PositionData
    {

        private string id_Patient;
        private string date_Enregistrement;
        private string duree_Enregistrement;
        private string etats_Fichier;
        private string medias_Fichier;
        private string tags_Fichier;

        public PositionData(string id_Patient, string date_Enregistrement, string duree_Enregistrement, string etats_Fichier, string medias_Fichier, string tags_Fichier)
        {
            this.id_Patient = id_Patient;
            this.date_Enregistrement = date_Enregistrement;
            this.duree_Enregistrement = duree_Enregistrement;
            this.etats_Fichier = etats_Fichier;
            this.medias_Fichier = medias_Fichier;
            this.tags_Fichier = tags_Fichier;
        }

        public string Id_Patient
        {
            get
            {
                return id_Patient;
            }
        }

        public string Date_Enregistrement
        {
            get
            {
                return date_Enregistrement;
            }
        }

        public string Duree_Enregistrement
        {
            get
            {
                return duree_Enregistrement;
            }
        }

        public string Etats_Fichier
        {
            get
            {
                return etats_Fichier;
            }
        }

        public string Medias_Fichier
        {
            get
            {
                return medias_Fichier;
            }
        }

        public string Tags_Fichier
        {
            get
            {
                return tags_Fichier;
            }
        }
    }

    
}