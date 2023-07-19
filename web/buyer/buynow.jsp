<%@page import="java.sql.ResultSet"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<jsp:include page="buyerheader.jsp" />

<style>
    .button2 {
        background-color: #d10024; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }

</style>
<!-- SECTION -->
<form action="request.jsp" method="post">
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <%
                    try {
                        String lid = (String) session.getAttribute("login_id");

                        String id = request.getParameter("id");
                        int num = Integer.parseInt(id);
                        Connection con = JavaClass.getCon();
                        Statement st = con.createStatement();
                        String sql = ("Select * from login l inner join sellerreg sr on l.login_id=sr.login_id inner join product p inner join category c on p.category_id=c.category_id inner join subcategory s on s.subcategory_id=p.subcategory_id where product_id='" + num + "'");
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {
                             double price = Double.parseDouble(rs.getString("price"));
                                            int offer = (int) Math.round(price + 275);
                %>
                <!-- Product main img -->

                <div class="col-md-6 col-md-push-2">
                    <div id="product-main-img" >
                        <div>
                            <img src="../admin/assets/img/<%=rs.getString("product_image1")%>" width="300" height="300">
                        </div> 
                    </div>
                </div>
                <div class="col-md-5"><br>
                    Product details <br><br>
                    <div class="product-details">
                        <h2 class="product-name"><%=rs.getString("product_name")%></h2>
                        <div>

                            <input type="hidden" name="sellerid" id="sellerid" value="<%=rs.getString("seller_id")%>" >
                            <input type="hidden" name="productid" id="productid" value="<%=rs.getString("product_id")%>" >  
                            <input type="hidden" name="subcat" id="subcat" value="<%=rs.getInt("subcategory_id")%>" > 
                            <input type="hidden" name="sellerid" id="sellerid" value="<%=rs.getInt("seller_id")%>" > 


                            <input type="hidden" id="price1" value="<%=rs.getString("price")%>" >
                            <h3 class="product-price" id="price"><p>&#8377;<%=rs.getString("price")%></p> <del class="product-old-price"><%=offer%></del></h3>
                            <span class="product-available">In Stock</span>
                        </div>

                        <p><%=rs.getString("description")%>.</p>
                        <%
                            try {

                                String sql1 = ("Select * from login l inner join customerreg cr on l.login_id=cr.login_id where cr.login_id='" + lid + "'");
                                ResultSet rs1 = st.executeQuery(sql1);
                                while (rs1.next()) {
                        %>
                        <input type="hidden" name="customerid" id="customerid" value="<%=rs1.getInt("customer_id")%>" > 

                        <%                     }
                            } catch (Exception e) {

                            }
                        %>
                        <div class="add-to-cart">
                            <div class="qty-label">
                                Qty
                                <div>
                                    <input type="number" onchange="total()" name="qty" id="qty" min="1"oninput="this.value=Math.abs(this.value)">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row"style="padding-left:20%">

                    <div class="col-md-12">
                        <div class="col-lg-7" ><h3>PRICE DETAILS</h3></div>

                        <table border="1" width="80%" >
                            <tr>
                                <th style="width:50%">Total</th>
                                <th>Price</th>
                            </tr>
                            <tr>
                                <td>Amount(&#8377;)</td>
                                <td><input class="form-control" id="totalprice" type="number" readonly> </td>
                            </tr>
                            <tr>
                                <td>Delivery Charge</td>
                                <td><p>&#8377; 50 </p></td>
                            </tr>
                            <tr>
                                <td>Total Price(&#8377;)</td>
                                <td><input class="form-control" name="totalprice1" id="totalprice1" type="number" readonly></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="padding-left:47%">
        <button class="button2" type="submit"> Request</button>
        <!--<a href="checkout.html" class="boxed-btn black">Check Out</a>-->
    </div>

</form>

<%                     }
    } catch (Exception e) {

    }
%>
</div>

<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <%
                try {
                    String id1 = request.getParameter("subcat");
                    int num = Integer.parseInt(id1);
                    Connection con = JavaClass.getCon();
                    Statement st = con.createStatement();
                    String sql = ("Select * from product p inner join category c on p.category_id=c.category_id inner join subcategory s on s.subcategory_id=p.subcategory_id where p.subcategory_id='" + num + "'");
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {
            %>
            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Related Products</h3>
                </div>
            </div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="../admin/assets/img/<%=rs.getString("product_image1")%>" width="300" height="300">
                        <div class="product-label">
                            <span class="sale">-30%</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category"><%=rs.getString("product_name")%></p>
                        <h4 class="product-price"><p>&#8377;<%=rs.getString("price")%></p> <del class="product-old-price">$990.00</del></h4>
                        <div class="product-rating">
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->

            <%                     }
                } catch (Exception e) {

                }
            %>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->
<script>
    function total() {
        var val = document.getElementById('qty').value;
//        alert(val);
        var price = document.getElementById('price1').value;
//        alert(price);
        var total = val * price;
        document.getElementById('totalprice').value = total;
        grandtotal = total + 50;
        document.getElementById('totalprice1').value = grandtotal;
//        alert(grandtotal);
    }
</script>



<jsp:include page="buyerfooter.jsp" />
