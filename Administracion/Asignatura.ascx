<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Asignatura.ascx.cs" Inherits="Administracion.Asignatura" %>
<style type="text/css">
    .auto-style1 {
        width: 172px;
        position: relative;
        z-index: auto;
        left: -1px;
        top: -2px;
        height: 159px;
    }

    .auto-style3 {
        height: 50px;
    }

    .auto-style7 {
        height: 10px;
    }

    .auto-style14 {
        height: 10px;
        width: 8px;
    }
    .auto-style16 {
        height: 10px;
        width: 71px;
    }
</style>

<table class="auto-style1" style="background-color: blanchedalmond">
    <tr>
        <td class="auto-style14" style="border: thin outset #000000;">cd</td>
        <td class="auto-style14" style="border: thin outset #000000;">cp</td>
        <td class="auto-style14" style="border: thin outset #000000;">aa</td>
        <td class="auto-style16" style="border: thin outset #000000">
            <asp:Label ID="lblHorasSem" runat="server">Horas</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style14" style="border: thin outset #000000;">
            <asp:Label ID="lblcd" runat="server">cd</asp:Label>
        </td>
        <td class="auto-style14" style="border: thin outset #000000;">
            <asp:Label ID="lblcp" runat="server">cp</asp:Label>
        </td>
        <td class="auto-style14" style="border: thin outset #000000;">
            <asp:Label ID="lblaa" runat="server">aa</asp:Label>
        </td>
        <td class="auto-style16" style="border: thin outset #000000">
            <asp:Label ID="lblHorasSema" runat="server">HorasSema</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style3" colspan="4" style="border: thin outset #000000">
            <asp:Button ID="btnNombre" runat="server" Height="62px" Text="Nombre" Width="178px" OnClick="btnNombre_Click"/>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="border: thin outset #000000" class="auto-style7" >
            <asp:Label ID="lblCampo" runat="server" Height="19px" Width="45px" ForeColor="White" BorderStyle="None">Campo</asp:Label>
        </td>
        <td colspan="2" style="border: thin outset #000000" class="auto-style7">
            <asp:Label ID="lblCodigo" runat="server">Codigo</asp:Label>
        </td>
    </tr>
</table>
