<%@page import="craftpackage.JavaClass"%>
<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*"%> 


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Subcategory Edit</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="registration/css/style.css">
        <style>
            .button {background-color: #A70D2A;}
        </style>
    </head>

    <body>
       
        <div class="wrapper" style="background-image: url('registration/images/image1.jpg');">
            <div class="inner">

                <form action="editsubcategoryaction.jsp" method="post">

                    <h3>Category Registration</h3>

                    <%
                    try {
                        String id = request.getParameter("id");
                        int num = Integer.parseInt(id);
                        Connection con = JavaClass.getCon();
                        Statement st = con.createStatement();
                        String sql = "SELECT * FROM subcategory s INNER JOIN category c ON s.category_id = c.category_id WHERE subcategory_id='" + num + "'";
                        ResultSet rs = st.executeQuery(sql);
                        if (rs.next()) {
                            String categoryId = rs.getString("category_id");
                            String categoryName = rs.getString("category_name");
                            String subcategoryName = rs.getString("subcategory_name");
                    %>
                    
                    <div class="form-group">
                        <div class="form-wrapper">
                            <label for="category_id">Category:</label>
                            <div class="form-holder select"> 
                                <select name="category" id="category_id" class="form-control">
                                    <option value="<%=categoryId%>"><%=categoryName%></option>								
                                </select>
                            </div>
                        </div>

                        <div class="form-wrapper">
                            <label for="subcategory_name">Subcategory Name:</label>
                            <div class="form-holder">
                                <i class="zmdi zmdi-account-o"></i>
                                <input type="text" class="form-control" name="subcategory_name" value="<%=subcategoryName%>">
                            </div>
                        </div>
                    </div>

                    <div class="form-end">
                        <div class="button-holder">
                            <button class="button">Update</button>
                            <input type="hidden" name="id" value="<%=rs.getString("subcategory_id")%>">
                        </div>
                    </div>
                    
                    <% } }
                    catch(Exception e){
                            
        }%>
                </form>
            </div>
        </div>

    </body>
</html>