<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String catid = request.getParameter("id");
// out.print(catid);
        String Query = "select * from subcategory where category_id='" + catid + "'";
// String Query1="select * from subcategory where category_id='1'";
//  out.println(Query);
        ResultSet rs = st.executeQuery(Query);
        // out.println("hello1");
%>
<!--<label for="">Subcategory: </label>-->
<select name="subcategory" id="subcategory_id" class="form-control">
    <option value="subcategory">--select--</option>
    <%
        while (rs.next()) {
    %>
    <option value="<%=rs.getString("subcategory_id")%>"><%=rs.getString("subcategory_name")%></option>
    <%
        }
    %>
    <%            
        }
        catch (Exception e) {
        }

    %>