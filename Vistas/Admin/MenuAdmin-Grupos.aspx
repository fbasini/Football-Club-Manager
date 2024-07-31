<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-Grupos.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_Grupos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Grupos | Futbol 2023</title>
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
                <div class="grupo-listado">
                    <h1>Grupos</h1>
                    <table class="buscador-grupos">
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscadorDescripcion" runat="server" Text="Buscar Grupo por Nombre:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorDescripcion" runat="server" CssClass="txt-general"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarDescripcion" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarDescripcion_Click" ValidationGroup="grupo1"/>
                            </td>
                            <td>
                                &nbsp;<asp:RegularExpressionValidator ID="rfvNombre" runat="server" ErrorMessage="Debe ingresar un nombre válido." ForeColor="Red" ValidationGroup="grupo1" ControlToValidate="txtBuscadorDescripcion" ValidationExpression="^[a-zA-Z ]*$">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarNombre" runat="server" ErrorMessage="Debe ingresar un nombre." ControlToValidate="txtBuscadorDescripcion" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscadorHorario" runat="server" Text="Buscar Grupo por Horario:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorHorario" runat="server" CssClass="txt-general"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarHorario" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarHorario_Click" ValidationGroup="grupo2"/>
                            </td>
                            <td>
                                &nbsp;<asp:RegularExpressionValidator ID="rfvHorario" runat="server" ErrorMessage="Debe ingresar un horario válido." ForeColor="Red" ValidationGroup="grupo2" ControlToValidate="txtBuscadorHorario" ValidationExpression="^[0-9\s:-]+$">*</asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarHorario" runat="server" ErrorMessage="Debe ingresar un horario." ControlToValidate="txtBuscadorHorario" ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFiltroCategoria" runat="server" Text="Filtrar Grupo por Categoria: "></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="txt-general" Width="100%" Height="31px"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnFiltrarCategoria" runat="server" Text="Filtrar" CssClass="boton-general" OnClick="btnFiltrarCategoria_Click"/>
                            </td>
                            <td>
                                <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar filtro" CssClass="boton-general" OnClick="btnQuitarFiltro_Click"/>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                    </div>
                    <div id="section-grid" class="seccion">
                        <asp:GridView ID="grdGrupos" runat="server" AutoGenerateColumns="False" CssClass="grid" OnRowCommand="grdGrupos_RowCommand" OnRowEditing="grdGrupos_RowEditing" OnRowCancelingEdit="grdGrupos_RowCancelingEdit" OnRowDeleting="grdGrupos_RowDeleting" OnRowUpdating="grdGrupos_RowUpdating" AllowPaging="True" OnPageIndexChanging="grdGrupos_PageIndexChanging" >
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdGrupo" runat="server" Text='<%# Bind("IdGrupo_G") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IdGrupo" runat="server" Text='<%# Bind("IdGrupo_G") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Descripcion" runat="server" Text='<%# Bind("Descripcion_G") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Descripcion" runat="server" Text='<%# Bind("Descripcion_G") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profesor">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Profesor" runat="server" Text='<%# Bind("Profesor_G") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Profesor" runat="server" Text='<%# Bind("Profesor_G") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Horario" runat="server" Text='<%# Bind("Horario_G") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Horario" runat="server" Text='<%# Bind("Horario_G") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arancel">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Arancel" runat="server" Text='<%# Bind("Arancel_G") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Arancel" runat="server" Text='<%# Bind("Arancel_G") %>'></asp:TextBox>
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
                        <asp:Button ID="btnRegistrar" runat="server" Text="Añadir Grupo" CssClass="boton-general" OnClick="btnRegistrar_Click"/>
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
