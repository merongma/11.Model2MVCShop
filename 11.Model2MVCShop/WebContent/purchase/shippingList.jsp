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
   
	$("form").attr("method" , "POST").attr("action" , "/purchase/shippingList?menu=${param.menu}").submit();
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
	
	$( ".ct_list_pop td:nth-child(9):contains('배송하기')" ).on("click" , function() {
		alert("배송하기 버튼 " +$(this).children("input").val());
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=2";
	});

	$( ".ct_list_pop td:nth-child(11):contains('주문취소')"  ).on("click" , function() {
		alert("주문취소 버튼 " +$(this).children("input").val());
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=4";
	});
	
$( ".ct_list_pop td:nth-child(1)" ).css("color" , "#2E3B0B");
$( ".ct_list_pop td:nth-child(3)" ).css("color" , "#38610B");
$( ".ct_list_pop td:nth-child(5)" ).css("color" , "#4B8A08");
$("h8").css("color" , "#5FB404");

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
					<td width="93%" class="ct_ttl01">배송 목록조회</td>
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
		<td class="ct_list_b" width="140">주문번호<br><h7 >(no click:상세정보)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID<br><h7 >(id click:상세정보)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문내역</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">결제금액</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">주문취소</td>
		<td class="ct_line02"></td>
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
				<c:if test="${! empty purchase.purchaseProd.proTranCode && purchase.purchaseProd.proTranCode=='1  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">구매완료 상태 입니다.
					<h8>배송하기</h8>
					<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" />
					</c:if>
				</c:if>
				
				<c:if test="${! empty purchase.purchaseProd.proTranCode && purchase.purchaseProd.proTranCode=='2  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">배송중 상태 입니다.</c:if>
				</c:if>
				
				<c:if test="${! empty purchase.purchaseProd.proTranCode && purchase.purchaseProd.proTranCode=='3  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">배송완료 상태 입니다.</c:if>
				</c:if>
				
				<c:if test="${! empty purchase.purchaseProd.proTranCode && purchase.purchaseProd.proTranCode=='4  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">주문취소 상태 입니다.</c:if>
				</c:if>
			</td>	
			<td></td>
			<td align="left"><c:if test="${! empty purchase.purchaseProd.proTranCode && purchase.purchaseProd.proTranCode=='1  '}">
			<h8>주문취소</h8><input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" /></c:if>
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