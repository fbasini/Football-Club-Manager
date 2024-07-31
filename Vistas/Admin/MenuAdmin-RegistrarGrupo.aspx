<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-RegistrarGrupo.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_RegistrarGrupo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Grupo | Futbol 2023</title>
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
                <div class="registrar-grupo">
                    <h1>Nuevo Grupo</h1>
                    <div class="seccion">
                        <table class="tabla-registro-grupo">
                            <tr>
                                <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripcion:"></asp:Label></td>
                                <td><asp:TextBox ID="txtDescripcion" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe ingresar una descripción." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    &nbsp;<asp:CustomValidator ID="cvExisteGrupo" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ya existe un registro con la descripción ingresada." ForeColor="Red" OnServerValidate="cvExisteGrupo_ServerValidate" ValidationGroup="grupo1">*</asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblCategoria" runat="server" Text="Categoría:"></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="txt-general" Width="100%" Height="31px"></asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblProfesor" runat="server" Text="Profesor:"></asp:Label></td>
                                <td><asp:TextBox ID="txtProfesor" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvProfesor" runat="server" ControlToValidate="txtProfesor" ErrorMessage="Debe ingresar un profesor." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                
                            <tr>
                                <td><asp:Label ID="lblHorario" runat="server" Text="Horario:"></asp:Label></td>
                                <td><asp:TextBox ID="txtHorario" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvHorario" runat="server" ControlToValidate="txtHorario" ErrorMessage="Debe ingresar un horario." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblArancel" runat="server" Text="Arancel:"></asp:Label></td>
                                <td><asp:TextBox ID="txtArancel" runat="server" CssClass="txt-general"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvArancel" runat="server" ControlToValidate="txtArancel" ErrorMessage="Debe ingresar un arancel." ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="botones-varios">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="boton-general" OnClick="btnGuardar_Click" ValidationGroup="grupo1" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton-general" OnClick="btnCancelar_Click"/>
                    <asp:Button ID="btnBorrar" runat="server" Text="Borrar Todo" CssClass="boton-general" OnClick="btnBorrar_Click"/>
                </div>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
                    <asp:Label runat="server" ID="lblMensaje" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
