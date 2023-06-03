using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace carritoCompras
{
    public partial class detalles : System.Web.UI.Page
    {
        public Articulo articulo { get; set; }
        public List<ImagenProductos> listaImg { get; set; }
        public List<Carrito> listaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                Response.Redirect("./../default.aspx");
            }

            string id = Request.QueryString["id"];
            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> listaArticulos = negocio.listar($" where a.id={id}");
            this.articulo = listaArticulos[0];
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            listaImg = imagenNegocio.listar(int.Parse(id));
        }

        protected void agregarCarrito_Click(object sender, EventArgs e)
        {
            string urlIm = "./../Assets/NoImage.png";
            if (listaImg.Count > 0 && listaImg[0] != null)
            {
                urlIm = listaImg[0].ImagenUrl;
            }
            Carrito carrito = new Carrito(this.articulo, urlIm);
            List<Carrito> listaProductos = (List<Carrito>)Session["carrito"];
            if(listaProductos == null)
            {
                listaProductos = new List<Carrito>();
                listaProductos.Add(carrito);
            }
            else
            {
                int estaEnCarrito = productoEnCarrito(carrito, listaProductos);
                if (estaEnCarrito > -1) listaProductos[estaEnCarrito].cantidad += carrito.cantidad;
                else listaProductos.Add(carrito);
            }
            //Carrito carrito = new Carrito(this.articulo, listaImg[0]);
            Session.Add("carrito", listaProductos);
        }
        protected int productoEnCarrito(Carrito carrito, List<Carrito> listaProductos) 
        {
            int index = 0;
            foreach (var item in listaProductos)
            {
                if(item.articulo.id == carrito.articulo.id)
                {
                    return index;
                } 
                index++;
            }
            return -1;
        }
    }
}