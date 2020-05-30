<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="Tienda.Tienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Tienda online</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-8" style="background-color:forestgreen; padding-bottom:200px">
                    <h1 style="text-align:center; position:relative; top:180%">TIENDA ONLINE</h1>
                </div>


            </div>
            <div class="row"  style="position:relative; top:100px">
                <div class="col-sm">
                    <h4 style="text-align:center; position:relative; right:30px">Buscar</h4>
                    <div>
                        <asp:DropDownList style="padding-right:60px; " ID="DropDownListby" runat="server" OnSelectedIndexChanged="updatefilter" AutoPostBack="true"></asp:DropDownList>
                        <asp:DropDownList style="padding-right:60px"  ID="DropDownListfilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="filterdata" OnDataBinding="filterdata"></asp:DropDownList>
                        <asp:TextBox style="width:280px" ID="TextBoxsearch" runat="server" OnTextChanged="filterdata"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm">
                    
                </div>
                <div class="col-sm-4" style="background-color:red; border:solid">
                    <h4>CARRITO</h4>
                    <%  float total = 0;
                        string texto = "";
                        foreach (Dominio.Compra item in chart)
                        {
                            total += item.price * item.amount;
                            texto += item.name + "cantidad " + item.amount + Environment.NewLine;
                        } %>
                    <p class="overflow-auto"><%=texto %></p>

                   
                    <% if (total > 0)
                    {  %>
                    <p>precio total: <%=total %></p>

                    <%} %>
                    <a href="Detalle.aspx">ir a carrito</a>
                </div>

            </div>
            <div class="row row-cols-1 row-cols-md-4"  style="position:relative; top:100px">

                <% foreach (Dominio.Producto product in products)
                    {
                %>

                <div class="col mb-4">
                    <div class="card">
                        <img src="<% = product.imagen %>" class="card-img-top" alt="..." height="200" width="80">
                        <div class="card-body" style="height: 200px">
                            <h5 class="card-title" style="display: flex"><% = product.name %></h5>
                            <p class="card-subtitle">$<% =product.precio %> </p>
                            <p class="card-text" style="font-size: smaller"><% =product.desc %></p>
                        </div>
                        <div class="card-footer">

                            <a href="<%="?ART="+product.code %> ">comprar</a>
                        </div>
                    </div>
                </div>






                <%} %>
            </div>
        </div>

    </form>
</body>

</html>
