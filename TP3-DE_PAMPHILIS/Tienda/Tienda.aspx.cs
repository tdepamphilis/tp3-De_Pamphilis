using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using Dominio;
namespace Tienda
{
    public partial class Tienda : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            List<Producto> products = new List<Producto>();
            ProductoBusiness productoBusiness = new ProductoBusiness();
            products = productoBusiness.listar(0, 0);
            loadcards(products);


        }

        private void loadcards(List<Producto> products)
        {
            // El for depende de la cantidad de productos, esto es para mostrar todo
            // ya que tengo mas productos que tarjetas. Hay que cambiarlo.
            
            List<Image> images = addimagelist();
            List<Label> names = addnamelist();
            List<Label> descs = adddesclist();


            for (int x = 0; x < products.Count(); x++)
            {
                if (products[x] != null)
                {
                    images[x].ImageUrl = products[x].imagen;
                    names[x].Text = products[x].name;
                    descs[x].Text = products[x].desc;
                }
                images[x].Height = 200;
                images[x].Width = 170;
                names[x].Font.Size = FontUnit.XLarge;

            }

        }


        private List<Image> addimagelist()
        {
            List<Image> images = new List<Image>();
            images.Add(Image1);
            images.Add(Image2);
            images.Add(Image3);
            images.Add(Image4);
            images.Add(Image5);
            images.Add(Image6);
            images.Add(Image7);
            images.Add(Image8);

            return images;
        }
        private List<Label> addnamelist()
        {
            List<Label> names = new List<Label>();
            names.Add(Name1);
            names.Add(Name2);
            names.Add(Name3);
            names.Add(Name4);
            names.Add(Name5);
            names.Add(Name6);
            names.Add(Name7);
            names.Add(Name8);

            return names;
        }
        private List<Label> adddesclist()
        {
            List<Label> descriptions = new List<Label>();
            descriptions.Add(Desc1);
            descriptions.Add(Desc2);
            descriptions.Add(Desc3);
            descriptions.Add(Desc4);
            descriptions.Add(Desc5);
            descriptions.Add(Desc6);
            descriptions.Add(Desc7);
            descriptions.Add(Desc8);

            return descriptions;
        }

    }
}