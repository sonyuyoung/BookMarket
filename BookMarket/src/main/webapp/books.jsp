<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 목록</title>

</head>
<body>
<%@ include file ="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 목록
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
<div class="col-md-2">
<img src="/upload/<%=rs.getString("p_fileName")%>" style="width:100%">
</div>
				<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<a href="./book.jsp?id=<%=rs.getString("p_id")%>"
					class="btn btn-secondary" role="button">상세정보</a>
					</div>

				
			<hr>
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