<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="carritoCompras._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./Css/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor-tarjetas my-4">
            <% foreach (var articulo in listaArticulos)
                {
                    string img = "./Assets/NoImage.png";
                    listaImg = negocioImg.listar(articulo.id);
                    if (listaImg.Count > 0 && listaImg != null)
                    {
                        img = listaImg[0].ImagenUrl;
                    }%>
            <div class="card mx-4 mb-3" style="width: 18rem;">
                <img src="<%=img %>" class="card-img-top imagen-tarjeta" alt="Foto del producto">
                <div class="card-body texto-tarjeta">
                    <h5 class="card-title"><%= articulo.nombre %></h5>
                    <p class="card-text"><%= articulo.descripcion %></p>
                    <a href="#" class="btn btn-primary">Ver detalle</a>
                </div>
            </div>
            <% } %>
        </div>
</asp:Content>
