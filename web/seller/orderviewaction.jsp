<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
try {
    // Check if the 'id' parameter is present in the request
    if (request.getParameter("id") != null) {
        String requestId = request.getParameter("id");

        // Check the action parameter to determine the action to perform
        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");

            // Perform different actions based on the value of 'action'
            if (action.equals("Processing")) {
                // Action for processing
                String sql1 = "UPDATE request SET status='Processing' WHERE request_id='" + requestId + "'";
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                st.executeUpdate(sql1);
                response.sendRedirect("orderview.jsp");
            } else if (action.equals("Shipped")) {
                // Action for shipped
                String sql2 = "UPDATE request SET status='Shipped' WHERE request_id='" + requestId + "'";
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                st.executeUpdate(sql2);
                response.sendRedirect("orderview.jsp");
            } else if (action.equals("Delivered")) {
                // Action for delivered
                String sql3 = "UPDATE request SET status='Delivered' WHERE request_id='" + requestId + "'";
                Connection con = JavaClass.getCon();
                Statement st = con.createStatement();
                st.executeUpdate(sql3);
                response.sendRedirect("orderview.jsp");
            }
        }
    } else {
        // 'id' parameter is missing, handle the error or redirect to an appropriate page
        response.sendRedirect("error-page.jsp");
    }
} catch (Exception e) {
    // Handle exceptions appropriately
    e.printStackTrace();
}
%>
