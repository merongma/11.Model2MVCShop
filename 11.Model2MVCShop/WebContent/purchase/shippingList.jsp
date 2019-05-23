<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

function fncGetUserList(currentPage) {
	
	$("#currentPage").val(currentPage)
   
	$("form").attr("method" , "POST").attr("action" , "/purchase/shippingList?menu=${param.menu}").submit();
}
$(function() {
	 
	$( "td:nth-child(1)" ).on("click" , function() {
		alert($(this).text())
		self.location ="/purchase/getPurchase?tranNo="+$(this).text();
	});
	
	$( "td:nth-child(2)" ).on("click" , function() {
			self.location ="/user/getUser?userId="+$(this).children("input").val();
	});
	
	$( "td:nth-child(3)" ).on("click" , function() {
		alert("����");
		
		self.location ="/product/getProduct?menu=manage&prodNo="+$(this).children("input").val()
	});
	
// 	$( "td:nth-child(3)" ).on("click" , function() {
// 		var tranNo = $(this).children("input").val().trim();
// 		$.ajax({
// 			url : "/purchase/json/getPurchase/" + tranNo,
// 			method : "GET",
// 			dataType : "json",
// 			headers : {
// 				"Accept" : "application/json",
// 				"Content-Type" : "application/json"
// 			},
// 			success : function(JSONData, status) {

// 				//alert(status);
// 				//alert("JSONData : \n"+JSONData.tranNo);

// 				var displayValue = "<h3>" + 
// 				"��ǰ��ȣ : "+JSONData.purchaseProd.prodNo + "<br/>" +
// 				"������ �̸� : "+JSONData.purchaseProd.receiverName + "<br/>" +
// 				"��� : "+ JSONData.quantity + "<br/>" +
// 				"������ ����ó : "+ JSONData.receiverPhone + "<br/>" +
// 				"������ �ּ� : "+ JSONData.divyAddr + "<br/>" +
// 				"���� ��û ����: "+ JSONData.divyRequest + "<br/>" +
// 				"��������: "+ JSONData.divyDate + "<br/>" +
// 				"�ֹ���: "+ JSONData.orderDate + "<br/>" +
// 				"��ǰ�̹��� : <img src=/images/uploadFiles/"+ JSONData.purchaseProd.fileName+ "/><br/>" 
// 				"</h3>";

// 				//alert(displayValue);
// 				$("h3").remove();
// 				$("#" + tranNo + "").html(displayValue);
// 			}
// 		});
// 	});
	

	$( "button.btn.btn-success:contains('�ֹ����')"  ).on("click" , function() {
		alert($(this).children("input").val());
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=400";
	});
	
	$( "button.btn.btn-success:contains('����ϱ�')"  ).on("click" , function() {
		alert($(this).children("input").val() );
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=200";
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
	       <h3>��� ���� ���</h3>
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
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">�ֹ���ȣ</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">�ֹ�����</th>
            <th align="left">�����ݾ�</th>
            <th align="left">�����Ȳ</th>
            <th align="left">������Ʈ</th>
          </tr>
        </thead>
       
		<tbody>

		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${purchase.tranNo}</td>
			  <td align="left">${purchase.buyer.userId}</td>
			  <td align="left"><img src="/images/uploadFiles/${purchase.purchaseProd.fileName}" width="66" height="66"/>
			  &nbsp; &nbsp; ${purchase.purchaseProd.prodName}<input type="hidden" name="prodNo"  value="${purchase.purchaseProd.prodNo  }"/></td>
			  <td align="left">
			  	<c:if test="${purchase.quantity>=1 }">${(purchase.purchaseProd.price)*(purchase.quantity)}</c:if>
				<c:if test="${purchase.quantity==0 }">${purchase.purchaseProd.price}</c:if>��</td>
			  <td align="left">����
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">���ſϷ� ���� �Դϴ�.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">����� ���� �Դϴ�.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='300'}">��ۿϷ� ���� �Դϴ�.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='400'}">�ֹ���� ���� �Դϴ�.</c:if>
			</td>
			  	
			  <td align="left">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100'}">
				<button type="button" class="btn btn-success btn-sm"><input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" />�ֹ����</button></c:if>
				<span>&nbsp; </span>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">
				<button type="button" class="btn btn-success btn-sm"><input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" />����ϱ�</button></c:if>
			  </td>
			  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>