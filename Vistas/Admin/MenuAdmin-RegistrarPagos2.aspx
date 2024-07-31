<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-RegistrarPagos2.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_RegistrarPagos2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de socios</title>
    <link rel="stylesheet" href="../style.css" />
    <link rel="icon" href="/icono.ico" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                <div class="registrar-socio">
                    <h1>Registro de Pago</h1>
                    <div class="seccion">
                            <div class="datos">
                                <div class="datos-responsable">
                                    <h2>Datos del pago</h2>
                                    <table class="tabla-socio">
                                        <tr>
                                            <td><asp:Label ID="lblIdSocio" runat="server" Text="Id del socio" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtIdSocio" runat="server" CssClass="txt-general"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtIdSocio" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIdSocio" ErrorMessage="Id no válido" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblMonto" runat="server" Text="Monto:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtMonto" runat="server" CssClass="txt-general"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMonto" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMonto" ErrorMessage="Monto no válido" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="grupo1"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblFechaNac" runat="server" Text="Fecha de pago" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtDia" runat="server" CssClass="txt-general" Width="40px"></asp:TextBox>
                                                <asp:DropDownList ID="ddlMes" runat="server" CssClass="txt-general" Width="145px">
                                                    <asp:ListItem Value="">-- Seleccionar --</asp:ListItem>
                                                    <asp:ListItem Value="1">Enero</asp:ListItem>
                                                    <asp:ListItem Value="2">Febrero</asp:ListItem>
                                                    <asp:ListItem Value="3">Marzo</asp:ListItem>
                                                    <asp:ListItem Value="4">Abril</asp:ListItem>
                                                    <asp:ListItem Value="5">Mayo</asp:ListItem>
                                                    <asp:ListItem Value="6">Junio</asp:ListItem>
                                                    <asp:ListItem Value="7">Julio</asp:ListItem>
                                                    <asp:ListItem Value="8">Agosto</asp:ListItem>
                                                    <asp:ListItem Value="9">Septiembre</asp:ListItem>
                                                    <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                    <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                    <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:TextBox ID="txtAnio" runat="server" CssClass="txt-general" Width="40px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFechaNacDia" runat="server" ControlToValidate="txtDia" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfvFechaNacMes" runat="server" ControlToValidate="ddlMes" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfvFechaNacAnio" runat="server" ControlToValidate="txtAnio" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDia" ErrorMessage="Día no válido" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAnio" ErrorMessage="Año no válido" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="botones-varios">
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Cssclass="boton-general" OnClick="btnGuardar_Click" ValidationGroup="grupo1" />
                                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Cssclass="boton-general" OnClick="btnCancelar_Click" />
                                    <asp:Button ID="btnBorrar" runat="server" Text="Borrar Todo" Cssclass="boton-general" OnClick="btnBorrar_Click" ValidationGroup="grupo2"/>
                                </div>
                                <div>
                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" ></asp:Label>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>