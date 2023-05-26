<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="carritoCompras._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="my-4" style="display: flex">
            <% foreach (var articulo in listaArticulos)
                {
                    string img = "./Assets/NoImage.png";
                    listaImg = negocioImg.listar(articulo.id);
                    if (listaImg.Count > 0 && listaImg != null)
                    {
                        img = listaImg[0].ImagenUrl;
                    }%>
            <div class="card" style="width: 18rem;">
                <img src="<%=img %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%= articulo.nombre %></h5>
                    <p class="card-text"><%= articulo.nombre %></p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <% } %>
        </div>
</asp:Content>
