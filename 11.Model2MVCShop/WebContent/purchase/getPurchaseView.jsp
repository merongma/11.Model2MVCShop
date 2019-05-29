<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
 $(function(){

	 $( "button.btn.btn-success" ).on("click" , function() {
		 self.location = "/purchase/updatePurchaseView?tranNo=${purchase.tranNo}" 
	 });
	
	 $("a[href='#' ]").on("click" , function() {
		 self.location = "/product/listProduct" 
	});
 	
});  
 
 </script>
 
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title></title>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class=" text-success">구매 상세 조회</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자 아이디</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>수량</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.quantity}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>주문일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>

		<hr />	
		
		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매방법</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				${purchase.paymentOption }
				<c:if test="${purchase.paymentOption =='001'} ">현금구매1</c:if>
				<c:if test="${purchase.paymentOption ==001} ">현금구매1</c:if>
				<c:if test="${purchase.paymentOption eq 001} ">현금구매1</c:if>
				<c:if test="${purchase.paymentOption eq '001'} ">현금구매1</c:if>
				<c:if test="${purchase.paymentOption =='002'} ">신용구매2</c:if>
				<c:if test="${purchase.paymentOption ==002} ">신용구매2</c:if>
				<c:if test="${purchase.paymentOption eq 002} ">신용구매2</c:if>
				<c:if test="${purchase.paymentOption eq '002'} ">신용구매2</c:if>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>수령인</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>수령인 연락처</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>배송지 주소</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>배송메모</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>배송 희망일</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>

		<hr />
			
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-success">수 &nbsp;정</button>
				<a class="btn btn-success btn" href="#" role="button">확 &nbsp;인</a>
			</div>
		</div>


	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>