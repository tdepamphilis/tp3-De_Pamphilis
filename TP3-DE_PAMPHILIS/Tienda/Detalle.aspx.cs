using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Business;

namespace Tienda
{
    public partial class Detalle : System.Web.UI.Page
    {

        ProductoBusiness productoBusiness = new ProductoBusiness();
        public Producto product = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
            product = readsession();
        }

        private Producto readsession()
        {
            var prod = new Producto();
            try
            {

                var artcode = (string)Request.QueryString["ART"];
                var producto = productoBusiness.buscar(artcode);
                return producto;

            }
            catch (Exception)
            {

                throw;
            }



        }
    }
}