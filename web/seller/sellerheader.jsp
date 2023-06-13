<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Craftsy</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>

    <body>
        <style>
            .search-container {
                background: #fff;
                height: 30px;
                border-radius: 30px;
                padding: 10px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                transition: 0.8s;
                /*box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
                  inset -7px -7px 10px 0px rgba(0,0,0,.1),
                 7px 7px 20px 0px rgba(0,0,0,.1),
                 4px 4px 5px 0px rgba(0,0,0,.1);
                 text-shadow:  0px 0px 6px rgba(255,255,255,.3),
                            -4px -4px 6px rgba(116, 125, 136, .2);
                text-shadow: 2px 2px 3px rgba(255,255,255,0.5);*/
                box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, 0.3),
                    -4px -4px 6px 0 rgba(116, 125, 136, 0.2),
                    inset -4px -4px 6px 0 rgba(255, 255, 255, 0.2),
                    inset 4px 4px 6px 0 rgba(0, 0, 0, 0.2);
            }

            .search-container:hover > .search-input {
                width: 100px;
            }

            .search-container .search-input {
                background: transparent;
                border: none;
                outline: none;
                width: 100px;
                font-weight: 500;
                font-size: 16px;
            }

            .search-container .search-btn .fas {
                color: #5cbdbb;
            }



            .search-container:hover {
                animation: hoverShake 0.15s linear 3;
            }
        </style>

        <!-- Header -->

        <header class="header trans_300">

            <!-- Top Navigation -->

            <div class="top_nav">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="top_nav_left">free shipping on all Kerala</div>
                        </div>
                        <div class="col-md-6 text-right">
                            <div class="top_nav_right">
                                <ul class="top_nav_menu">


                                    <li class="account">
                                        <a href="sellerprofile.jsp" class="fa fa-user-circle" style="font-size:34px"> </a>

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Navigation -->

            <div class="main_nav_container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <div class="logo_container">
                                <a href="#">Craft<span>sy</span></a>
                            </div>
                            <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li><a href="sellerhome.jsp">home</a></li>
                                    <li><a href="productreg.jsp">Product Register</a></li>	
                                    <li><a href="productview.jsp">View Products</a></li>
                                    <li><a href="requestview.jsp">View Requests</a></li>
                                    <li><a href="#">View Payment</a></li>
                                    <li><a href="../guest/guesthome.jsp">Logout</a></li>
                                </ul>
                                <ul class="navbar_user">

                                    <li> <div class="search-container">
                                            <input type="text" name="search" placeholder="Search..." class="search-input">
                                            <a href="#" class="search-btn">
                                                <i class="fa fa-search"></i>
                                            </a>
                                        </div></li>

                                </ul>
                                <div class="hamburger_container">
                                    <i class="fa fa-bars" aria-hidden="true"></i>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </header>
