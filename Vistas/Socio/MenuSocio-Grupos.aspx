<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuSocio-Grupos.aspx.cs" Inherits="Vistas.Socio.MenuSocio_Grupos" %>

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
                <div class="grupo-actual">
                    <h1>Grupo Actual</h1>
                    <div class="seccion" id="seccion-grid">
                        <asp:GridView ID="grdGruposActuales" runat="server" CssClass="grid" AutoGenerateColumns="False" OnSelectedIndexChanging="grdGruposActuales_SelectedIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdGrupo_gxs" runat="server" Text='<%# Bind("IdGrupo_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Descripcion_gxs" runat="server" Text='<%# Bind("Descripcion_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Categoría">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Categoría_gxs" runat="server" Text='<%# Bind("Nombre_C") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profesor">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Profesor_gxs" runat="server" Text='<%# Bind("Profesor_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Horario_gxs" runat="server" Text='<%# Bind("Horario_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arancel">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Arancel_gxs" runat="server" Text='<%# Bind("Arancel_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnSeleccionar_gxs" runat="server" CommandName="Select" Text='<i class="bi bi-square"></i>'  CssClass="boton-aceptar"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" />

                        </asp:GridView>
                    </div>
                    <asp:Button ID="btnBaja" runat="server" Text="Darse de Baja" CssClass="boton-general" OnClick="btnBaja_Click" />
                </div>
                <div class="grupo-opciones">
                    <h1>Grupos Disponibles</h1>
                    <div class="seccion">
                        <asp:GridView ID="grdGruposDisponibles" runat="server" CssClass="grid" AutoGenerateColumns="False" OnSelectedIndexChanging="grdGruposDisponibles_SelectedIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdGrupo_g" runat="server" Text='<%# Bind("IdGrupo_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Descripcion_g" runat="server" Text='<%# Bind("Descripcion_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profesor">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Profesor_g" runat="server" Text='<%# Bind("Profesor_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horario">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Horario_g" runat="server" Text='<%# Bind("Horario_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arancel">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Arancel_g" runat="server" Text='<%# Bind("Arancel_G") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnSeleccionar_g" runat="server" CommandName="Select" Text='<i class="bi bi-square"></i>'  CssClass="boton-aceptar"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" />

                        </asp:GridView>
                    </div>
                    <asp:Button ID="btnInscribirse" runat="server" Text="Inscribirse" CssClass="boton-general" OnClick="btnInscribirse_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
