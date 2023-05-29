<jsp:include page="adminindex.jsp"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Category Registration Form</title>
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
				<form action="categoryaction.jsp"method="post" enctype="multipart/form-data">
					<h3>Category Registration </h3>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Category Name: </label>
							<div class="form-holder">
								<i class="zmdi zmdi-account-o"></i>
								<input type="text" class="form-control"name="category_name">
							</div>
						</div>
						<div class="form-wrapper">
							<label for="">Category Image: </label>
							`
								<input type="file"  name="category_image">
							
						</div>
					</div>
					
					
					<div class="form-end">
						<div class="button-holder" >
							<button class="button">Register Now</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		
	</body>
</html>