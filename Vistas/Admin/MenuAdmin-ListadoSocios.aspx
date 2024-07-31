<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-ListadoSocios.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_ListadoSocios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Socios | Futbol 2023</title>
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
                <div class="listado-socios">
                    <h1>Listado de Socios</h1>
                    <table class="buscador-socios">
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscadorNombre" runat="server" Text="Buscar Socio por Nombre:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorNombre" runat="server" CssClass="txt-general"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarNombre" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarNombre_Click" ValidationGroup="grupo1"/>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarNombre" runat="server" ErrorMessage="Debe ingresar un nombre." ControlToValidate="txtBuscadorNombre" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscadorDni" runat="server" Text="Buscar Socio por DNI:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorDni" runat="server" CssClass="txt-general"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarDni" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarDni_Click" ValidationGroup="grupo2"/>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarDni" runat="server" ErrorMessage="Debe ingresar un DNI." ControlToValidate="txtBuscadorDni" ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;<asp:RegularExpressionValidator ID="revBuscarDni" runat="server" ErrorMessage="Debe ingresar un DNI válido." ControlToValidate="txtBuscadorDni" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="grupo2">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </div>
                    
                    <div id="section-grid"  class="seccion">
                        <asp:GridView ID="grdSocios" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="grdSocios_PageIndexChanging" OnRowDeleting="grdSocios_RowDeleting" CssClass="grid" OnRowEditing="grdSocios_RowEditing" OnRowCancelingEdit="grdSocios_RowCancelingEdit" OnRowUpdating="grdSocios_RowUpdating" >
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdSocio" runat="server" Text='<%# Bind("IdSocio_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IdSocio" runat="server" Text='<%# Bind("IdSocio_S") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NOMBRE">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_NombreSocio" runat="server" Text='<%# Bind("Nombre_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_NombreSocio" runat="server" Text='<%# Bind("Nombre_S") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="APELLIDO">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_ApellidoSocio" runat="server" Text='<%# Bind("Apellido_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_ApellidoSocio" runat="server" Text='<%# Bind("Apellido_S") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_DniSocio" runat="server" Text='<%# Bind("Dni_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_DniSocio" runat="server" Text='<%# Bind("Dni_S") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TELEFONO">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_TelefonoSocio" runat="server" Text='<%# Bind("Telefono_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_TelefonoSocio" runat="server" Text='<%# Bind("Telefono_S") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMAIL">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_EmailSocio" runat="server" Text='<%# Bind("Email_S") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_EmailSocio" runat="server" Text='<%# Bind("Email_S") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEditar" runat="server" CommandName="Edit" Text='<i class="bi bi-pencil-fill"></i>'  CssClass="boton-editar"/>
                                        <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Delete" Text='<i class="bi bi-x-square-fill"></i>'  CssClass="boton-eliminar" OnClientClick='return confirm("¿Está seguro que desea eliminar este registro?");'/>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="btnAceptar" runat="server" CommandName="Update" Text='<i class="bi bi-check"></i>'  CssClass="boton-aceptar" OnClientClick='return confirm("¿Está seguro que desea editar este registro?");'/>
                                        <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Cancel" Text='<i class="bi bi-x"></i>'  CssClass="boton-eliminar"/>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="botones-varios">
                        <asp:Button ID="btnMostrarTodo" runat="server" Text="Mostrar Todo" CssClass="boton-general" OnClick="btnMostrarTodo_Click"/>
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Socio" CssClass="boton-general" OnClick="btnRegistrar_Click"/>
                    </div>
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
                    </div>
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo2" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
