<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-RegistrarPagos.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_RegistrarPagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de pagos</title>
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
                <div id="pagos-deudas">
                    <h1>Historial de Pagos</h1>
                    <table class="buscador-socios">
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscadorDni" runat="server" Text="Buscar Pago por DNI:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorDni" runat="server" CssClass="txt-general"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarDni" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarDni_Click" ValidationGroup="grupo1"/>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarDni" runat="server" ErrorMessage="Debe ingresar un DNI." ControlToValidate="txtBuscadorDni" ForeColor="Red" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;<asp:RegularExpressionValidator ID="revBuscarDni" runat="server" ErrorMessage="Debe ingresar un DNI válido." ControlToValidate="txtBuscadorDni" ForeColor="Red" ValidationExpression="^\d{8}$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBuscarFecha" runat="server" Text="Buscar Pago por Fecha:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBuscadorFecha" runat="server" CssClass="txt-general" ToolTip="aaaa-mm-dd"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnBuscarFecha" runat="server" Text="Buscar" CssClass="boton-general" OnClick="btnBuscarFecha_Click" ValidationGroup="grupo2"/>
                            </td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="rfvBuscarFecha" runat="server" ErrorMessage="Debe ingresar una fecha." ControlToValidate="txtBuscadorFecha" ForeColor="Red" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;<asp:RegularExpressionValidator ID="revBuscarFecha" runat="server" ErrorMessage="Debe ingresar una fecha válida." ControlToValidate="txtBuscadorFecha" ForeColor="Red" ValidationExpression="^\d{4}-\d{2}-\d{2}$" ValidationGroup="grupo2">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <div class="botones-varios">
                        <asp:Button ID="btnVerTodos" runat="server" Text="Ver todos" CssClass="boton-general" OnClick="btnVerTodos_Click" />
                        <asp:Button ID="btnOrdenarPorFecha" runat="server" Text="Ordenar por fecha" CssClass="boton-general" OnClick="btnOrdenarPorFecha_Click" />
                        <asp:Button ID="btnAgregarPago" runat="server" Text="Agregar pago" CssClass="boton-general" OnClick="btnAgregarPago_Click" />
                    </div>
                    <div class="listado-pagos">
                    <div>
                        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                    </div> 


                        <div id="section-grid" class="seccion">
                        <asp:GridView ID="grdPagos" runat="server" AutoGenerateColumns="False" CssClass="grid" OnRowCommand="grdPagos_RowCommand" OnRowEditing="grdPagos_RowEditing" OnRowCancelingEdit="grdPagos_RowCancelingEdit" OnRowDeleting="grdPagos_RowDeleting" OnRowUpdating="grdPagos_RowUpdating" AllowPaging="True" OnPageIndexChanging="grdPagos_PageIndexChanging" >
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdPago" runat="server" Text='<%# Bind("IdPago_P") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IdPago" runat="server" Text='<%# Bind("IdPago_P") %>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID Socio">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_idSocio" runat="server" Text='<%# Bind("IdSocio_P") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_idSocio" runat="server" Text='<%# Bind("IdSocio_p") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Monto">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Monto" runat="server" Text='<%# Bind("Monto_P") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Monto" runat="server" Text='<%# Bind("Monto_P") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha de pago">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_fechaPago" runat="server" Text='<%# Bind("Fecha_P") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_fechaPago" runat="server" Text='<%# Bind("Fecha_P") %>'></asp:TextBox>
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
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Errores:" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo2" />
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>