<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
	<jsp:forward page="main.jsp" />
</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
        .col-md-3 img {
    width: 286px;
    height: 360px;
    margin-top: 255px;}
    
    .col-md-9 img{
        width: 836px;
    height: 620px;
    margin-left: 30px;
    }
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= ȸ�������� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('REGISTER')").on("click", function() {
			self.location = "/user/addUser"
		});
	});

	//============= �α��� ȭ���̵� =============
	$(function() {
		//==> �߰��Ⱥκ� : "addUser"  Event ����
		$("a[href='#' ]:contains('Sign-in')").on("click", function() {
			self.location = "/user/login"
		});
	});

</script>

</head>

<body >

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">

		<div class="container">

			<a class="navbar-brand" href="#">Model2 MVC Shop</a>

			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- toolBar Button End //////////////////////// -->

			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">REGISTER</a></li>
					<li><a href="#">Sign-in</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">

			<!--  Menu ���� Start /////////////////////////////////////-->
			<div class="col-md-3">
				<img src="/images/green1.jpg" />
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->

			<!--  Main start /////////////////////////////////////-->
			<div class="col-md-9">
				<img src="/images/green_leaves.jpg" />
			</div>
			<!--  Main end /////////////////////////////////////-->

		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>