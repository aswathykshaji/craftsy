
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="craftpackage.JavaClass"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="adminindex.jsp"></jsp:include>

    <!--main content start-->



    <section id="main-content">
        <section class="wrapper">
            <div class="table-agile-info">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-left:10%">
                          <br>
                        SUB CATEGORY DETAILS
                    </div>
                    <form role="form" action="" method="post"  >
                        <div class="row w3-res-tb">
                            <div class="col-sm-5 m-b-xs">
<div class="row" style="padding-left: 25%" >
    <div class="col-md-4">

                            <%
                                try {
                                    //out.println("hello");
                                    Connection con = JavaClass.getCon();
                                    Statement st = con.createStatement();

                                    String catid = request.getParameter("category_id");
//                                    out.print(catid);
                                    String Query = "select * from category";
                                    ResultSet rs = st.executeQuery(Query);
//out.println("hello1");
                            %>
                            <br>
                           <label>Category</label>
        <select class="dropdown" id="category_id" name="category_id" style="border:1px solid black" onchange="displaySubcat()" >
            <option value="0">...SELECT....</option>
            <%
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("category_id")%>"> <%=rs.getString("category_name")%>  </option>
            <%
                    }
                } catch (Exception e) {
                    //out.println("error");
                }

            %> 
        </select>

    </div>
</div>
                            </form>
                            </tbody>
                            </table>


                        </div>
                        <div id="subcategory"></div>  
                        <script>
                            function displaySubcat()
                            {
//                                alert("a")
                                var val = document.getElementById('category_id').value;
//                                alert(val)
                                $.ajax({
                                    type: "POST",
                                    url: "getsubcategory.jsp",
                                    data: "id=" + val,
                                    success: function(data2)
                                    {
//                                        alert(data2);
                                        $("#subcategory").html(data2);
                                    }
                                })

                            }


                        </script>
                        <script src="table/js/jquery.min.js"></script>
