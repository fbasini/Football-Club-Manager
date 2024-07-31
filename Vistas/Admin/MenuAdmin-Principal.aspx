<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuAdmin-Principal.aspx.cs" Inherits="Vistas.Admin.MenuPrincipalAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menú Principal | Futbol 2023</title>
<link rel="stylesheet" href="../style.css" />
    <link rel="icon" href="/icono.ico" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <form id="form1" runat="server" >
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
                    <li><asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="boton" OnClick="btnCerrarSesion_Click"/></li>
                </ul>
            </nav>
        </div>

        <!-- ////////////////////////////////////// - BODY - ////////////////////////////////////// -->
        <div id="body">
            <div class="principal-box">
                <div class="menu-principal">
                    <img src="../football-club-logo-vector.jpg" class="logo-menu" />
                    <ul>
                        <li>
                            <asp:Button ID="btnSocios" runat="server" Text="SOCIOS" class="boton-general" OnClick="btnSocios_Click"/>
                        </li>
                        <li>
                            <asp:Button ID="btnInscripcionSocios" runat="server" Text="INSCRIPCIONES" class="boton-general" OnClick="btnInscripcionSocios_Click"/>
                        </li>
                        <li>
                            <asp:Button ID="btnGrupos" runat="server" Text="GRUPOS" class="boton-general" OnClick="btnGrupos_Click"/>
                        </li>
                        <li>
                            <asp:Button ID="btnPagos" runat="server" Text="REGISTRO DE PAGOS" class="boton-general" OnClick="btnPagos_Click"/>
                        </li>
                        <li>
                            <asp:Button ID="btnRegistrarAdmin" runat="server" Text="REGISTRAR UN ADMINISTRADOR" class="boton-general" OnClick="btnRegistrarAdmin_Click"/>
                        </li>
                        <li>
                            <asp:Button ID="btnReportes" runat="server" Text="INFORME DE PAGOS" class="boton-general" OnClick="btnReportes_Click"/>
                        </li>
                    </ul>
                </div>    
            </div>
        </div>
    </form>
</body>
</html>
