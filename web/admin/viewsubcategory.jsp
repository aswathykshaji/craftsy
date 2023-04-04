<jsp:include page="adminindex.jsp"/>
<%@page import="java.sql.*"%>
<%@page import="craftpackage.JavaClass"%>
<% int slno = 0;%>  
<!doctype html>
<html lang="en">
  <head>
  	<title>Table 03</title>
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
                                                <th>Category Id</th>
                                                <th>Subcategory Id</th>
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
                            String Query = "select * from subcategory";
                            ResultSet rs = st.executeQuery(Query);
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%=++slno%></td>
                         <td><%=rs.getString("Category_id")%></td>
                         <td><%=rs.getString("subcategory_id")%></td>
                         <td><%=rs.getString("subcategory_name")%></td>
                        <td><img src='../admin/assets/img/<%=rs.getString("subcategory_image")%>'width="100" height="100"></td>
                       <td><a href="subcategoryedit.jsp?a=<%=rs.getString("subcategory_id")%>"><button type="button" class="btn btn-dark btn-icon-text">Edit</button></a>
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
                        out.println("exception");
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
  <script src="table/js/main.js"></script>

	</body>
</html>

