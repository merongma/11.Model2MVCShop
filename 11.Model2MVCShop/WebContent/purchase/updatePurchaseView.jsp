<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	   	
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container">	
			<h1 class="bg-success text-center">�� �� �� �� �� ��</h1>
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			<input type="hidden" name="tranNo" value="${purchase.tranNo}"/>  
			
		  	<div class="form-group">
			   <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="buyerId" name=buyerId value="${purchase.buyer.userId} "placeholder="��ǰ��"  readonly>
			       <span id="helpBlock" class="help-block">
			      	<strong class="text-danger">���̵�� �����Ұ�</strong>
			      </span>
			    </div>
			</div>

			<div class="form-group">
				    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
				       <div class="col-sm-4">
				      <select class="form-control" name="paymentOption" id="paymentOption">
						  	<option value="001" selected="selected">���ݱ���</option>
							<option value="002" selected="selected">�ſ뱸��</option>
						</select>
				    </div>
			</div>	
					 
			  <div class="form-group">
			    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }"  >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">����� �ּ�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" >
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">��۸޸�</label>
			    <div class="col-sm-4">
			      <input type="text"  class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}">
			    </div>
			  </div>
		  
			  <div class="form-group">
			    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">��� �����</label> 
			    <div class="col-sm-4">  
			      <input type="text" class="form-control" id="divyDate" name="divyDate" >
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-4  col-sm-4 text-center">
			      <button type="button" class="btn btn-success"  >�� &nbsp;��</button>
				  <a class="btn btn-success btn" href="#" role="button">�� &nbsp;��</a>
			    </div>
			  </div>
			</form>
			<!-- form Start /////////////////////////////////////-->
			
	 	</div>
		<!--  ȭ�鱸�� div end /////////////////////////////////////-->
		
	</body>

	</html>