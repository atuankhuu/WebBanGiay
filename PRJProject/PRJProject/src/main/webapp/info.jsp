<%-- 
    Document   : info
    Created on : Jun 23, 2023, 2:03:23 AM
    Author     : Admin
--%>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    </head>
    <body>

        <%
            if (session.getAttribute("quantri") == null) {
                Cookie[] cookies = request.getCookies();
                boolean foundCookie = false;
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("quantri")) {
                            foundCookie = true;
                            break;
                        }
                    }
                }
//                if (!foundCookie && session.getAttribute("quantri") == null) {
//                    response.sendRedirect("/listProduct");
//                }
            }
            Product p = (Product) session.getAttribute("InfoProduct");
        %>

        <div class="container mt-4">
            <h1>Product Details</h1>
            <div class="row">
                <div class="col-md-4">
                    <img src="<%=  p.getProduct_pic()  %>" class="img-fluid" alt="Product Image">
                </div>
                <div class="col-md-8">
                    <table id="example">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Color</th>
                                <th>Quan</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Des</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <th><%= p.getCategory_id() %></th>
                                <td><p><%= p.getProduct_name() %></p></td>
                                <td><p><%= p.getProduct_color() %></p></td>
                                <td><p><%= p.getStock_quantity() %></p></td>
                                <td><p><%= p.getPrice() %></p></td>
                                <td><p><%= p.getCategory_id() %></p></td>
                                <td><textarea rows="4"><%= p.getDes() %></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="/PRJProject/manager">
                        <button type="button" class="btn btn-primary bg-primary">Back</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
