using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carritoCompras
{
    public partial class _default : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }
        public ImagenNegocio negocioImg { get; set; }
        public List<ImagenProductos> listaImg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.listar();
            negocioImg = new ImagenNegocio();
        }
    }
}