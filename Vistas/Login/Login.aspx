<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Login | Futbol 2023</title>
<link rel="stylesheet" href="../style.css" />
<link rel="icon" href="/icono.ico" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div id="body">
            <img src="../football-club-logo-vector.jpg" class="logo-menu" />

            <table class="tabla-login">
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" class="txt-general"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContrasena" runat="server" class="txt-general" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="boton-general" OnClick="btnIngresar_Click"/>
            <asp:Label ID="lblMensaje" runat="server" Text="Usuario o contraseña incorrectos." Visible="False" ForeColor="Red" ></asp:Label>
            
        </div>
    </form>
</body>
</html>
