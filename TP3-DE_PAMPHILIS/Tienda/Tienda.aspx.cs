﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Business;
using Dominio;
namespace Tienda
{
    public partial class Tienda : System.Web.UI.Page
    {

        public List<Producto> products = new List<Producto>();
        public List<Categoria> categories = new List<Categoria>();
        public List<Marca> brands = new List<Marca>();
        public List<Compra> chart = new List<Compra>();
        ProductoBusiness productoBusiness = new ProductoBusiness();
        MarcaBusiness marcaBusiness = new MarcaBusiness();
        CategoriaBusiness categoriaBusiness = new CategoriaBusiness();
        public string page;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                products = productoBusiness.listar(0, 0);

                clear();
                categories = categoriaBusiness.listar();
                brands = marcaBusiness.listar();
                startslider();
                writesession();


            }
            else
            {

                search();

            }
            page = HttpContext.Current.Request.Url.AbsoluteUri;
            chart = readsession();






        }

        private void startslider()
        {
            DropDownListby.Items.Add("----");
            DropDownListby.Items.Add("Categoria");
            DropDownListby.Items.Add("Marca");
            DropDownListfilter.Items.Add("------");
        }

        protected void updatefilter(object sender, EventArgs e)
        {

            if (DropDownListby.SelectedIndex == 2)
            {
                DropDownListfilter.DataSource = marcaBusiness.listar();
                DropDownListfilter.DataBind();
                search();


            }
            else if (DropDownListby.SelectedIndex == 1)
            {
                DropDownListfilter.DataSource = categoriaBusiness.listar();
                DropDownListfilter.DataBind();
                search();
            }
            else
            {
                DropDownListfilter.Items.Clear();
                DropDownListfilter.Items.Add("------");
                search();

            }

        }
        protected void searchpress(Object sender, EventArgs e)
        {

        }
        protected void filterdata(object sender, EventArgs e)
        {

            search();
        }

        private void search()
        {
            if (DropDownListby.SelectedIndex == 1)
            {
                if (TextBoxsearch.Text == "")
                {
                    // se filtra por categoria sin nombre
                    List<Categoria> aux = categoriaBusiness.listar();
                    if (DropDownListfilter.SelectedIndex >= aux.Count())
                        DropDownListfilter.SelectedIndex = 0;
                    products = productoBusiness.listar(1, aux[DropDownListfilter.SelectedIndex].code);
                }
                else
                {
                    // se filtra por categoria y nombre
                    List<Categoria> aux = categoriaBusiness.listar();
                    if (DropDownListfilter.SelectedIndex >= aux.Count())
                        DropDownListfilter.SelectedIndex = 0;
                    products = productoBusiness.listarCriterio(TextBoxsearch.Text, 1, aux[DropDownListfilter.SelectedIndex].code);
                }
            }
            else if (DropDownListby.SelectedIndex == 2)
            {
                if (TextBoxsearch.Text == "")
                {
                    // se filtra por marca
                    List<Marca> aux = marcaBusiness.listar();
                    if (DropDownListfilter.SelectedIndex >= aux.Count())
                        DropDownListfilter.SelectedIndex = 0;
                    products = productoBusiness.listar(2, aux[DropDownListfilter.SelectedIndex].code);
                }
                else
                {
                    // se filtra por marca y criterio
                    List<Marca> aux = marcaBusiness.listar();
                    if (DropDownListfilter.SelectedIndex >= aux.Count())
                        DropDownListfilter.SelectedIndex = 0;
                    products = productoBusiness.listarCriterio(TextBoxsearch.Text, 2, aux[DropDownListfilter.SelectedIndex].code);
                }
            }
            else if (DropDownListby.SelectedIndex == 0)
            {
                if (TextBoxsearch.Text == "")
                {
                    // se muestran todos
                    products = productoBusiness.listar(0, 0);
                }
                else
                {
                    // se muestran por nombre
                    products = productoBusiness.listarCriterio(TextBoxsearch.Text, 0, 0);
                }
            }
        }

        private void writesession()
        {
            var comp = new Compra();
            try
            {


                string code = (string)Request.QueryString["ART"];
                if (code != null)
                {


                    bool nuevo = true;
                    List<Compra> aux = (List<Compra>)Session["chart"];
                    foreach(Compra item in aux)
                    {
                        if(item.code == code)
                        {
                            item.amount++;
                            nuevo = false;
                        }
                    }
                    if(nuevo)
                    {
                    var auxproduct = productoBusiness.buscar(code);
                    comp.name = auxproduct.name;
                    comp.code = auxproduct.code;
                    comp.amount = 1;
                    comp.price = (float)auxproduct.precio;
                    aux.Add(comp);
                    }



                    Session.Remove("chart");
                    Session["chart"] = aux;
                }

            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<Compra> readsession()
        {

            if (Session["chart"] == null)
                Session["chart"] = new List<Compra>();


            List<Compra> auxlist = (List<Compra>)Session["chart"];
            return auxlist;
        }
        private void clear()
        {
            string code = (string)Request.QueryString["clear"];
            if (code != null)
            {
                
                Session.Remove("chart");
            }
        }
    }
}