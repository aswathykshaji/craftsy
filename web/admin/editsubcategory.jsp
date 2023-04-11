<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Registration Form</title>
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
        while (rs.next()) {

%>
		<div class="wrapper" style="background-image: url('registration/images/image1.jpg');">
			<div class="inner">
				<form action="subcategoryaction.jsp"method="post">
					<h3>Subcategory Update</h3>
                                        <div style="padding-left:15%;">
					<div class="form-group-md">
						<div class="form-wrapper">
							<label for="">Category: </label>
							<div class="form-holder select">
								<select name="category" id="subcategory_id" class="form-control">
									<option value="united states">--select--</option>
<!--									<option value="united kingdom"></option>
									<option value="viet nam"></option>-->
<%
try{
     Connection con=JavaClass.getCon();
       Statement stmt=con.createStatement();
       String Query="select * from subcategory";
       ResultSet rst=stmt.executeQuery(Query);
       while(rs.next()){
           %>
           <option value="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option>
           <%
       }
}catch(Exception e){
    
}
%>
								</select>
								<i class="zmdi zmdi-pin"></i>
							</div>
						</div>
                                        </div>
                                        <div class="form-group-md">
						<div class="form-wrapper">
							<label for="">Subcategory Name</label>
							<div class="form-holder">
								<i style="font-style: normal; font-size: 15px;"></i>
                                                                <input type="text" class="form-control" name="subcategory_name">
							</div>
						</div>
					</div>
<!--					<div class="form-group-md">
						<div class="form-wrapper">
							<label for="">Subcategory Image:</label>
							
								<input type="file"  placeholder="" name="subcategory_image">
							
						</div>
						
					</div>-->
					
					<div class="form-end">
						
						<div class="button-holder">
                                                    <button class="button">Update</button>
						</div>
						
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
