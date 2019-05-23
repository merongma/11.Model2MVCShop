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
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		//============= �ֹ���ȣ�� �ֹ���������  Event  ó��(Click) =============	
		 $(function() {
				
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "td:nth-child(1)" ).on("click" , function() {
					 self.location ="/purchase/getPurchase?tranNo="+$(this).text().trim();
				});
							
				
			});	
		 
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			
		});	
		
			//============= �ֹ����� �� ��ǰ ��������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
				alert("�����");
				alert($(this).children("input").val());
				self.location ="/product/getProduct?menu=search&prodNo="+$(this).children("input").val()
			});
			
		});	
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			$(  "td:nth-child(6):contains('��ǰ����')" ).on("click" , function() {
				alert("���ΰ�ħ Ŭ�� OK")
				alert($(this).children("input").val());
				//self.location="/purchase/updateTranCode?tranNo="+$(this).children("input").val()+"&tranCode=300";
		
			});
			
			
			$(  "td:nth-child(6):contains('�ֹ����')" ).on("click" , function() {
				alert("�ֹ���� Ŭ�� OK")
				alert($(this).children("input").val());
				//self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$(this).children("input").val()+"&tranCode=400";
		
			});
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(  "td:nth-child(6)" ).css("color" , "#5F04B4");
			
			
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
	       <h3>���� ��� ��ȸ</h3>
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
            <th align="left">���¼���</th>
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
				<c:if test="${purchase.quantity==0 }">${purchase.purchaseProd.price}</c:if>��</td>
			  <td align="left">����
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">���ſϷ�</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">�����</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='300'}">��ۿϷ�</c:if>
				<c:if test="${! empty purchase.tranCode && purchase.tranCode=='400'}">�ֹ����</c:if>
				���� �Դϴ�.</td>
			  
			  <td align="left">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='100' }">�ֹ����</c:if>
			  	<input type="hidden" name = "tranNo" value="${purchase.tranNo  }">
			  	<c:if test="${! empty purchase.tranCode && purchase.tranCode=='200'}">��ǰ����</c:if>
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