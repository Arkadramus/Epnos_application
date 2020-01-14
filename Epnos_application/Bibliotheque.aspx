<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bibliotheque.aspx.cs" Inherits="Epnos_application.Bibliotèque" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
</head>
<body >
    <form id="form1" runat="server">
        <header class="Haut_page">
            <asp:Image runat="server" CssClass="Logo" src="img/navbar-logo.png" Style="margin-top:5px"/>
        </header>
        <section class="Fond_page">
            <div class="Liste_Biblio">
                <%--Division où il y aura la liste des dossiers et enregistrements.
                    Il y aura aussi un bouton ajouter un dossier--%>
            </div>
            <div class="Barre_Option">
                <%-- Division où il y aura une barre de recherche pour chercher des enregistrements.
                    Il y aura un bouton "Retrouver un rapport" pour charger un ancien rapport
                    Il y aura un bouton "Ouvrir" pour ouvrir la page analyse d'un enregistrement. --%>
               <div class="wrap">
                   <div class="search">
                      <input type="text" runat="server" class="searchTerm" placeholder="Recherche...">
                      <asp:Button ID="btn_Recherche" runat="server" class="searchButton">
                              
                     </asp:Button>
                        <asp:Button  class="btn" runat="server" Text="Retrouver un rapport" ID="btn_RetrouveRapport" Style="margin-left:19%; width:10%;  "/>
                        <asp:Button  class="btn" runat="server" Text="Ouvrir" ID="btn_Ouvrir" Style="margin-left:1%;  width:10%;"/>
                   </div>  
                </div>           
               </div>       
            <div class="Liste_Info">
                <%-- Division qui contiendra la liste des enregistrements d'un dossier + ses informations --%>
            </div>
        </section>
    </form>
</body>
</html>
