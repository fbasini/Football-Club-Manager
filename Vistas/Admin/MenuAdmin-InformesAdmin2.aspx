<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-InformesAdmin2.aspx.cs" Inherits="Vistas.Admin.MenuAdmin_InformesAdmin2" %>

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
                    <h1>Informe de Pagos</h1>
                    <div id="section-grid" class="seccion">
                        <asp:GridView ID="grdInforme" runat="server" CssClass="grid" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdPago" runat="server" Text='<%# Bind("IdPago_P") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID Socio">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_idSocio" runat="server" Text='<%# Bind("IdSocio_P") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Monto">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Monto" runat="server" Text='<%# Bind("Monto_P") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha del Pago">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_fechaPago" runat="server" Text='<%# Bind("Fecha_P") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    
                    <div style="margin-top:20px;">
                        <asp:Button ID="btnGenerarOtroInforme" runat="server" Text="Generar otro Informe" CssClass="boton-general" OnClick="btnGenerarOtroInforme_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
