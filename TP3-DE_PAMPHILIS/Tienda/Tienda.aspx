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

    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <h1 style="text-align: center">Tienda online </h1>
            </div>
            <div class="col-sm-4">CARRITO</div>
        </div>
        <div class="row">
            <div class="col-sm">
                <div class="card-deck">
                    <div class="card">
                        <asp:Image ID="Image1" runat="server" class="card-title" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name1" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>

                                <asp:Label ID="Desc1" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image2" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name2" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>

                                <asp:Label ID="Desc2" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image3" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name3" runat="server" Text="Label" CssClass="card-title"  ></asp:Label>
                            <div>
                                <asp:Label ID="Desc3" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image4" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name4" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>
                                <asp:Label ID="Desc4" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                </div>
                                <div class="card-deck">
                    <div class="card">
                        <asp:Image ID="Image5" runat="server" class="card-title" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name5" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>

                                <asp:Label ID="Desc5" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image6" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name6" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>

                                <asp:Label ID="Desc6" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image7" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name7" runat="server" Text="Label" CssClass="card-title"  ></asp:Label>
                            <div>
                                <asp:Label ID="Desc7" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                    <div class="card">
                        <asp:Image ID="Image8" runat="server" class="card-img-top" AlternateText="Placeholder" />
                        <div class="card-body">
                            <asp:Label ID="Name8" runat="server" Text="Label" CssClass="card-title"></asp:Label>
                            <div>
                                <asp:Label ID="Desc8" runat="server" Text="Label" CssClass="card-text"></asp:Label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                </div>


            </div>



        </div>
    </div>
</body>
</html>
