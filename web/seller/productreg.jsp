<jsp:include page="sellerheader.jsp" />

<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Product Registration</title>
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
                    <img src="register/images/registration-form-1.jpg" alt="">
                </div>
                <form action="productregaction.jsp"method="post" enctype="multipart/form-data">
                    <h3>Product Registration</h3>
                    <div class="form-wrapper">
                        <label for="">Category: </label>
                        <div class="form-holder select">
                            <select name="category" id="category_id" class="form-control" onchange="displaySubcat()">
                                <option value="united states">--select--</option>
                                <!--									<option value="united kingdom"></option>
                                                                                                        <option value="viet nam"></option>-->
                                <%
                                    try {
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String Query = "select * from category";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
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
                                <option value="subcategory">--select--</option>


                            </select>

                        </div>
                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder="Product Name" name="name" class="form-control">
                    </div>

                    <div class="form-wrapper">
                        <input type="file" name="product_image1" class="form-control">

                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder="Product Description" name="description" class="form-control">
                    </div>

                    <div class="form-wrapper">
                        <input type="text" placeholder="Product Stock" name="quantity" class="form-control">
                    </div>
                    <div class="form-wrapper">
                        <input type="text" placeholder="Price" name="price" class="form-control">
                    </div>

                    <button>Register
                        <i class="zmdi zmdi-arrow-right"></i>
                    </button>
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
