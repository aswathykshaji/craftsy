<%@page import="java.sql.ResultSet"%>
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
                //out.println("hello");
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();

                //                                    out.print(catid);
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
                    String subid = request.getParameter("subcategory_id");
                    String Query = "select * from product";
                    ResultSet rs = st.executeQuery(Query);
                    while (rs.next()) {
            %>
            <div class="col-md-4 col-xs-6" >

                <div class="shop">           
                    <div class="shop-img">
                        <img src='../admin/assets/img/<%=rs.getString("product_image1")%>' width="350" height="350">
                    </div>
                    <div class="shop-body">
                        <h3><%=rs.getString("product_name")%></h3>
                        <a href="viewmoreproduct.jsp?id=<%=rs.getString("product_id")%>" class="cta-btn">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>

                </div>

            </div>
            <%
                    }
                } catch (Exception e) {

                }
            %>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
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
