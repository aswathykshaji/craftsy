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

		<div class="wrapper" style="background-image: url('registration/images/image1.jpg');">
			<div class="inner">
				<form action="locationaction.jsp"method="post">
					<h3>Location Registration </h3>
					<div class="form-group-lg">
						<div class="form-wrapper">
							<label for="">District:</label>
							<div class="form-holder select">
								<select name="district_id" id="district_id" class="form-control">
									<option value="united states">--select--</option>
<!--									<option value="united kingdom"></option>
									<option value="viet nam"></option>-->
<%
try{
     Connection con=JavaClass.getCon();
       Statement st=con.createStatement();
       String Query="select * from district";
       ResultSet rs=st.executeQuery(Query);
       while(rs.next()){
           %>
           <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
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
                                        <div class="form-group-lg">
						<div class="form-wrapper">
							<label for="">Location</label>
							<div class="form-holder">
								<i style="font-style: normal; font-size: 15px;"></i>
								<input type="text" class="form-control" name="location_name">
							</div>
						</div>
					</div>
	
					<div class="form-end">
						
						<div class="button-holder">
							<button class="button">Register Now</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>