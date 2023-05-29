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
        <%
            try {
                String id = request.getParameter("id");
                int num = Integer.parseInt(id);
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                String sql = ("Select * from subcategory where subcategory_id='" + num + "'");
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {

        %>
        <div class="wrapper" style="background-image: url('registration/images/image1.jpg');">
            <div class="inner">

                <form action="editsubcategoryaction.jsp"method="post" >



                    <h3>Category Registration </h3>
                    <div class="form-group">
                        <div class="form-wrapper">
                            <label for="">Category: </label>
                            <div class="form-holder select">
                                <select name="category" id="category_id" class="form-control">
                                    <option disabled value=""><%=rs.getString("category_id")%></option>
                                    <!--									<option value="united kingdom"></option>
                                                                                                            <option value="viet nam"></option>-->
                                    <%                                            try {

                                            String Query1 = "select * from category";
                                            ResultSet rs1 = st.executeQuery(Query1);
                                            while (rs1.next()) {
                                    %>
                                    <option value="<%=rs1.getString("category_id")%>"><%=rs1.getString("category_name")%></option>
                                    <%
                                            }
                                        } catch (Exception e) {
                                        }
                                    %>
                                </select>
                               
                            </div>
                        </div>

                        <%
                            try {
                                String sql2 = ("Select * from subcategory where subcategory_id='" + num + "'");
                                ResultSet rs2 = st.executeQuery(sql2);
                                if (rs2.next()) {

                        %>
                        <div class="form-wrapper">


                            <label for="">Subcategory Name: </label>
                            <div class="form-holder">
                                <i class="zmdi zmdi-account-o"></i>
                                <input type="text" class="form-control"name="subcategory_name"value="<%=rs2.getString("subcategory_name")%>" c>
                            </div>
                        </div>

                    </div>


                    <div class="form-end">
                        <div class="button-holder" >
                            <button class="button">Update</button>
                            <input type="hidden" name="id" value="<%=rs2.getString("subcategory_id")%>">
                        </div>

                    </div>
                         <%
                                            }
                                        } catch (Exception e) {
                                            out.println("cat");
                                        }
                                    %>

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
