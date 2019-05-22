<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>


<script type="text/javascript">

function fncGetUserList(currentPage) {
	
	$("#currentPage").val(currentPage)
   
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}
$(function() {
	 
	$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
		self.location ="/purchase/getPurchase?tranNo="+$(this).children("input").val();
	});
	
	$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			self.location ="/user/getUser?userId="+$(this).children("input").val();
	});
	
	$( ".ct_list_pop td:nth-child(5)" ).on("click" , function() {
		var tranNo = $(this).children("input").val().trim();
		$.ajax({
			url : "/purchase/json/getPurchase/" + tranNo,
			method : "GET",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {

				//alert(status);
				//alert("JSONData : \n"+JSONData.tranNo);

				var displayValue = "<h3>" + 
				"제품번호 : "+JSONData.purchaseProd.prodNo + "<br/>" +
				"구매자 이름 : "+JSONData.purchaseProd.receiverName + "<br/>" +
				"재고 : "+ JSONData.quantity + "<br/>" +
				"구매자 연락처 : "+ JSONData.receiverPhone + "<br/>" +
				"구매자 주소 : "+ JSONData.divyAddr + "<br/>" +
				"구매 요청 사항: "+ JSONData.divyRequest + "<br/>" +
				"배송희망일: "+ JSONData.divyDate + "<br/>" +
				"주문일: "+ JSONData.orderDate + "<br/>" +
				"상품이미지 : <img src=/images/uploadFiles/"+ JSONData.purchaseProd.fileName+ "/><br/>" 
				"</h3>";

				//alert(displayValue);
				$("h3").remove();
				$("#" + tranNo + "").html(displayValue);
			}
		});
	});
	
	$(".ct_list_pop td:nth-child(11):contains('물건도착')" ).on("click",function() {
		//alert( $(this).children("input").val() );
		var tranNo =$(this).children("input").val().trim();
		self.location="/purchase/updateTranCode?tranNo="+$(this).children("input").val()+"&tranCode=3";
	});
	

	
$( ".ct_list_pop td:nth-child(1)" ).css("color" , "#5F04B4");
$( ".ct_list_pop td:nth-child(3)" ).css("color" , "#4C0B5F");
$( ".ct_list_pop td:nth-child(5)" ).css("color" , "#610B5E");
$( ".ct_list_pop td:contains('물건도착')" ).css("color" , "#B4045F");
//$( ".ct_list_pop td:nth-child(9)" ).css("color" , "red");
		
$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">주문번호<br><h7 >(no click:상세정보)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID<br><h7 >(id click:상세정보)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문내역</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">결제금액</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">상태수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var = "i" value = "0"/>
	<c:forEach var ="purchase" items ="${list }">
		<c:set var="i"  value = "${i+1 }"/>
		<tr class="ct_list_pop">
		<td align="center">
		<input type="hidden" name="tranNo"  value="${purchase.tranNo }" />
		${purchase.tranNo}
		</td>
		<td></td>
		<td align="left">
		<input type="hidden" name="userId"  value="${purchase.buyer.userId}" />
		${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.prodName}<input type="hidden" name="tranNo"  value="${purchase.tranNo }" /></td>
		<td></td>
		<td align="left">
		<c:if test="${purchase.quantity>=1 }">${(purchase.purchaseProd.price)*(purchase.quantity)}</c:if>
		<c:if test="${purchase.quantity==0 }">${purchase.purchaseProd.price}</c:if>
		원
		</td>
		<td></td>
		<td align="left">
				현재
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='1  ' }">구매완료</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='2  '}">배송중</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='3  '}">배송완료</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='4  '}">주문취소</c:if>
				상태 입니다.</td>
		<td></td>
		<td align="left" >
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='2  '}">
				  <input type="hidden" name="tranNo"  value="${purchase.tranNo }" />
				<h8>물건도착</h8>
				</c:if>
		</td>
	</tr>
	<tr>
		<td id = "${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>	
	
<!--  페이지 Navigator 시작 -->

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>

</body>
</html>