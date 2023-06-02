<%@page import="java.sql.*" %>
<%@page import="craftpackage.JavaClass" %>
<%
    try {
        Connection con = JavaClass.getCon();
        Statement st = con.createStatement();
        String catid = request.getParameter("id");
        String Query = "select * from subcategory where category_id='" + catid + "'";
        ResultSet rs = st.executeQuery(Query);
%>
<label>Subcategory</label>
<select name="subcategory" id="subcategory_id" class="form-control" onchange="displayproduct()">
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