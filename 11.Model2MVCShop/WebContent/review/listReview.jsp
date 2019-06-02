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

	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/getProduct").submit();
	}
	
	//============= userId 에 회원정보보기  Event  처리 (double Click)=============
	 $(function() {
		 
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(2)").on("click" , function() {

			var reviewNo = $(this).children("input").val().trim();
			alert(reviewNo);
			
			$.ajax( 
					{
						url : "/review/json/getReview/"+reviewNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							alert(status);
							
							var displayValue = 
							"<h6>"+JSONData.reviewDetail+"<br/>" +
							"이미지 : <img src=/images/uploadFiles/"+JSONData.reviewFile+"/><br/>"
							+"</h6>";
							$("h6").remove();
							$( "#"+reviewNo+"" ).html(displayValue);
						}
				});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
	});	
	//////////////////////////////////////////////////////
	 $(function() {
		
			$(  "td:nth-child(5):contains('수정')").on("click" , function() {
				var reviewNo =$(this).children("input").val();
				alert(reviewNo)
				self.location = "/review/updateReviewView?reviewNo="+reviewNo;
				
			});
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
	       <h5>REVIEW</h5>
	    </div>
	    
	   <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">

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
            <th align="center">NO</th>
            <th align="left" >TITLE</th>
            <th align="left">POSTED BY</th>
            <th align="left">DATE</th>
            <th align="left" class ="glyphicon glyphicon-pencil"></th>
             
          </tr>
        </thead>
       
		<tbody>

		  <c:set var="i" value="0" />
		  <c:forEach var="review" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${i} </td>
			  <td align="left">${review.reviewTitle}<p  id = "${review.reviewNo}"></p><input type="hidden" value="${review.reviewNo}"> </td>
			  <td align="left">${review.reUser.userId}</td>
			  <td align="left">${review.reviewDate}</td>
			  <td align="left">
			  <c:if test="${review.reUser.userId eq user.userId }"><input type="hidden" value="${review.reviewNo}">수정</c:if>
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