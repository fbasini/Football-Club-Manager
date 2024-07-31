<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-InformesAdmin.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_InformesAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Generar Informe</title>
    <link rel="stylesheet" href="../style.css" />
    <link rel="icon" href="/icono.ico" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ////////////////////////////////////// - HEADER - ////////////////////////////////////// -->
        <div id="header">
            <nav class="info">
                <ul class="nav-user">
                    <li class="logo"><img src="../football-club-logo-vector.jpg" href="#" /></li>
                    <li>Usuario:</li>
                    <li>
                        <asp:Label ID="lblUsuario" runat="server" Text="Administrador"></asp:Label>
                    </li>
                </ul>
            </nav>
            <nav class="links">
                <ul class="nav-links">
                    <li><asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="boton-links" OnClick="btnVolver_Click"/></li>
                    <li><asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="boton" OnClick="btnCerrarSesion_Click"/></li>
                </ul>
            </nav>
        </div>

        <!-- ////////////////////////////////////// - BODY - ////////////////////////////////////// -->
        <div id="body">
            <div class="principal-box">
                <div class="fechas-informe">
                    <h1>Informe por Fecha</h1>
                    <table class="informacion-informe">
                        <tr style="text-align:center;">
                            <td></td>
                            <td>
                                <asp:Label ID="lblDia" runat="server" Text="dd "></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblMes" runat="server" Text="mm "></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAnio" runat="server" Text="aaaa "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFechaOrigen" runat="server" Text="Fecha Inicial:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaOrigenDia" runat="server" CssClass="txt-general fecha" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaOrigenMes" runat="server" CssClass="txt-general fecha" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaOrigenAño" runat="server" CssClass="txt-general fecha anio" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDiaInicial" runat="server" ControlToValidate="txtFechaOrigenDia" ErrorMessage="Se requiere el día de la fecha inicial" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvMesInicial" runat="server" ControlToValidate="txtFechaOrigenMes" ErrorMessage="Se requiere el mes de la fecha inicial" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvAñoInicial" runat="server" ControlToValidate="txtFechaOrigenAño" ErrorMessage="Se requiere el año de la fecha inicial" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revDiaInicial" runat="server" ErrorMessage="Se requiere un día inicial valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaOrigenDia" ValidationExpression="^(3[01]|[12][0-9]|[1-9])$">*</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revMesInicial" runat="server" ErrorMessage="Se requiere un mes inicial valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaOrigenMes" ValidationExpression="^(1[0-2]|[1-9])$">*</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revAñoInicial" runat="server" ErrorMessage="Se requiere un año inicial valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaOrigenAño" ValidationExpression="^[2000-2023]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFechaFinal" runat="server" Text="Fecha Final:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaFinalDia" runat="server" CssClass="txt-general fecha" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaFinalMes" runat="server" CssClass="txt-general fecha" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaFinalAño" runat="server" CssClass="txt-general fecha anio" ValidationGroup="vg1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDiaFinal" runat="server" ControlToValidate="txtFechaFinalDia" ErrorMessage="Se requiere el día de la fecha final" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvMesFinal" runat="server" ControlToValidate="txtFechaFinalMes" ErrorMessage="Se requiere el mes de la fecha final" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvAñoFinal" runat="server" ControlToValidate="txtFechaFinalAño" ErrorMessage="Se requiere el año de la fecha final" ForeColor="Red" ValidationGroup="vg1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revDiaFinal" runat="server" ErrorMessage="Se requiere un día final valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaFinalDia" ValidationExpression="^(3[01]|[12][0-9]|[1-9])$">*</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revMesFinal" runat="server" ErrorMessage="Se requiere un mes final valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaFinalMes" ValidationExpression="^(1[0-2]|[1-9])$">*</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revAñoFinal" runat="server" ErrorMessage="Se requiere un año final valido" ForeColor="Red" ValidationGroup="vg1" ControlToValidate="txtFechaFinalAño" ValidationExpression="^[2000-2023]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <div style="margin-top:20px">
                        <asp:Button ID="btnGenerarInforme" runat="server" Text="Generar Informe" CssClass="boton-general" OnClick="btnGenerarInforme_Click" ValidationGroup="vg1"></asp:Button>
                    </div>
                    <div>
                        <asp:ValidationSummary ID="vsInformes" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vg1" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
