<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="detalles.aspx.cs" Inherits="carritoCompras.detalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./Css/detalles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor-detalle" style="display:flex">
        <div class="carrusel">CARRUSEL</div>
        <div class="ficha">
            <h3><%=articulo.nombre %></h3>
            <ul>
                <li>Codigo: <%= articulo.codigo%> </li>
                <li>Marca: <%= articulo.marca%></li>
                <li>Categoria: <%= articulo.categoria%></li>
                <li>Descripcion: <%= articulo.descripcion%></li>
                <li>Precio: <%= articulo.precio%></li>
            </ul>
            <asp:button text="Agregar + " runat="server" CssClass="btn btn-primary" OnClick="agregarCarrito_Click" />
        </div>
    </div>
</asp:Content>
