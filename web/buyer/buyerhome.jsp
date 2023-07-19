`<%@page import="java.sql.ResultSet"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<jsp:include page="buyerheader.jsp" />
<br>
<br>
<div class="row" style="padding-left: 25%">
    <div class="col-md-3">
        <%
            try {
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                String Query = "select * from category";
                ResultSet rs = st.executeQuery(Query);
   //out.println("hello1");
        %>
        <label>Category</label>
        <select class="input-sm form-control w-sm inline v-middle" id="category_id" name="category_id"  onchange="displaySubcat()" >
            <option value="0">...SELECT....</option>
            <%
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("category_id")%>"> <%=rs.getString("category_name")%>  </option>
            <%
                    }
                } catch (Exception e) {
                    //out.println("error");
                }

            %> 
        </select>
    </div>
    <div class="col-md-3"  id="subcat">
       
        <label>Subcategory</label>
        <select class="input-sm form-control w-sm inline v-middle" id="subcategory_id" name="subcategory_id" >
            <option value="0">...SELECT....</option>
           
        </select>
    </div>                     
</div>
<div class="section">

    <!-- container -->
    <div class="container">

        <!-- row -->
        <div class="row" id="product">
            <!-- shop -->
            <%                try {
                    Connection con = JavaClass.getCon();
                    Statement st = con.createStatement();
                    String Query = "select * from product";
                    ResultSet rs = st.executeQuery(Query);
                           int Count = 0;

                    while (rs.next() && Count < 4) {
            %>
            <div class="col-md-3 col-xs-6" >

                <div class="shop">            
                    <div class="shop-img">
                        <img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="250" height="250">
                    </div>
                    <div class="shop-body">
                        <h3><%=rs.getString("product_name")%></h3>
                        <a href="buynow.jsp?id=<%=rs.getString("product_id")%>" class="cta-btn">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>

                </div>

            </div>
            <%
                                           Count++;
 }
                } catch (Exception e) {

                }
            %>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
        <!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">New Products</h3>

                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <%
                                    try {
                                        Connection con = JavaClass.getCon();
                                        Statement st = con.createStatement();
                                        String Query = "select * from product";
                                        ResultSet rs = st.executeQuery(Query);
                                        while (rs.next()) {
                                            double price = Double.parseDouble(rs.getString("price"));
                                            int offer = (int) Math.round(price + 275);

                                %>
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="250" height="250" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category"><h4><%=rs.getString("product_name")%></h4></p>

                                    <h4 class="product-price"><%=rs.getString("price")%><br><del class="product-old-price"><b><%= offer%></b></del></h4>


                                    </div>                        
                                </div>
                                <%
                                        }
                                    } catch (Exception e) {

                                    }
                                %>
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>

            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
</div>
<div id="subcat"></div>  
<script>
    function displaySubcat()
    {
//                                alert("a")
        var val = document.getElementById('category_id').value;
//                                alert(val)
        $.ajax({
            type: "POST",
            url: "getsubcategory.jsp",
            data: "id=" + val,
            success: function(data2)
            {
//                                        alert(data2);
                $("#subcat").html(data2);
            }
        })

    }
    
     function displayproduct()
    {
//                                alert("a")
        var val = document.getElementById('subcategory_id').value;
//                                alert(val)
        $.ajax({
            type: "POST",
            url: "getproduct.jsp",
            data: "id=" + val,
            success: function(data2)
            {
//                                        alert(data2);
                $("#product").html(data2);
            }
        })

    }




</script>
<div ></div>  
<script src="table/js/jquery.min.js"></script>
<jsp:include page="buyerfooter.jsp" />
