<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuSocio-Pagos.aspx.cs" Inherits="Vistas.Socio.MenuSocio_Pagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                <div class="socios-pagos">
                    <h1>Historial de pagos</h1>
                    <div class="botones-varios">
                        <asp:Button ID="btnOrdenarPorFecha" runat="server" Text="Ordenar por fecha" CssClass="boton-general" OnClick="btnOrdenarPorFecha_Click" />
                        <asp:Button ID="btnOrdenarPorMonto" runat="server" Text="Ordenar por monto" CssClass="boton-general" OnClick="btnOrdenarPorMonto_Click" />
                        <asp:Button ID="btnRestaurar" runat="server" Text="Restaurar" CssClass="boton-general" OnClick="btnRestaurar_Click" />
                    </div>
                    <div class="seccion" id="section-grid">
                        <asp:GridView ID="grdPagos" runat="server" CssClass="grid" AllowPaging="True" OnPageIndexChanging="grdPagos_PageIndexChanging">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
