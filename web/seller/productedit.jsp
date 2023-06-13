<jsp:include page="sellerheader.jsp" />

<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Product Edit</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="register/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="register/css/style.css">
    </head>

    <body>

        <div class="wrapper" style="background-image: url('register/images/bg-registration-form-1.jpg');">
            <div class="inner">
                <div class="image-holder">
                    <img src="register/images/registration-form-1.jpg" alt="" size="100%">
                </div>
                <form action="producteditaction.jsp"method="post">

                    <h3>Product Edit</h3>
                    <%
                        try {
                            String id = request.getParameter("id");
                            int num = Integer.parseInt(id);
                            Connection con = JavaClass.getCon();
                            Statement st = con.createStatement();
                            String Query = "select * from product p inner join category c on p.category_id=c.category_id inner join subcategory s on s.subcategory_id=p.subcategory_id where product_id='" + num + "'";
                            ResultSet rs = st.executeQuery(Query);
                            while (rs.next()) {
                                String subcat_id = rs.getString("subcategory_id");
                    %>
                    <div class="form-wrapper">
                        <option value="viet nam"></option>                      
                        <label for="">Category: </label>
                        <div class="form-holder select">
                            <select name="category" id="category_id" class="form-control" onchange="displaySubcat()">
                                <option disabled selected value=""><%=rs.getString("category_name")%></option>							
                                <%
                                    try {

                                        String Query1 = "select * from category";
                                        ResultSet rs2 = st.executeQuery(Query1);
                                        while (rs2.next()) {
                                %>
                                <option value="<%=rs2.getString("category_id")%>"><%=rs2.getString("category_name")%></option>
                                <%
                                        }
                                    } catch (Exception e) {

                                    }
                                %>
                            </select>
                        </div>

                    </div>
                    <div class="form-wrapper">
                        <label for="">Subcategory: </label>
                        <div class="form-holder select" id="subcat">
                            <select name="subcategory" id="subcategory_id" class="form-control">

                                <%
                                    try {

                                        String Query1 = "select * from subcategory where subcategory_id='" + subcat_id + "'";
                                        ResultSet rs2 = st.executeQuery(Query1);
                                        while (rs2.next()) {
                                %>
                                <option selected value=""><%=rs2.getString("subcategory_name")%></option>

                                <%
                                        }
                                    } catch (Exception e) {

                                    }
                                %>  

                            </select>

                        </div>
                    </div>
                    <div class="form-wrapper">
                        <label for="">Product: </label>

                        <%
                            try {
                                String id1 = request.getParameter("id");
                                int num1 = Integer.parseInt(id);
                                String productname = ("SELECT * from product p INNER JOIN category c on p.category_id=c.category_id INNER JOIN subcategory s ON p.subcategory_id = s.subcategory_id  WHERE product_id ='" + num1 + "'");
                                ResultSet name = st.executeQuery(productname);
                                while (name.next()) {
                        %>
                        <input type="text" placeholder="Product Name" value="<%=name.getString("product_name")%>" name="name" class="form-control">
                        <%
                                }
                            } catch (Exception e) {

                            }
                        %> 
                    </div>


                    <div class="form-wrapper">
                        <label for="">Product Description: </label>

                        <%
                            try {
                                String id1 = request.getParameter("id");
                                int num1 = Integer.parseInt(id);
                                String productname = ("SELECT * from product p INNER JOIN category c on p.category_id=c.category_id INNER JOIN subcategory s ON p.subcategory_id = s.subcategory_id WHERE product_id ='" + num1 + "'");
                                ResultSet desc = st.executeQuery(productname);
                                while (desc.next()) {
                        %>
                        <input type="text" placeholder="Product Description" name="description" class="form-control" value="<%=desc.getString("description")%>">
                        <%
                                }
                            } catch (Exception e) {

                            }
                        %> 
                    </div>


                    <div class="form-wrapper">
                        <label for="">Product Stock: </label>

                        <%
                            try {
                                String id1 = request.getParameter("id");
                                int num1 = Integer.parseInt(id);
                                String productname = ("SELECT * from product p INNER JOIN stock s ON p.quantity=s.stock WHERE p.product_id ='" + num1 + "'");
                                ResultSet stock = st.executeQuery(productname);
                                while (stock.next()) {
                        %>

                        <input type="text" placeholder="Product Stock" name="quantity" class="form-control" value="<%=stock.getString("quantity")%>">
                        <%
                                }
                            } catch (Exception e) {

                            }
                        %> 
                    </div>
                    <div class="form-wrapper">
                                                                        <label for="">Product Rate: </label>

                        <%
                            try {

                                String Queryv = ("SELECT * from product p INNER JOIN stock s ON p.quantity=s.stock WHERE p.product_id ='" + num + "'");
                                ResultSet price = st.executeQuery(Queryv);
                                if (price.next()) {

                        %>
                        <input type="text" placeholder="Price" name="price" class="form-control"value="<%=price.getString("price")%>">
                        <%
                                }
                            } catch (Exception e) {

                            }
                        %>
                    </div>

                    <button>Update
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>
                    <%
                            }
                        } catch (Exception e) {

                        }
                    %>
                </form>
            </div>
        </div>

    </body>
</html>
<div id="subcat"></div>  
<script>
    function displaySubcat()
    {
//                                alert("a")
        var val = document.getElementById('category_id').value;
//                                alert(val)
        $.ajax({
            type: "POST",
            url: "getsubcat.jsp",
            data: "id=" + val,
            success: function(data2)
            {
//                                        alert(data2);
                $("#subcat").html(data2);
            }
        })

    }


</script>
<script src="table/js/jquery.min.js"></script>

<jsp:include page="sellerfooter.jsp" />
