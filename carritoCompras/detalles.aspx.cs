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
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> listaArticulos = negocio.listar($" where a.id={id}");
            this.articulo = listaArticulos[0];
        }

        protected void agregarCarrito_Click(object sender, EventArgs e)
        {
            MessageBox.Show("prueba");
        }
    }
}