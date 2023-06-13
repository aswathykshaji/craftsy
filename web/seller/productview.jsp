<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="sellerheader.jsp" />
<% int slno = 0;%>

<!doctype html>
<html lang="en">
    <head>
        <title>Craftsy</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="view1/css/style.css">

    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Craftsy</h2>
                    </div>
                </div>
                <br>


                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center mb-4">Your Products</h4>
                        <br>
                        <div class="table-wrap">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: #fe4c50;">
                                        <th>Sl. No</th>     
                                        <th>Product Image</th>
                                        <th>Cateory</th>
                                        <th>Subcategory</th>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>Stock</th>	
                                        <th>Price</th>
                                        <th>Edit</th>
                                        <th>Delete</th>

                                    </tr>
                                </thead>
                                <%
                                    try {
                                        //out.println("hello");
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String sellerid = (String) session.getAttribute("login_id");

                                        //                                    out.print(catid);
                                        String Query = "select * from product p inner join sellerreg s on p.seller_id=s.login_id inner join category c on p.category_id=c.category_id inner join  subcategory sub on p.subcategory_id=sub.subcategory_id where login_id='" + sellerid + "'";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {

                                %>
                                <tbody>
                                    <tr>
                                        <th><%=++slno%></th>
                                        <td><img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="100" height="60"></td>
                                        <td><%=rs.getString("category_name")%></td>
                                        <td><%=rs.getString("subcategory_name")%></td>
                                        <td><%=rs.getString("product_name")%></td>
                                        <td><%=rs.getString("description")%></td>
                                        <td><%=rs.getString("quantity")%></td>
                                        <td><%=rs.getString("price")%></td>

                                        <td><a href="productedit.jsp?id=<%=rs.getString("product_id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
  </svg></a></td>	
                                        <td><a href="productdelete.jsp?id=<%=rs.getString("product_id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                            </svg></a></td>

                                    </tr>

                                    <%
                                            }
                                        } catch (Exception e) {
                                            //out.println("error");
                                        }

                                    %> 
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <script src="view1/js/jquery.min.js"></script>
        <script src="view1/js/popper.js"></script>
        <script src="view1/js/bootstrap.min.js"></script>
        <script src="view1/js/main.js"></script>

    </body>
</html>

<jsp:include page="sellerfooter.jsp" />
