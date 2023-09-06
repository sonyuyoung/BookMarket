<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src ="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>상품 수정</title>

</head>
<body>

<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
	<div class="container">
	<h1 class="display-3">도서 수정</h1>
	</div>
	</div>
	
	
<%@ include file="dbconn.jsp"%>

<%
	String bookId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from Book where p_id=?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,bookId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		 %>
		 
<div class="container">
	<div class="row">		 
<div class="col-md-4" align="left">
<img src="/upload/<%=rs.getString("p_fileName")%>" style="width:100%">
</div>

<div class="col-md-6">
<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
	<div class="form-group row">
	<label class="col-sm-2">도서코드</label>
	<div class="col-sm-4">
	<input type="text" id="bookId" name="bookId" class="form-control" value="<%=rs.getString("p_id")%>">
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">이름</label>
	<div class="col-sm-4">
	<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name")%>" >
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">가격</label>
	<div class="col-sm-4">
	<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getString("p_unitPrice")%>">
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">저자</label>
	<div class="col-sm-4">
	<input type="text" name="author" class="form-control" value="<%=rs.getString("p_Author")%>">
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">출판사</label>
	<div class="col-sm-4">
	<input type="text" name="publisher" class="form-control" value="<%=rs.getString("p_Publisher")%>">
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">출판일</label>
	<div class="col-sm-4">
	<input type="text" name="releaseDate" class="form-control" value="<%=rs.getString("p_releaseDate")%>">
	</div>
	</div>
	
	<div class="form-group row">
	<label class="col-sm-2">총페이지</label>
	<div class="col-sm-4">
	<input type="text" name="totalPages" class="form-control" value="<%=rs.getString("p_totalPages")%>">
	</div>
	</div>
	
	
	<div class="form-group row">
	<label class="col-sm-2">상세설명</label>
	<div class="col-sm-7">
	<textarea name="description" rows="2" cols="50" class="form-control"><%=rs.getString("p_description")%>"></textarea>
	</div>
	</div>
		
	<div class="form-group row">
	<label class="col-sm-2">분류</label>
	<div class="col-sm-4">
	<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
	</div>
	</div>	
		
	<div class="form-group row">
	<label class="col-sm-2">재고수</label>
	<div class="col-sm-4">
	<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getString("p_unitsInStock")%>">
	</div>
	</div>	
	
	
	<div class="form-group row">
	<label class="col-sm-2">상태</label>
	<div class="col-sm-5">
	<input type="radio" name="condition" value="New" >신규도서
	<input type="radio" name="condition" value="Old" >중고도서
	<input type="radio" name="condition" value="e-book">전자도서
	</div>
	</div>	
	
<div class="form-group row">
<label class="col-sm-2">이미지</label>
<div class="col-sm-5">
<input type="file" name="bookImage" class="form-control" value="<%=rs.getString("p_unitPrice")%>"> 
</div>
</div>
	
		<div class="form-group row">
	<div class="col-sm-offset-2 col-sm-10">
	<input type="button" class="btn btn-primary" value="등록">
	</div>
	</div>	
	
</form>
	</div>
	</div>

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


</body>
</html>





<!-- 이책은 프로그래밍을 처음 접하는 독자를 대상으로 한 파이썬 입문서 입니다 프로그래밍에 대한 경험이 전혀 없어도 목차에따라 문법을 익히고 실습을 진행하면 파이썬을 쉽게배울수 ..  -->