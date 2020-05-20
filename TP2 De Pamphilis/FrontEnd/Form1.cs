﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Dominio;
using Business;


namespace FrontEnd
{
    public partial class Form1 : Form
    {
        bool images = true;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var result = MessageBox.Show("Desea cargar imagenes? Al no cargarse se ahorra tiempo de proceso.", "Imagenes", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.No)
            {
                images = false;
            }
            Startgrid();
            StartFilter();        
        }

        private void dataGridView_Main_SelectionChanged(object sender, EventArgs e)
        {
            UpdateInfo();

        }

        private void comboBox_FilterBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateFilter();
        }
        private void button_Filter_Click(object sender, EventArgs e)
        {
            FilterData();
        }
        private void button_Newproduct_Click(object sender, EventArgs e)
        {
            Form_Alta newform = new Form_Alta();
            newform.ShowDialog();
            FilterData();

        }
        private void button_Delete_Click(object sender, EventArgs e)
        {
            var result = MessageBox.Show("Desea eliminar el producto?", "Baja", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                delete();
                FilterData();
            }          
        }
        private void button_Modify_Click(object sender, EventArgs e)
        {
            Producto producto = (Producto)dataGridView_Main.CurrentRow.DataBoundItem;
            Form_Alta alta = new Form_Alta(producto);
            alta.ShowDialog();
            FilterData();
        }
        private void Form1_Enter(object sender, EventArgs e)
        {
            
            UpdateFilter();
            Startgrid();
            UpdateInfo();
        }
        private void button_DeleteCat_Click(object sender, EventArgs e)
        {
            BajaCategoria bajaCategoria = new BajaCategoria(0);
            bajaCategoria.ShowDialog();
            UpdateFilter();
            FilterData();

        }
        private void button_ModCat_Click(object sender, EventArgs e)
        {
            FrmModificarCat frmModificarCat = new FrmModificarCat(0);
            frmModificarCat.ShowDialog();
            int aux = comboBox_Filter.SelectedIndex;
            UpdateFilter();
            comboBox_Filter.SelectedIndex = aux;
            FilterData();
        }
        private void button_NuevaCat_Click(object sender, EventArgs e)
        {
            NuevaCategoria nuevaCategoria = new NuevaCategoria(0);
            nuevaCategoria.ShowDialog();
            UpdateFilter();
            FilterData();       }
        private void button_NuevaMarca_Click(object sender, EventArgs e)
        {
            NuevaCategoria nuevaCategoria = new NuevaCategoria(1);
            nuevaCategoria.ShowDialog();
            UpdateFilter();
        }

        private void button_DelMarca_Click(object sender, EventArgs e)
        {
            BajaCategoria bajaCategoria = new BajaCategoria(1);
            bajaCategoria.ShowDialog();
            UpdateFilter();
            FilterData();
        }

        private void button_ModMarca_Click(object sender, EventArgs e)
        {
            FrmModificarCat frmModificarCat = new FrmModificarCat(1);
            int aux = comboBox_Filter.SelectedIndex;
            frmModificarCat.ShowDialog();
            UpdateFilter();
            comboBox_Filter.SelectedIndex = aux;
            FilterData();
        }
        private void Form1_Activated(object sender, EventArgs e)
        {
            
        }
        
        //-----------------FUNCIONES DE CARGA-------------
        
        public void Startgrid()
        {
            // inicializa la tabla
            ProductoBusiness productoBusiness = new ProductoBusiness();
            dataGridView_Main.DataSource = productoBusiness.listar(0,0);
            dataGridView_Main.Columns[2].Visible = false;
            dataGridView_Main.Columns[3].Visible = false;
            dataGridView_Main.Columns[4].Visible = false;

        }
        
        private void StartFilter()
        {
            comboBox_FilterBy.Items.Add("-");
            comboBox_FilterBy.Items.Add("Categoria");
            comboBox_FilterBy.Items.Add("Marca");
            comboBox_FilterBy.SelectedIndex = 0;

        }

        private void UpdateInfo()
        {
            Producto producto;
            Marca marca;
            Categoria categoria;
            MarcaBusiness marcaBusiness = new MarcaBusiness();
            CategoriaBusiness categoriaBusiness = new CategoriaBusiness();
            // se instancia el producto seleccionado
            producto = (Producto)dataGridView_Main.CurrentRow.DataBoundItem;
            // se instancia la marca y categoria del producto seleccionado 
            marca = marcaBusiness.buscar(producto.idMarca);
            categoria = (Categoria)categoriaBusiness.buscar(producto.idCategoria);


            // Se escribe la info de las instancias
            textBox_desc.Text = "CATEGORIA: " + categoria.name + Environment.NewLine +"MARCA: " + marca.name 
                                + Environment.NewLine + "-------------------------------------------------------------------------------------------------------------------------" + Environment.NewLine 
                                + producto.desc;
            if(images)
            {
            try
            {
            pictureBox_Product.Load(producto.imagen);

            }
            catch (Exception)
            {
                pictureBox_Product.Load("https://designshack.net/wp-content/uploads/placeholder-image-368x246.png");
             
            }
            }


        }

        private void UpdateFilter()
        {
            
            // Funcion que actualiza la lista desplegable de filtro -- FALTA AGREGAR CATEGORIAS
            if(comboBox_FilterBy.SelectedIndex == 0)
            {
                comboBox_Filter.DataSource = null;
            } else if(comboBox_FilterBy.SelectedIndex == 1)
            {
                CategoriaBusiness categoriaBusiness = new CategoriaBusiness();
                comboBox_Filter.DataSource = categoriaBusiness.listar();
            } else if(comboBox_FilterBy.SelectedIndex ==2)
            {
                MarcaBusiness marcaBusiness = new MarcaBusiness();
                comboBox_Filter.DataSource = marcaBusiness.listar();
            }
        }

        private void FilterData()
        {

            ProductoBusiness productoBusiness = new ProductoBusiness();
            Categoria categoria;
            Marca marca;
            try
            {
                if (comboBox_FilterBy.SelectedIndex == 0)
                {
                    if (textBox_Search.Text == "")
                    {
                        // se muestra todo
                        Startgrid();
                    }
                    else
                    {
                        // Se muestra segun criterio
                        dataGridView_Main.DataSource = productoBusiness.listarCriterio(textBox_Search.Text, 0, 0);
                    }
                }
                else if (comboBox_FilterBy.SelectedIndex == 1)
                {
                    categoria = (Categoria)comboBox_Filter.SelectedItem;
                    if (textBox_Search.Text == "")
                    {
                        // se muestran todos los de la categoria                 
                        dataGridView_Main.DataSource = productoBusiness.listar(1, categoria.code);
                    }
                    else
                    {
                        // se busca segun criterio en la categoria
                        dataGridView_Main.DataSource = productoBusiness.listarCriterio(textBox_Search.Text, 1, categoria.code);
                    }
                }
                else if (comboBox_FilterBy.SelectedIndex == 2)
                {
                    marca = (Marca)comboBox_Filter.SelectedItem;
                    if (textBox_Search.Text == "")
                    {
                        // Se buscan todos los de la marca
                        dataGridView_Main.DataSource = productoBusiness.listar(2, marca.code);
                    }
                    else
                    {
                        // Se busca segun criterio en la Marca
                        dataGridView_Main.DataSource = productoBusiness.listarCriterio(textBox_Search.Text, 2, marca.code);
                    }

                }
            }
           
            catch (Exception)
            {

               
            }

            
        }

        //-------------Operacines---------------------
        private void delete()
        {
            Producto producto;
            ProductoBusiness productoBusiness = new ProductoBusiness();
            producto = (Producto)dataGridView_Main.CurrentRow.DataBoundItem;
            productoBusiness.delete(producto.code);

        }

        private void button_test_Click(object sender, EventArgs e)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
           // MessageBox.Show(accesoDatos.rutaDatos());
            textBox_desc.Text = accesoDatos.rutaDatos();

        }

        private void pictureBox_Product_Click(object sender, EventArgs e)
        {

        }
    }
}
