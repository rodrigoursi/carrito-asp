<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="carritoCompras.Pages.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%List<dominio.Carrito> listCarrito = (List<dominio.Carrito>)Session["carrito"]; %>
    <h1><%=listCarrito[0].articulo.nombre %></h1>
</asp:Content>
