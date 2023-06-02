<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="carritoCompras.Pages.carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./../fontawesome/css/all.min.css" rel="stylesheet" />
    <link href="./../Css/carrito.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="contenedor-carrito">
        <h1 style="text-align:center" class="my-4">MI CARRITO</h1>
        <%
            if (this.listCarrito == null || this.listCarrito.Count < 1)
            {%>
        <h3 style="text-align:center" class="mt-5">Carrito vacio</h3>
                <%}
                    else
                    {
                        decimal total = 0;%>
        <div class="contenedor-carrito">
            <%int idEliminar = 2;
                string prueba = "2";
                foreach(var lista in this.listCarrito)
                {//idEliminar = lista.articulo.id;%>
            
            <ul class="contenedor-art">
                <li>
                    <div class="foto">
                    <img src="<%=lista.imagenArt.ImagenUrl %>" alt="foto pequeña" />
                    </div>
                </li>
                <li>
                    <span class="cab">Titulo</span><br />
                    <span><%=lista.articulo.nombre %></span>
                </li>
                <li><span class="cab">Cantidad</span><br />
                    <span><%=lista.cantidad %></span>
                </li>
                <li><span class="cab">Precio unit</span><br />
                    <span><%=lista.articulo.precio.ToString("0.00") %></span>
                </li>
                <li><span class="cab">Subtotal</span><br />
                    <span><%=(lista.articulo.precio * lista.cantidad).ToString("0.00") %></span>
                </li>
                <li class="trash">
                    <asp:ImageButton ImageUrl="./../Assets/trash-solid.svg" runat="server" id="btnEliminar" CssClass="trash" AlternateText="Eliminar"  />
                </li>
            </ul>   
             <%
                     total = total + (lista.articulo.precio * lista.cantidad);
                 }%>
            <div class="footer-carrito">
                <asp:Button Text="Vaciar carrito" OnClick="vaciar_Click" CssClass="btn btn-danger" runat="server" />
                <div>    
                    <span class="total mx-2">TOTAL: $<%=total.ToString("0.00")%></span>
                    <asp:Button Text="COMPRAR" OnClick="comprar_Click" CssClass="btn btn-success mx-2" runat="server" />
                </div>
            </div>
        </div>
                <%}%>
    </main>
</asp:Content>
