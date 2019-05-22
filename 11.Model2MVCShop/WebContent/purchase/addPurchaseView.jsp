<%@ page contentType="text/html; charset=EUC-KR" %>
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
		alert("���Ź�ư");
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
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">	
		<h1 class="bg-success text-center">�� ǰ �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name ="addPurchase">
		  
		  <div class="form-group">
		  <input type="hidden" name="prodNo" value="${product.prodNo}" />
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${product.prodNo }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${product.prodName }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label> 
		    <div class="col-sm-4">  
		      <input type="text" class="form-control" value="${product.prodDetail }" readonly>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"value="${product.manuDate }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"value="${product.price }" readonly>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control"value="${product.regDate }" readonly>
		    </div>
		  </div>
		 
		 <div class="form-group">
			<input type="hidden" name="buyerId" value="${user.userId}" />
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control"value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="quantity" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="quantity" name="quantity" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="001" >���ݱ���</option>
					<option value="002" >�ſ뱸��</option>
				</select>
		    </div>
		   </div>

		 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="������">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="������ ����ó">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">����� �ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="����� �ּ�">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">��۸޸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="��۸޸�">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">��� �����</label> 
		    <div class="col-sm-4">  
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="��� �����">
		    </div>
		  </div>
		  		  		  		  		  		     
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success"  >�� &nbsp;��</button>
			  <a class="btn btn-success btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>