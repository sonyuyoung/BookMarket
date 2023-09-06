<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>


<html>
<head>
 
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");

String filename="";
String realFolder ="c:\\upload";
int maxSize = 5*1024*1024; 
String encType="utf-8";

MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

String bookId=multi.getParameter("bookId");
String name=multi.getParameter("name");
String unitPrice=multi.getParameter("unitPrice");
String author=multi.getParameter("author");
String description=multi.getParameter("description");
String publisher=multi.getParameter("publisher");
String category=multi.getParameter("category");
String unitsInStock=multi.getParameter("unitsInStock");
String totalPages=multi.getParameter("totalPages");
String releaseDate=multi.getParameter("releaseDate");
String condition=multi.getParameter("condition");

Integer price;

if(unitPrice.isEmpty())
	price = 0;
else
	price =Integer.valueOf(unitPrice);

long stock;

if(unitsInStock.isEmpty())
	stock=0;
else
	stock=Long.valueOf(unitsInStock);
	
long pages;

if(totalPages.isEmpty())
        pages=0;
else    pages=Long.valueOf(totalPages);

Enumeration files= multi.getFileNames();
String fname=(String)files.nextElement();
String fileName =multi.getFilesystemName(fname);


PreparedStatement pstmt = null;

String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?)";
pstmt =conn.prepareStatement(sql);
pstmt.setString(1,bookId);
pstmt.setString(2,name);
pstmt.setInt(3,price);
pstmt.setString(4,author);
pstmt.setString(5,description);
pstmt.setString(6,publisher);
pstmt.setString(7,category);
pstmt.setLong(8,stock);
pstmt.setLong(9,pages);
pstmt.setString(10,releaseDate);
pstmt.setString(11,condition);
pstmt.setString(12,fileName);


pstmt.executeUpdate();

if (pstmt != null)
	pstmt.close();

if (conn != null)
	conn.close();

response.sendRedirect("book.jsp");


%>
</body>
</html>