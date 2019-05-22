<%@ page contentType="text/html; charset=EUC-KR" %>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

$(function() {
	
	$( "button.btn.btn-success" ).on("click" , function() {
		alert("구매버튼");
		fncAddPurchase();
	});
});	

$(function() {
	
	$("a[href='#' ]").on("click" , function() {
 		history.go(-1);
	});
});

function fncAddPurchase() {
	document.addPurchase.submit();
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}

$( function() {
    $( "#divyDate" ).datepicker({dateFormat:'yy-mm-dd'});
  } );
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
		<h1 class="bg-success text-center">상 품 구 매</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name ="addPurchase">
		  
		  <div class="form-group">
		  <input type="hidden" name="prodNo" value="${product.prodNo}" />
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${product.prodNo }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${product.prodName }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label> 
		    <div class="col-sm-4">  
		      <input type="text" class="form-control" value="${product.prodDetail }" readonly>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"value="${product.manuDate }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"value="${product.price }" readonly>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control"value="${product.regDate }" readonly>
		    </div>
		  </div>
		 
		 <div class="form-group">
			<input type="hidden" name="buyerId" value="${user.userId}" />
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control"value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="quantity" class="col-sm-offset-1 col-sm-3 control-label">수량</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="quantity" name="quantity" placeholder="수량">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="001" >현금구매</option>
					<option value="002" >신용구매</option>
				</select>
		    </div>
		   </div>

		 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">수령인</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="수령인">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">수령인 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="수령인 연락처">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="배송지 주소">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">배송메모</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="배송메모">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망일</label> 
		    <div class="col-sm-4">  
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="배송 희망일">
		    </div>
		  </div>
		  		  		  		  		  		     
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >구 &nbsp;매</button>
			  <a class="btn btn-success btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>