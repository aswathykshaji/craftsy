<%@page import="java.sql.*"%>
<%@page import="craftpackage.JavaClass"%>
<% int slno = 0;%>  
<!doctype html>
<html lang="en">
  <head>
  	<title>subcategory</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="table/css/style.css">

	</head>
	<body>
            
	<section class="ftco-section">
            
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="text-center mb-4">Subcategory View</h4>
					<div class="table-wrap">
						<table class="table">
					    <thead class="thead-primary">
					      <tr>
					        <th>SL. NO</th>	
					        <th>Subcategory Name</th>
					        <th>Subcategory Image</th>
					        <th>Edit</th>
					        <th>Delete</th>

					      </tr>
					    </thead>
					    <tbody>
                                               <%
                        try {
                            Connection con = JavaClass.getCon();
                            Statement st = con.createStatement();
                           String catid=request.getParameter("id");
// out.print(catid);
 String Query="select * from subcategory where category_id='"+catid+"'";
// String Query1="select * from subcategory where category_id='1'";
//  out.println(Query);
 ResultSet rs=st.executeQuery(Query);
 // out.println("hello1");

 while(rs.next()){
                    %>
                    <tr>
                        <td><%=++slno%></td>
                         <td><%=rs.getString("subcategory_name")%></td>
                        <td><img src='../admin/assets/img/<%=rs.getString("subcategory_image")%>'width="100" height="100"></td>
                       <td><a href="editsubcategory.jsp?id=<%=rs.getString("subcategory_id")%>"><button type="button" class="btn btn-dark btn-icon-text">Edit</button></a>
                       </td><td> <a onclick="return confirm('Do u want to delete?')" href="subcategorydelete.jsp?id=<%=rs.getString("subcategory_id")%>">  <button type="button" class="btn btn-dark btn-icon-text" >
                                                    Delete
                                                    <i class="mdi mdi-delete"></i>       </a>                   
                                            </button></td>
                                               

                <!--<button type="button" class="btn btn-dark btn-icon-text">Edit</button></a>-->
                <!--<button type="button" class="btn btn-dark btn-icon-text">Delete</button></a>-->



                </tr>
                <%
 }
 } catch (Exception e) {
 }

%>

					    </tbody>
					  </table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="table/js/jquery.min.js"></script>
  <script src="table/js/popper.js"></script>
  <script src="table/js/bootstrap.min.js"></script>

	</body>
</html>





