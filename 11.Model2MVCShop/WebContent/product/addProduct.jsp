<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


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
	
	 $(function() {
			
			$( "button.btn.btn-success").on("click" , function() {
		 		self.location = "/product/listProduct?menu=manage"
			});
		 	
			$("a[href='#' ]").on("click", function() {
		 		self.location = "/product/addProduct"
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
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	 	<!--  화면구성 div Start /////////////////////////////////////-->
	 	<div class="container">

	 		<div class="page-header">
	 			<h3 class=" text-success">상품 등록 조회</h3>
	 		</div>

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2">
	 				<strong>상품명</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">${product.prodName }</div>
	 		</div>

	 		<hr />

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2 ">
	 				<strong>상품 이미지</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">
	 				<img src="/images/uploadFiles/${product.fileName}" />
	 			</div>
	 		</div>

	 		<hr />

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2 ">
	 				<strong>상품 상세 정보</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">${product.prodDetail }</div>
	 		</div>

	 		<hr />

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2">
	 				<strong>제조일자</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
	 		</div>

	 		<hr />

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2 ">
	 				<strong>가격</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">${product.price }</div>
	 		</div>

	 		<hr />

	 		<div class="row">
	 			<div class="col-xs-4 col-md-2 ">
	 				<strong>재고</strong>
	 			</div>
	 			<div class="col-xs-8 col-md-4">${product.stock }</div>
	 		</div>

	 		<hr />

		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-success">확 &nbsp;인</button>
				<a class="btn btn-success btn" href="#" role="button">추가등록</a>
			</div>
		</div>


</body>
</html>
