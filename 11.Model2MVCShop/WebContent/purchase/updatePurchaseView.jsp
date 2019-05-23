<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

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
		 
	 	$( ".btn btn-success btn" ).on("click" , function() {
	 		history.go(-1);	
		});

	 	$( "button.btn.btn-success" ).on("click" , function() {
	 		$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
		});
	 	
	 	$( function() {
	 	    $( "#divyDate" ).datepicker({dateFormat:'yy-mm-dd'});
	 	  } );
});
</script>
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
			<h1 class="bg-success text-center">구 매 정 보 수 정</h1>
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>  
			
		  	<div class="form-group">
			   <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="buyerId" name=buyerId value="${purchase.buyer.userId} "placeholder="상품명"  readonly>
			       <span id="helpBlock" class="help-block">
			      	<strong class="text-danger">아이디는 수정불가</strong>
			      </span>
			    </div>
			</div>

			<div class="form-group">
				    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				       <div class="col-sm-4">
				      <select class="form-control" name="paymentOption" id="paymentOption">
						  	<option value="001" selected="selected">현금구매</option>
							<option value="002" selected="selected">신용구매</option>
						</select>
				    </div>
			</div>	
					 
			  <div class="form-group">
			    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">수령인</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }"  >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">수령인 연락처</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지 주소</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" >
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">배송메모</label>
			    <div class="col-sm-4">
			      <input type="text"  class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}">
			    </div>
			  </div>
		  
			  <div class="form-group">
			    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망일</label> 
			    <div class="col-sm-4">  
			      <input type="text" class="form-control" id="divyDate" name="divyDate" >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" class="btn btn-success"  >수 &nbsp;정</button>
				  <a class="btn btn-success btn" href="#" role="button">취 &nbsp;소</a>
			    </div>
			  </div>
			</form>
			<!-- form Start /////////////////////////////////////-->
			
	 	</div>
		<!--  화면구성 div end /////////////////////////////////////-->
		
	</body>

	</html>