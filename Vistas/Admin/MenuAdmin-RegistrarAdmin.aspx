<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-RegistrarAdmin.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_RegistrarAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Administrador | Futbol 2023</title>
    <link rel="stylesheet" href="../style.css" />
    <link rel="icon" href="/icono.ico" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style type="text/css">
        .auto-style1 {
            width: 165px;
        }
        .auto-style2 {
            width: 104px;
        }
        .auto-style3 {
            width: 312px;
        }
    </style>
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
                <div class="registrar-admin">
                    <h1>Registro de Administrador</h1>
                    <div class="seccion">
                        <div class ="datos">
                            <div class="datos-usuario">
                                <h2>Datos de Usuario</h2>
                                <table class="tabla-usuario">
                                    <tr>
                                        <td class="auto-style1"><asp:Label ID="lblUsuarioSocio" runat="server" Text="Usuario:" ></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtUsuario" runat="server" CssClass="txt-general" ></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="El nombre de usuario es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;<asp:CustomValidator ID="cvExisteNombreUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="El nombre de usuario ya está en uso." ForeColor="Red" OnServerValidate="cvExisteNombreUsuario_ServerValidate" ValidationGroup="grupo1">El nombre de usuario ya está en uso. </asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1"><asp:Label ID="lblContraseña" runat="server" Text="Contraseña:" ></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtContraseña" runat="server" CssClass="txt-general" TextMode="Password"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña" ErrorMessage="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1"><asp:Label ID="lblRepetirContraseña" runat="server" Text="Repetir contraseña:" ></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtRepetirContraseña" runat="server" CssClass="txt-general" TextMode="Password"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvRepetirContraseña" runat="server" ControlToValidate="txtRepetirContraseña" ErrorMessage="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;<asp:CompareValidator ID="cvRepetirContraseña" runat="server" ControlToCompare="txtContraseña" ControlToValidate="txtRepetirContraseña" ErrorMessage="Las contraseñas deben coincidir." ForeColor="Red" ValidationGroup="grupo1">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="datos-admin">
                                <h2>Datos del Administrador</h2>
                                <table class="tabla-admin">
                                    <tr>
                                        <td class="auto-style2"><asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtNombre" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2"><asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtApellido" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2"><asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtDNI" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="El DNI es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;<asp:CustomValidator ID="cvExisteDni" runat="server" ForeColor="Red" ControlToValidate="txtDNI" ErrorMessage="Ya existe un registro con el DNI ingresado." OnServerValidate="cvExisteDni_ServerValidate1" ValidationGroup="grupo1">Ya existe un registro con el DNI ingresado.</asp:CustomValidator>
                                        </td>
                                    </tr>
                
                                    <tr>
                                        <td class="auto-style2"><asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtTelefono" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="El teléfono es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2"><asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label></td>
                                        <td class="auto-style3"><asp:TextBox ID="txtEmail" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="El email es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                             <div class="botones-varios">
                                 <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Cssclass="boton-general" OnClick="btnGuardar_Click" ValidationGroup="grupo1" />
                                 <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Cssclass="boton-general" OnClick="btnCancelar_Click" />
                                 <asp:Button ID="btnBorrar" runat="server" Text="Borrar Todo" Cssclass="boton-general" OnClick="btnBorrar_Click" />
                             </div>
                            <div>
                                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
                                 <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
