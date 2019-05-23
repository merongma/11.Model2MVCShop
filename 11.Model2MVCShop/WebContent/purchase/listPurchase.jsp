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
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		//============= 주문번호에 주문정보보기  Event  처리(Click) =============	
		 $(function() {
				
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "td:nth-child(1)" ).on("click" , function() {
					 self.location ="/purchase/getPurchase?tranNo="+$(this).text().trim();
				});
							
				
			});	
		 
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			
		});	
		
			//============= 주문내역 에 상품 정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
				alert("여기욤");
				alert($(this).children("input").val());
				self.location ="/product/getProduct?menu=search&prodNo="+$(this).children("input").val()
			});
			
		});	
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			$(  "td:nth-child(6):contains('상품도착')" ).on("click" , function() {
				alert("새로고침 클릭 OK")
				alert($(this).children("input").val());
				//self.location="/purchase/updateTranCode?tranNo="+$(this).children("input").val()+"&tranCode=300";
		
			});
			
			
			$(  "td:nth-child(6):contains('주문취소')" ).on("click" , function() {
				alert("주문취소 클릭 OK")
				alert($(this).children("input").val());
				//self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=400";
		
			});
			
			//==> 아래와 같이 정의한 이유는 ??
			$(  "td:nth-child(6)" ).css("color" , "#5F04B4");
			
			
		});	
	
	</script>
	
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-success">
	       <h3>구매 목록 조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-success">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
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
            <th align="center">주문번호</th>
            <th align="left" >회원 ID</th>
            <th align="left">주문내역</th>
            <th align="left">결제금액</th>
            <th align="left">배송현황</th>
            <th align="left">상태수정</th>
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
			  &nbsp; &nbsp; ${purchase.purchaseProd.prodName}<input type="hidden" name= "prodNo" value="${purchase.purchaseProd.prodNo  }"/></td>
			  <td align="left">
			  	<c:if test="${purchase.quantity>=1 }">${(purchase.purchaseProd.price)*(purchase.quantity)}</c:if>
				<c:if test="${purchase.quantity==0 }">${purchase.purchaseProd.price}</c:if>원</td>
			  <td align="left">현재
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">구매완료</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">배송중</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='300'}">배송완료</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='400'}">주문취소</c:if>
				상태 입니다.</td>
			  
			  <td align="left">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">주문취소</c:if>
			  	<input type="hidden" name = "tranNo" value="${purchase.tranNo  }">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">상품도착</c:if>
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