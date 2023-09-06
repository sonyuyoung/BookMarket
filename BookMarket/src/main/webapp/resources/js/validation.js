/**
 * 
 *//**
 * 
 */
function  CheckAddBook(){

	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");

//상품아이디 체크 
if(!check(/^ISBN[0-9]{4,11}$/,bookId, "[도서코드]\nISBN와 숫자를 조합하여 5~12까지 입력하세요 \n첫글자는 반드시 ISBN로 시작하세요"))
return false;
//상품명 체크
if(name.value.length<4 || name.value.length>25 ){
	alert("[도서명]\n 최소 4자에서 최대 25자리까지 입력하세요");
	name.select();
	name.focus();
	return false;
}
//상품가격체크 
if(unitPrice.value.length==0||isNaN(unitPrice.value)){
	alert("[가격] \n 숫자만 입력하세요");
	unitPrice.select();
	unitPrice.focus();
	return false;
	}
if(unitPrice.value<0){
	alert("[가격]\n음수는 입력할 수 없습니다 ");
	unitPrice.select();
	unitPrice.focus();
	return false;
}else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소수점 둘째자리까지만 입력하세요"))
return false;

//재고수체크
if(isNaN(unitsInStock.value)){
	alert("[재고 수]\n숫자만 입력하세요");
	unitsInStock.select();
	unitsInStock.focus();
	return false;
}
function check(regExp,e,msg){
	if(regExp.test(e.value)){
		return true ;
	}
	alert(msg);
	e.select();
	e.focus();
	return false;
}
document.newBook.submit()
}