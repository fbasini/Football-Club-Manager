<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuSocio-Datos.aspx.cs" Inherits="Vistas.Socio.MenuSocio_Datos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Datos</title>
<link rel="stylesheet" href="../style.css" />
<link rel="icon" href="/icono.ico" />
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
                <div class="modificar-datos">
                    <h1>Usuario</h1>
                    <div class="seccion">
                        <table class="tabla-modificar-datos">
                            <tr>
                                <td>Usuario:</td>
                                <td>
                                    <asp:TextBox ID="txtNombreUsuario" runat="server" Enabled="False" CssClass="txt-general"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Contraseña:</td>
                                <td>
                                    <asp:TextBox ID="txtContraseña" runat="server" Enabled="False" CssClass="txt-general"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Nueva contraseña:</td>
                                <td>
                                    <asp:TextBox ID="txtNuevaContraseña" runat="server" Enabled="False" CssClass="txt-general" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Repetir contraseña:</td>
                                <td>
                                    <asp:TextBox ID="txtRepetirContraseña" runat="server" Enabled="False" CssClass="txt-general" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="botones-varios">
                        <asp:Button ID="btnModificarUsuario" runat="server" Text="Modificar" CssClass="boton-general" Visible="true" OnClick="btnModificarUsuario_Click"/>
                        <asp:Button ID="btnAceptarUsuario" runat="server" Text="Aceptar" CssClass="boton-general" Visible="false" OnClick="btnAceptarUsuario_Click" OnClientClick='return confirm("¿Está seguro que desea modificar su contraseña?");'/>
                        <asp:Button ID="btnCancelarUsuario" runat="server" Text="Cancelar" CssClass="boton-general" Visible="false" OnClick="btnCancelarUsuario_Click"/>
                    </div>
                </div>
                <div class="modificar-datos">
                    <h1>Datos del Socio</h1>
                    <div class="seccion">
                        <table class="tabla-modificar-datos">
                            <tr>
                                <td>Nombre:</td>
                                <td>
                                    <asp:TextBox ID="txtNombre" runat="server" Enabled="False" CssClass="txt-general">Mateo</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Apellido:</td>
                                <td>
                                    <asp:TextBox ID="txtApellido" runat="server" Enabled="False" CssClass="txt-general">Ronaldo</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>DNI:</td>
                                <td>
                                    <asp:TextBox ID="txtDni" runat="server" Enabled="False" CssClass="txt-general">48519035</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Genero:</td>
                                <td>
                                    <asp:TextBox ID="txtGenero" runat="server" Enabled="False" CssClass="txt-general">Masculino</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Fecha de Nacimiento:</td>
                                <td>
                                    <asp:TextBox ID="txtNacimiento" runat="server" Enabled="False" CssClass="txt-general">14/09/2008</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Ciudad:</td>
                                <td>
                                    <asp:TextBox ID="txtCiudad" runat="server" Enabled="False" CssClass="txt-general">CABA</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Domicilio:</td>
                                <td>
                                    <asp:TextBox ID="txtDomicilio" runat="server" Enabled="False" CssClass="txt-general">Calle Falsa 1909</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Teléfono:</td>
                                <td>
                                    <asp:TextBox ID="txtTelefono" runat="server" Enabled="False" CssClass="txt-general">11-5805-2627</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Enabled="False" CssClass="txt-general">materonaldo@gmail.com</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="botones-varios">
                        <asp:Button ID="btnModificarSocio" runat="server" Text="Modificar" CssClass="boton-general" Visible="true" OnClick="btnModificarSocio_Click"/>
                        <asp:Button ID="btnAceptarSocio" runat="server" Text="Aceptar" CssClass="boton-general" Visible="false" OnClick="btnAceptarSocio_Click" OnClientClick="return confirm(&quot;¿Está seguro que desea modificar los datos del socio?&quot;);"/>
                        <asp:Button ID="btnCancelarSocio" runat="server" Text="Cancelar" CssClass="boton-general" Visible="false" OnClick="btnCancelarSocio_Click"/>
                    </div>
                </div>
                <div class="modificar-datos">
                    <h1>Datos del Responsable</h1>
                    <div class="seccion">
                        <table class="tabla-modificar-datos">
                            <tr>
                                <td>Nombre:</td>
                                <td>
                                    <asp:TextBox ID="txtNombreResponsable" runat="server" Enabled="False" CssClass="txt-general">Mateo</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Apellido:</td>
                                <td>
                                    <asp:TextBox ID="txtApellidoResponsable" runat="server" Enabled="False" CssClass="txt-general">Ronaldo</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>DNI:</td>
                                <td>
                                    <asp:TextBox ID="txtDniResponsable" runat="server" Enabled="False" CssClass="txt-general">48519035</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Género:</td>
                                <td>
                                    <asp:TextBox ID="txtGeneroResponsable" runat="server" Enabled="False" CssClass="txt-general">Masculino</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Teléfono:</td>
                                <td>
                                    <asp:TextBox ID="txtTelefonoResponsable" runat="server" Enabled="False" CssClass="txt-general">11-5805-2627</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="botones-varios">
                        <asp:Button ID="btnModificarResponsable" runat="server" Text="Modificar" CssClass="boton-general" Visible="true" OnClick="btnModificarResponsable_Click" />
                        <asp:Button ID="btnAceptarResponsable" runat="server" Text="Aceptar" CssClass="boton-general" Visible="false" OnClick="btnAceptarResponsable_Click" OnClientClick="return confirm(&quot;¿Está seguro que desea modificar los datos del responsable?&quot;);" />
                        <asp:Button ID="btnCancelarResponsable" runat="server" Text="Cancelar" CssClass="boton-general" Visible="false" OnClick="btnCancelarResponsable_Click" />
                    </div>
                </div>
                <div class="grupo-actual">
                    <h1>Tus Grupos</h1>
                    <div class="seccion" id="section-grid">
                        <asp:GridView ID="grdGruposActuales" runat="server" CssClass="grid">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
