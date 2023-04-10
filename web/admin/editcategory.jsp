<%@page import="craftpackage.JavaClass"%>
<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*"%> 


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Category Edit</title>
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
<%
    try {
        String id = request.getParameter("id");
        int num = Integer.parseInt(id);
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();

        String sql = ("Select * from category where category_id='" + num + "'");
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {

%>
        <div class="wrapper" style="background-image: url('registration/images/image1.jpg');">
            <div class="inner">

                <form action="editcategoryaction.jsp"method="post" >



                    <h3>Category Registration </h3>
                    <div class="form-group">
                        <div class="form-wrapper">


                            <label for="">Category Name: </label>
                            <div class="form-holder">
                                <i class="zmdi zmdi-account-o"></i>
                                <input type="text" class="form-control"name="category_name"value="<%=rs.getString("category_name")%>" c>
                            </div>
                        </div>
                        <!--						<div class="form-wrapper">
                                                                                <label for="">Category Image: </label>
                                                                                `
                                                                                        <input type="file"  name="category_image"value="" >
                                                                                
                                                                        </div>-->
                    </div>


                    <div class="form-end">
                        <div class="button-holder" >
                            <button class="button">Update</button>
                            <input type="hidden" name="id" value="<%=rs.getString("category_id")%>">
                        </div>

                    </div>

                </form>
            </div>
        </div>
                        <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
    </body>
</html>
