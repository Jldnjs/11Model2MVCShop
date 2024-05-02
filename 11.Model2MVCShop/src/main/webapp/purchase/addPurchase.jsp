<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<!-- //////// bootstrap, jquery cdn//////////////// -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	  body {
            padding-top : 50px;
        }
    </style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function(){
		$("button:contains('확인')").on("click",function(){
			self.location="/purchase/listPurchase"
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
		<div class="page-header">
			<h3 class=" text-info">다음과 같이 구매가 되었습니다.</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>물품번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자아이디</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매방법</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
			<c:when test="${purchase.paymentOption eq '1' }">현금구매</c:when>
			<c:otherwise>신용구매</c:otherwise>
		</c:choose>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>구매자이름</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자연락처</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매자주소</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>구매요청사항</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>배송희망일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">확인</button>

			</div>

		</div>


		<br />

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
