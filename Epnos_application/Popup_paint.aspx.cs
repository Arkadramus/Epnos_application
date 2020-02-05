using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epnos_application
{
    public partial class Popup_paint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnColorRouge_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Rouge";
          
        }

        protected void btnColorOrange_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Orange";
            
        }

        protected void btnColorJaune_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Jaune";
            
        }

        protected void btnColorVert_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Vert";
            
        }

        protected void btnColorCyan_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Cyan";
        }

        protected void btnColorBleu_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Bleu";
            
        }

        protected void btnColorViolet_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Violet";
           
        }

        protected void btnColorRose_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Rose";
            
        }

        protected void btnColorMarron_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Marron";
           
        }

        protected void btnColorNoir_Click(object sender, EventArgs e)
        {
            hiddenField_Couleur.Value = "Noir";
            
        }
    }
}