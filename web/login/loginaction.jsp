<% 
    String username=request.getParameter("username");
    String password=request.getParameter("password");
//    out.println("username= "+username);
//    out.println("password= "+password);
    if(username.equals("admin")&& password.equals("admin"))
    {
        response.sendRedirect("../admin/adminhome.jsp");
    }
    else
    {
        out.println("invalid username and password");
    }
    %>