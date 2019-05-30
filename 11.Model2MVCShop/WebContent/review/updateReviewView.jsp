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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

     <!--  ///////////////////////// JavaScript////////////////////////// -->
	<script type="text/javascript">
	
	//============= "����"  Event ó�� ��  ���� =============
	 $(function() {
			$( "button.btn.btn-success" ).on("click" , function() {
				$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/review/updateReview?reviewNo=${review.reviewNo}").submit();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
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
		<h1 class="bg-success text-center">REVIEW UPDATE</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}"/>  
		
	  	<div class="form-group">
		   <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name=prodName value="${review.reProduct.prodName }" placeholder="��ǰ��"  readonly>
		    </div>
		</div>
		  
		<div class="form-group">
		   <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo"  value="${review.reProduct.prodNo }" placeholder="��ǰ��ȣ" readonly>
		    </div>
		</div>
		 
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�ۼ���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${review.reUser.userId }"  placeholder="�ۼ���" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="tranNo" class="col-sm-offset-1 col-sm-3 control-label">�ֹ���ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tranNo" name="tranNo" value="${review.rePurchase.tranNo }"placeholder="�ֹ���ȣ" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="reviewTitle" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reviewTitle" name="reviewTitle"  placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="reviewDetail" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		    	<textarea rows=10 cols=10 id="reviewDetail" name="reviewDetail" class="form-control" placeholder="����" ></textarea>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file"  class="form-control" id="file" name="file" placeholder="�̹���" >
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