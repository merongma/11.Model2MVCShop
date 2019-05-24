<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">


</script>


</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-success">
	       <h3>REVIEW</h3>
	    </div>
	    
	   <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">

		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <button type="button" class="btn btn-default">후기작성</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 end /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">NO</th>
            <th align="left" >TITLE</th>
            <th align="left">POSTED BY</th>
            <th align="left">DATE</th>
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
			  &nbsp; &nbsp; ${purchase.purchaseProd.prodName}<input type="hidden"  value="${purchase.purchaseProd.prodNo  }"/></td>
			  <td align="left">
			  	<c:if test="${purchase.quantity>=1 }">${(purchase.purchaseProd.price)*(purchase.quantity)}</c:if>
				<c:if test="${purchase.quantity==0 }">${purchase.purchaseProd.price}</c:if>원</td>
			  <td align="left">현재
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">구매완료 상태 입니다.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">배송중 상태 입니다.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='300'}">배송완료 상태 입니다.</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='400'}">주문취소 상태 입니다.</c:if>
			</td>
			  	
			  <td align="left">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">
			  		<div class="cancle"><input type="hidden" value="${purchase.purchaseProd.prodNo }" />주문취소</div></c:if>
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">
			  		<div class="ship"><input type="hidden"  value="${purchase.purchaseProd.prodNo }" />배송하기</div></c:if>
			  </td>
			 <td align="left">
			  	<i class="glyphicon glyphicon-search" id= "${purchase.tranNo}"></i>
			  	<input type="hidden" value="${purchase.tranNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>