<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup_paint.aspx.cs" Inherits="Epnos_application.Popup_paint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="Content/Site.css" />
    <title></title>
</head>
<body>
     <script type="text/javascript">      
         
      </script>

    <form id="form1" class="Popup_Paint" runat="server">
        <div>
            <br>
            <asp:Label runat="server" Text="Couleur du graphique"></asp:Label>
            </br>
            <br>
            <asp:Button id="btnColorRouge" OnClick="btnColorRouge_Click" class="Color_btn" runat="server" BackColor="#FF0000" style="margin-left:10px;"/>
            <asp:Button id="btnColorOrange" OnClick="btnColorOrange_Click" class="Color_btn" runat="server" BackColor="#FF8C00"/>
            <asp:Button id="btnColorJaune" OnClick="btnColorJaune_Click" class="Color_btn" runat="server" BackColor="#FFFF00"/>
            <asp:Button id="btnColorVert" OnClick="btnColorVert_Click" class="Color_btn" runat="server" BackColor="#7CFC00"/>
            <asp:Button id="btnColorCyan" OnClick="btnColorCyan_Click" class="Color_btn" runat="server" BackColor="#008B8B"/>
            </br>
            <br>
            <asp:Button id="btnColorBleu" OnClick="btnColorBleu_Click" class="Color_btn" runat="server" BackColor="#000080" style="margin-left:10px;"/>
            <asp:Button id="btnColorViolet" OnClick="btnColorViolet_Click" class="Color_btn" runat="server" BackColor="#800080"/>
            <asp:Button id="btnColorRose" OnClick="btnColorRose_Click" class="Color_btn" runat="server" BackColor="#FF1493"/>
            <asp:Button id="btnColorMarron" OnClick="btnColorMarron_Click" class="Color_btn" runat="server" BackColor="#8B4513"/>
            <asp:Button id="btnColorNoir" OnClick="btnColorNoir_Click" class="Color_btn" runat="server" BackColor="#000000"/>
            </br>
            <asp:HiddenField runat="server" Value="Noir" ID="hiddenField_Couleur" />
        </div>
    </form>
</body>
</html>
