using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Business;
using Antlr.Runtime.Tree;

namespace Tienda
{
    public partial class Detalle : System.Web.UI.Page
    {

        ProductoBusiness productoBusiness = new ProductoBusiness();
        public List<Compra> items;

        protected void Page_Load(object sender, EventArgs e)
        {
            items = readsession();
            if (!IsPostBack)
            {
                delitem();
                additem();
                takeitem();
            }
        }

        private List<Compra> readsession()
        {
            if (Session["chart"] == null)
                Session["chart"] = new List<Compra>();


            List<Compra> auxlist = (List<Compra>)Session["chart"];
            return auxlist;



        }
        private void delitem()
        {
            string code = (string)Request.QueryString["del"];
            if (code != null)
            {

                int index = 0;
                int selectedindex = -1;
                foreach (Compra item in items)
                {
                    if (item.code == code)
                    {

                        selectedindex = index;
                    }
                    index++;
                }
                if (selectedindex != -1)
                    items.RemoveAt(selectedindex);
            }
        }
        private void additem()
        {
            string code = (string)Request.QueryString["add"];
            if (code != null)
            {
                foreach (Compra item in items)
                {
                    if (item.code == code)
                        item.amount += 1;
                }
            }
        }
        private void takeitem()
        {
            string code = (string)Request.QueryString["take"];
            if (code != null)
            {
                int index = 0;
                int delindex = -1;
                foreach (Compra item in items)
                {
                    if (item.code == code)
                        item.amount -= 1;
                    if (item.amount == 0)
                        delindex = index;
                    index++;
                }
                if (delindex != -1)
                    items.RemoveAt(delindex);
            }
        }
    }
}