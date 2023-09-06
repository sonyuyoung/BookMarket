<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품편집</title>

<script type="text/javascript">

function deleteConfirm(id){
	if(confirm("해당 상품을 삭제합니다")==true){
	console.log(id);
	location.href="./deleteBook.jsp?id="+id;}
	else{
		return;}
	
}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>

<body>
<%@ include file ="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 편집
			</h1>
		</div>
	</div>
	
	<div class="container">
	<div class="row" align="center">
<%@ include file ="dbconn.jsp" %>

<%

PreparedStatement pstmt = null;
ResultSet rs=null;

String sql="select * from Book";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
%>
<div class="row" align="left">
<div class="col-md-3">
<img src="/upload/<%=rs.getString("p_fileName")%>" style="width:100%"></div>
	<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원</p>
				
				</div>
			
				<p><% if(edit.equals("update")){
				%>
					
				<a href="./updateBook.jsp?id=<%=rs.getString("p_id") %>"
				class="btn btn-success" role="button">수정 &raquo;</a>
				<%
				}
				
				else if(edit.equals("delete")){
				
				%>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
				class="btn btn-danger" role="button">삭제 &raquo;</a>
					<hr>
				<%
				}
				%>
				</div>
<%
}
if(rs !=null)
	rs.close();

if(pstmt !=null)
	pstmt.close();

if(conn !=null)
	conn.close();
%>
</div>

</div>
<%@ include file = "footer.jsp" %>
</body>
</html>