<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Itinerario.ascx.cs" Inherits="Administracion.Itinerario" %>
<style type="text/css">

    .auto-style1 {
        width: 206px;
        position: relative;
        z-index: auto;
        left: 1px;
        top: 2px;
        height: 135px;
    }

    .auto-style14 {
        height: 10px;
        width: 8px;
    }
    .auto-style16 {
        height: 10px;
        width: 71px;
    }

    .auto-style3 {
        height: 50px;
    }

    .auto-style7 {
        height: 10px;
    }

    .auto-style17 {
        height: 50px;
        width: 37px;
    }
    .auto-style18 {
        height: 50px;
        width: 181px;
    }
</style>

<table class="auto-style1" style="background-color: blanchedalmond">
    <tr>
        <td class="auto-style14" style="border: thin outset #000000;">cd</td>
        <td class="auto-style14" style="border: thin outset #000000;" colspan="2">cp</td>
        <td class="auto-style7" style="border: thin outset #000000;" colspan="2">aa</td>
        <td class="auto-style16" style="border: thin outset #000000">
            <asp:Label ID="lblHorasSem" runat="server">Horas</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style14" style="border: thin outset #000000;">
            <asp:Label ID="lblcd" runat="server">cd</asp:Label>
        </td>
        <td class="auto-style14" style="border: thin outset #000000;" colspan="2">
            <asp:Label ID="lblcp" runat="server">cp</asp:Label>
        </td>
        <td class="auto-style7" style="border: thin outset #000000;" colspan="2">
            <asp:Label ID="lblaa" runat="server">aa</asp:Label>
        </td>
        <td class="auto-style16" style="border: thin outset #000000">
            <asp:Label ID="lblHorasSema" runat="server">HorasSema</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style17" colspan="2" style="border: thin outset #000000">
            <asp:Button ID="Button1" runat="server" Height="50px" Text="Itinerario1" Width="60px" />
        </td>
        <td class="auto-style18" colspan="2" style="border: thin outset #000000">
            <asp:Button ID="Button2" runat="server" Height="50px" Text="Itinerario2" Width="60px" />
        </td>
        <td class="auto-style3" colspan="2" style="border: thin outset #000000">
            <asp:Button ID="Button3" runat="server" Height="50px" Text="Itinerario3" Width="81px" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="border: thin outset #000000" class="auto-style7" >
            <asp:Label ID="lblCampo" runat="server" Height="19px" Width="45px" ForeColor="White" BorderStyle="None">Campo</asp:Label>
        </td>
        <td colspan="3" style="border: thin outset #000000" class="auto-style7">
            <asp:Label ID="lblCodigo" runat="server">Codigo</asp:Label>
        </td>
    </tr>
</table>






