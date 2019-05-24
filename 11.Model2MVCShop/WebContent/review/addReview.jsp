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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		$("button.btn.btn-success").on("click", function() {
		self.location = "/list/addReview"	
		});
	});

	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		$("a[href='#' ]").on("click", function() {
			alert("����")
			history.go(-1);
		});
	});
	
	</script>		
    
</head>

<body>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">	
		<h1 class="bg-success text-center">REVIEW</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�� </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" value="${product.prodName }" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reviewTitle" name=reviewTitle >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="reviewDetail" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		    	<textarea rows=10 cols=10 id="reviewDetail" name="reviewDetail" class="form-control" ></textarea>
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
			  <a class="btn btn-success btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>