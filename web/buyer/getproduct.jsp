<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String subcategory_id = request.getParameter("id");
        String Query = "select * from product where subcategory_id='" + subcategory_id + "'";
//        out.println(Query);
        ResultSet rs = st.executeQuery(Query);
        while (rs.next()) {
    %>

<div class="col-md-4 col-xs-6">
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
    }}
                        catch(Exception e)
                        {
                            
}%>
