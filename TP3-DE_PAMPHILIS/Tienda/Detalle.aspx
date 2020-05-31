<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Tienda.Detalle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>
<body style="background-color: aquamarine">
    <form id="form1" runat="server">
        <div class="jumbotron jumbotron-fluid" style="background-image: url(images/topbackground.png); height: 260px">
            <div class="container">
                <div class="row">

                    <div class="col-6" style="text-align: center;">

                        <h1 class="display-4">Carrito</h1>
                        <p class="lead">A un solo paso de tener lo que desea.</p>
                    </div>
                    <div class="col-2">

                        <asp:Image ImageUrl="~/images/chart.png" runat="server" Style="height: 180px; width: 340px; overflow: visible;" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <%  float total = 0;
                foreach (Dominio.Compra item in items)
                {
                    total += item.amount * item.price; %>
            <div class="row" style="max-height: 50px; text-align: center">

                <div class="col-3" style="border: solid; border-width: thin; border-color: black; text-align: left; background-color: white">
                    <p style="font-size: smaller"><%=item.name %></p>

                </div>
                <div class="col-5" style="border: solid; border-width: thin; text-align: left; background-color: white">
                    <p style="font-size: smaller"><%="Precio unitario: $"+item.price +" - cantidad: " +item.amount  + "- Subtotal: $"+item.amount*item.price %></p>
                </div>
                <div class="col-2" style="border: solid; border-width: thin; text-align: center; background-color: white">
                    <a style="font-size: smaller" href="?del=<%=item.code %>">Eliminar</a>
                    <a style="font-size: smaller" href="?add=<%=item.code %>">Agregar </a>
                    <a style="font-size: smaller" href="?take=<%=item.code %>">Quitar</a>
                </div>
            </div>
            <%} %>
            <div class="row">
                <div class="col-6"></div>
                <div class="col-2" style="border: solid; border-width: thin; background-color: white; text-align: left">
                    <p><%="Total: $" + total %> </p>
                </div>
                <div class="col-2" style="border: solid; border-width: thin; background-color: white; text-align: center">
                    <a href="#">pagar</a>
                    <a href="Tienda.aspx?clear=true">vaciar</a>
                    <a href="Tienda.aspx">volver</a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
