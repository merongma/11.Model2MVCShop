<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

	function fncGetUserList(currentPage) {

		$("#currentPage").val(currentPage)

		$("form").attr("method", "POST").attr("action","/product/listProduct?menu=${param.menu}").submit();
	}

	$(function() {
		
		$(".thumbnail-wrapper").on("click", function() {
			//alert( $(this).children("input").val());
			self.location = "/product/getProduct?prodNo="+ $(this).children("input").val()+ "&menu=${param.menu}";
		});

	});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-success">
	       <h3>What's New</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-success">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� end /////////////////////////////////////-->
				
		<!--  ����� Start /////////////////////////////////////-->

		<div class="row">
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<div class="col-xs-6 col-md-4">
					<a href="#" class="thumbnail-wrapper"><input type="hidden" name="prodNo"value="${product.prodNo }" />
					<img src="/images/uploadFiles/${product.fileName}" width="300" height="300" onError="this.src='/images/noimage'" alt="noimage">
					<div class="caption" align="left">
						<h3>${product.prodName }</h3>
						<h5>${product.price }��</h5>
						<h5>${product.prodDetail }</h5>
					</div></a>
				</div>
			</c:forEach>
		</div>


		<!--  ����� End /////////////////////////////////////-->


		<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	</div>

	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp" />
	<!-- PageNavigation End... -->
</body>

</html>