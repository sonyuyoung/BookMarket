<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "dao.BookRepository" %>

<%

String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		return;
	}
	
BookRepository dao =BookRepository.getInstance();

Book book = dao.getBookById(id);
if(book ==null){
	response.sendRedirect("exceptionNoBookId.jsp");
}

ArrayList<Book> goodsList =dao.getAllBook();
Book goods =new Book();
for(int i=0;i<goodsList.size();i++){
	goods=goodsList.get(i);
	if(goods.getBookId().equals(id)){
		break;
	}
}

ArrayList<Book> list =(ArrayList<Book>)session.
getAttribute("cartlist");
if(list==null){
	list = new ArrayList<Book>();
	session.setAttribute("cartlist", list);
}

int cnt=0;
Book goodQnt = new Book();

for(int i=0;i<list.size();i++){
	goodQnt = list.get(i);
	if(goodQnt.getBookId().equals(id)){
		cnt++;
		int orderQuantity = goodQnt.getQuantity()+1;
		goodQnt.setQuantity(orderQuantity);
	}
	
}
if(cnt==0){goods.setQuantity(1);
list.add(goods);
	
}

response.sendRedirect("book.jsp?id="+id);
%>