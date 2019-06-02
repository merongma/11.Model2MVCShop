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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script> -->

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
.text{
color: #88B04B;
}
.price{
font-size: 18px
}

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
//////////////////////구매버튼//////////////////////

	$(function() {
		var stock = ${product.stock }
		var spinner = $("#spinner").spinner();
		$('#spinner').spinner({
			min:1,
			max: stock,
			step:1
		});
	

		if(stock!=0){
			$( "button.btn.btn-success").on("click" , function() {
				//alert(stock);
		 		self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}&quantity="+spinner.val();
			});
			
		}else {
			$( "button.btn.btn-success").on("click" , function() {
				alert("품절 상품 입니다!!!");
		 		
			});
			
		}
	});

///////////////////////////이전버튼///////////////////////		
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				//alert("이전버튼");
				self.location = "/product/listProduct?menu=search"
			});
		});
		
////////////////////////////////////////////수량

$(function(){
var spinner = $("#spinner").spinner();
var stock = ${product.stock }
var price =  $(".price").text();
$(".ui-icon-triangle-1-n").on("click",function(){
	//alert(spinner.val())
	$(".price").html(spinner.val()*price);
	if(spinner.val()>=stock){
		alert("구매는 "+stock+"개 까지 가능합니다!")
	}
});

$(".ui-icon-triangle-1-s").on("click",function(){
	//alert(spinner.val())
	$(".price").html(price/spinner.val());
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
			<h3 class="text">상품 상세 조회 </h3>
		</div>

		
		<div class="row">
			<div class="col-xs-4 col-md-7" align="center">
				<img src="/images/uploadFiles/${product.fileName}"  width="360" height="360"/>
			</div>
			<div class="col-xs-4 col-md-5" >
			
				<div ><h3>${product.prodName }</h3></div>
				<br>
				<div><h4>	${product.prodDetail }</h4></div>
				<br>
				<br>
				<div><input type="text" id="spinner"  value="1"/></div>
				<br>
				<span class="price">${product.price }</span>원
				<br>
				<br>
				<br>
			<div class="form-group">
			 <c:if test="${product.stock >=1}">
				<button type="button" class="btn btn-success">구 &nbsp;매</button></c:if>
			<c:if test="${product.stock ==0}"><strong>OUT OF STOCK</strong></c:if>
			</div>
		
			</div>
		</div>
		
	




	</div>
	<!--  화면구성 div end /////////////////////////////////////-->


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/review/listReview.jsp" flush="false">
			<jsp:param value="${product.prodNo}" name="prodNo"/>
	</jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	
</body>

</html>