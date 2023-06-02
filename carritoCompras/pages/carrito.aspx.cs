using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace carritoCompras.Pages
{
    public partial class carrito : System.Web.UI.Page
    {
        public List<dominio.Carrito> listCarrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
           listCarrito = (List<dominio.Carrito>)Session["carrito"];
            if (!IsPostBack)
            {
                DataBind(); // Esto es necesario para evaluar las expresiones <%# %> en el ASPX
            }
        }

        protected void vaciar_Click(object sender, EventArgs e)
        {
            listCarrito.Clear();
        }

        protected void comprar_Click(object sender, EventArgs e)
        {
            listCarrito.Clear();
            string script = "alert('¡Compra exitosa!');";
            ClientScript.RegisterStartupScript(this.GetType(), "CompraExitosa", script, true);
        }

        protected void borrar_Click(object sender, EventArgs e)
        {
            ImageButton boton = (ImageButton)sender;
            int idEliminar = int.Parse(boton.CommandArgument);
            MessageBox.Show(idEliminar.ToString());
        }

    }
}