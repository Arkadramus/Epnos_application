<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bibliotheque.aspx.cs" Inherits="Epnos_application.Bibliotèque" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header class="Haut_page">
            <asp:Image runat="server" CssClass="Logo" src="img/navbar-logo.png" Style="margin-top: 5px" />
        </header>
        <section class="Fond_page">
            <div class="Liste_Biblio">
                <%--Division où il y aura la liste des dossiers et enregistrements.
                    Il y aura aussi un bouton ajouter un dossier--%>

                <br>
                    <asp:Label runat="server" Text="Bibliothèques" Font-Bold="true" Style="margin-top: 10%; margin-left: 5%; color: black; font-size: 30px; width: 100%"></asp:Label></br>
                <br>
                    <asp:Image runat="server" src="img/dossier.png" Style="height: 5%; width: 5%; margin-left: 10%" />
                    <asp:LinkButton runat="server" Text="Tous les enregistrements" ID="linkbtn_Biblio" OnClick="linkbtn_Biblio_Click" Style="margin-top: 10%; margin-left: 1%; color: black; font-size: 15px;" />

                </br>
            </div>
            <div class="Barre_Option">
                <%-- Division où il y a une barre de recherche pour chercher des enregistrements.
                    un bouton "Retrouver un rapport" pour charger un ancien rapport
                    un bouton "Ouvrir" pour ouvrir la page analyse d'un enregistrement. --%>
                <div class="wrap">
                    <div class="search">
                        <input type="text" id="input_Search" runat="server" class="searchTerm" placeholder="Recherche...">
                        <asp:ImageButton ID="btn_Recherche" runat="server" class="searchButton" ImageUrl="img/search.png" OnClick="btn_Recherche_Click"></asp:ImageButton>
                        <asp:Button class="btns" runat="server" Text="Retrouver un rapport" ID="btn_RetrouveRapport" Style="margin-left: 19%; width: 10%;" />
                        <asp:Button class="btns" runat="server" Text="Ouvrir" ID="btn_Ouvrir" Style="margin-left: 1%; width: 10%;" OnClick="btn_Ouvrir_Click" />
                    </div>
                </div>
            </div>
            <div class="Liste_Info">
                <%-- Division qui contient la liste des enregistrements d'un dossier + ses informations --%>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" Visible="false">
                    <HeaderTemplate>
                        <table border="0px solid " class="Tab_Info">
                            <tr>
                                <td><b>ID du patient</b></td>
                                <td><b>Date de l'enregistrement</b></td>
                                <td><b>Durée (en heure)</b></td>
                                <td><b>Etats</b></td>
                                <td><b>Médias</b></td>
                                <td><b>Tags</b></td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="trID" runat="server">
                            <td>
                                <asp:LinkButton ID="LinkButton1" Text='<%# DataBinder.Eval(Container.DataItem, "Id_Patient") %>' runat="server" ForeColor="Black" /></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Date_Enregistrement") %> </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Duree_Enregistrement") %> </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Etats_Fichier") %> </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Medias_Fichier") %> </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Tags_Fichier") %> </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                        </table>
                    </FooterTemplate>

                </asp:Repeater>
                <%-- hiddenField servant au stockage des paths afin de les transmettre à la deuxième page --%>
                <asp:HiddenField runat="server" Value="" ID="hiddenField_ind" />
                <asp:HiddenField runat="server" Value="" ID="hiddenField_paths" />
                <asp:Label ID="lbl_test" Text="" runat="server"></asp:Label>

               

            </div>
        </section>
    </form>
</body>
</html>
