<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-RegistrarSocio.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_RegistarSocio" %>

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
                    <h1>Registro de Socio</h1>
                    <div class="seccion">
                            <div class="datos">
                                <div class="datos-usuario">
                                    <h2>Datos de Usuario</h2>
                                    <table class="tabla-socio">
                                        <tr>
                                            <td><asp:Label ID="lblUsuarioSocio" runat="server" Text="Usuario:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtUsuario" runat="server" CssClass="txt-general" ></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="El nombre de usuario es obligatorio." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;<asp:CustomValidator ID="cvExisteNombreUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="El nombre de usuario ya esta en uso. " ForeColor="Red" OnServerValidate="cvExisteNombreUsuario_ServerValidate" ValidationGroup="grupo1">El nombre de usuario ya está en uso. </asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblContraseña" runat="server" Text="Contraseña:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtContraseña" runat="server" CssClass="txt-general" TextMode="Password"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña" ErrorMessage="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblRepetirContraseña" runat="server" Text="Repetir contraseña:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtRepetirContraseña" runat="server" CssClass="txt-general" TextMode="Password"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvRepetirContraseña" runat="server" ControlToValidate="txtRepetirContraseña" ErrorMessage="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;<asp:CompareValidator ID="cvRepetirContraseña" runat="server" ControlToCompare="txtContraseña" ControlToValidate="txtRepetirContraseña" ErrorMessage="Las contraseñas deben coincidir." ForeColor="Red" ValidationGroup="grupo1">*</asp:CompareValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="botones-varios">
                                    <asp:Button ID="btnGuardar1" runat="server" Text="Guardar" Cssclass="boton-general" OnClick="btnGuardar1_Click" ValidationGroup="grupo1"  />
                                    <asp:Button ID="btnCancelar1" runat="server" Text="Cancelar" Cssclass="boton-general" OnClick="btnCancelar1_Click" />
                                    <asp:Button ID="btnBorrar1" runat="server" Text="Borrar Todo" Cssclass="boton-general" OnClick="btnBorrar1_Click" />
                                </div>
                                <div>
                                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                                </div>
                                <div class="datos-socio">
                                    <h2>Datos del Socio</h2>
                                    <table class="tabla-socio">
                                        <tr>
                                            <td><asp:Label ID="lblNombre" runat="server" Text="Nombre:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtNombre" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblApellido" runat="server" Text="Apellido:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtApellido" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblDNI" runat="server" Text="DNI:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtDNI" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="El DNI es obligatorio." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td></td>
                                            <td>
                                                &nbsp;<asp:CustomValidator ID="cvExisteDni" runat="server" ForeColor="Red" ControlToValidate="txtDNI" ErrorMessage="Ya existe un registro con el DNI ingresado." OnServerValidate="cvExisteDni_ServerValidate1" ValidationGroup="grupo2">Ya existe un registro con el DNI ingresado.</asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblSexoSocio" runat="server" Text="Sexo:" ></asp:Label></td>
                                            <td>
                                                <asp:DropDownList ID="ddlSexoSocio" runat="server" CssClass="txt-general" Width="270px" Enabled="False">
                                                    <asp:ListItem Value="">-- Seleccionar --</asp:ListItem>
                                                    <asp:ListItem>Femenino</asp:ListItem>
                                                    <asp:ListItem>Masculino</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexoSocio" ErrorMessage="El sexo es obligatorio." ForeColor="Red" ValidationGroup="grupo2" InitialValue="">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblFechaNac" runat="server" Text="Fecha de nacimiento" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtDia" runat="server" CssClass="txt-general" Width="40px" Enabled="False"></asp:TextBox>
                                                <asp:DropDownList ID="ddlMes" runat="server" CssClass="txt-general" Width="145px" Enabled="False">
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
                                                <asp:TextBox ID="txtAnio" runat="server" CssClass="txt-general" Width="40px" Enabled="False"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvFechaNacDia" runat="server" ControlToValidate="txtDia" ErrorMessage="La fecha de nacimiento es obligatoria." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvFechaNacMes" runat="server" ControlToValidate="ddlMes" ErrorMessage="La fecha de nacimiento es obligatoria." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvFechaNacAnio" runat="server" ControlToValidate="txtAnio" ErrorMessage="La fecha de nacimiento es obligatoria." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblLocalidad" runat="server" Text="Localidad:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtLocalidad" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="La localidad es obligatoria." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblDomicilio" runat="server" Text="Domicilio:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtDomicilio" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvDomicilio" runat="server" ControlToValidate="txtDomicilio" ErrorMessage="El domicilio es obligatorio." ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblTelefono" runat="server" Text="Teléfono:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtTelefono" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblEmail" runat="server" Text="Email:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="botones-varios">
                                    <asp:Button ID="btnGuardar2" runat="server" Text="Guardar" Cssclass="boton-general" OnClick="btnGuardar2_Click" ValidationGroup="grupo2" Visible="False"  />
                                    <asp:Button ID="btnBorrar2" runat="server" Text="Borrar Todo" Cssclass="boton-general" OnClick="btnBorrar2_Click" Visible="False" />
                                </div>
                                <div>
                                    <asp:Label ID="lblMensaje2" runat="server"></asp:Label>
                                </div>
                                <div class="datos-responsable">
                                    <h2>Datos del Responsable</h2>
                                    <table class="tabla-socio">
                                        <tr>
                                            <td><asp:Label ID="lblNombreRespo" runat="server" Text="Nombre:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtNombreRespo" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvNombreRespo" runat="server" ControlToValidate="txtNombreRespo" ErrorMessage="El nombre es obligatorio." ForeColor="Red" ValidationGroup="grupo3">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblApellidoRespo" runat="server" Text="Apellido:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtApellidoRespo" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvApellidoRespo" runat="server" ControlToValidate="txtApellidoRespo" ErrorMessage="El apellido es obligatorio." ForeColor="Red" ValidationGroup="grupo3">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblDNIRespo" runat="server" Text="DNI:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtDNIRespo" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvDNIRespo" runat="server" ControlToValidate="txtDNIRespo" ErrorMessage="El DNI es obligatorio." ForeColor="Red" ValidationGroup="grupo3">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblSexoResponsable" runat="server" Text="Sexo:" ></asp:Label></td>
                                            <td>
                                                <asp:DropDownList ID="ddlSexoResponsable" runat="server" CssClass="txt-general" Width="270px" Enabled="False">
                                                    <asp:ListItem Value="">-- Seleccionar --</asp:ListItem>
                                                    <asp:ListItem>Femenino</asp:ListItem>
                                                    <asp:ListItem>Masculino</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvSexoResponsable" runat="server" ControlToValidate="ddlSexoResponsable" ErrorMessage="El sexo es obligatorio." ForeColor="Red" ValidationGroup="grupo3" InitialValue="">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="lblTelefonoRespo" runat="server" Text="Teléfono:" ></asp:Label></td>
                                            <td><asp:TextBox ID="txtTelefonoRespo" runat="server" CssClass="txt-general" Enabled="False"></asp:TextBox></td>
                                            <td>
                                                &nbsp;<asp:RequiredFieldValidator ID="rfvTelefonoRespo" runat="server" ControlToValidate="txtTelefonoRespo" ErrorMessage="El teléfono es obligatorio." ForeColor="Red" ValidationGroup="grupo3">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="botones-varios">
                                    <asp:Button ID="btnGuardar3" runat="server" Text="Guardar" Cssclass="boton-general" OnClick="btnGuardar3_Click" Visible="False" ValidationGroup="grupo3"  />
                                    <asp:Button ID="btnBorrar3" runat="server" Text="Borrar Todo" Cssclass="boton-general" OnClick="btnBorrar3_Click" Visible="False" />
                                </div>
                                <div>
                                    <asp:Label ID="lblMensaje3" runat="server"></asp:Label>
                                </div>
                                <div>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="grupo1" HeaderText="Errores:" ShowSummary="False" />
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ValidationGroup="grupo2" HeaderText="Errores:" ShowSummary="False" />
                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ValidationGroup="grupo3" HeaderText="Errores:" ShowSummary="False" />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
