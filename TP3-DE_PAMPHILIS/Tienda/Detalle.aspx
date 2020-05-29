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
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    Detalle de compra
                </div>
                <div class="col">
                    3 of 3
                </div>
            </div>
            <div class="row">
                <div class="col">
                    1 of 3
                </div>
                <div class="col-15">


                    <%foreach (Dominio.Compra item in items)

                        { %>
                    <div class="row">
                        <div class="col-sm-40">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%=item.name %></h5>
                                    <p class="card-text"><%= "Cantidad " + item.amount + " Precio unitario $" + item.price  %></p>
                                    <a href="?del=<%=item.code %>" class="btn btn-primary">Eliminar</a>
                                    <a href="?add=<%=item.code %>" class="btn btn-primary">Agregar </a>
                                    <a href="?take=<%=item.code %>" class="btn btn-primary">Quitar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%} %>
                </div>
                <div class="col">
                    1 of 3
                </div>
            </div>
        </div>
    </form>
</body>
</html>
