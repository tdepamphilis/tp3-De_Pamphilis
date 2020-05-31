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

<body style="background-color: cadetblue">
    <form id="form1" runat="server">
        <div class="jumbotron jumbotron-fluid" style="background-image:url(images/topbackground.png)">
            <div class="container">
                <h1 class="display-4">Tecno store</h1>
                <p class="lead">Siempre con vos.</p>
            </div>
        </div>
        <div class="container" style="background-color:white; border-width:medium; border:solid">
            <h1 style="text-align:center; position:relative; top:50px">Nuestros productos</h1>
            <div class="row" style="position: relative; top: 100px">
                
                <div class="col-sm">                    
                    <div class="row">
                        <div class="col text-center">
                            <asp:DropDownList Style="width: inherit; text-align: center" CssClass="form-control" ID="DropDownListby" runat="server" OnSelectedIndexChanged="updatefilter" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col text-center">
                            <asp:DropDownList Style="width: inherit; text-align: center" CssClass="form-control" ID="DropDownListfilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="filterdata" OnDataBinding="filterdata"></asp:DropDownList>
                        </div>

                        <div class="col-sm-5 text-center">

                            <asp:TextBox Style="width: 100%" CssClass="form-control" ID="TextBoxsearch" runat="server" OnTextChanged="filterdata"></asp:TextBox>

                        </div>
                        <div class="col-sm-2 text-center">

                            <asp:Button CssClass="btn btn-primary" type="button" ID="Button1" runat="server" Text="Buscar" OnClick="filterdata" Style="width: 100%" />

                        </div>

                    </div>
                </div>


                <div class="col-sm-4" style="background-color: aqua; border: solid">
                    <div class="container">

                        <div class="row">
                            <div class="col-sm text-center">
                                <%  float total = 0;
                                    string texto = " productos en carito.";
                                    foreach (Dominio.Compra item in chart)
                                    {
                                        total += item.amount;
                                    } %>
                                <p style="position: relative; top: 8px"><%=total + texto %></p>
                            </div>
                            <div class="col-sm-5 text-center">
                                <a class="btn btn-secondary btn-sm" style="position: relative; top: 4px" href="Detalle.aspx">ir a carrito</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-4" style="position: relative; top: 100px">

                <% foreach (Dominio.Producto product in products)
                    {
                %>

                <div class="col mb-4">
                    <div class="card">
                        <img src="<% = product.imagen %>" class="card-img-top" alt="..." height="200" width="80">
                        <div class="card-body" style="height: 150px">
                            <h5 class="card-title" style="display: flex"><% = product.name %></h5>
                            <p class="card-subtitle">$<% =product.precio %> </p>
                            <p class="card-text" style="font-size: smaller"><% =product.desc %></p>
                        </div>
                        <div class="card-footer text-center">

                            <a class="btn btn-dark" href="<%="?ART="+product.code %> ">comprar</a>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            <div class="row" style="height:90px"></div>
        </div>

    </form>
</body>

</html>
