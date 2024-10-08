
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	$(function(){
		$("button:contains('확인')").on("click",function(){
			self.location.href="/product/listProduct?menu=manage";
		});
	});
	
	$(function(){
		$("button:contains('추가등록')").on("click",function(){
			self.location.href="/product/addProductView.jsp";
		});
	});
	
</script>
<title>등록된 상품</title>

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header">
		<br>
		<br>
		<br>
			<h3 class=" text-info">등록된 상품</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품번호</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>상품명</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>상품이미지</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>상품상세정보</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>제조일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>가격</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>등록일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">확인</button>
				<button type="button" class="btn btn-primary">추가등록</button>
			</div>

		</div>


		<br />

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
