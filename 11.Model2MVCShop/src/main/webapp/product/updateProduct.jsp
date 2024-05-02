<%-- <%@page import="com.model2.mvc.service.domain.Product"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
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
<!-- javascript -->
<script type="text/javascript">
	// Ȯ�� / �߰� ����
	$(function(){
		$("button:contains('Ȯ��')").on("click",function(){
			self.location.href="/product/listProduct?menu=search";
		});
	});
	
	$(function(){
		$("button:contains('�߰�����')").on("click",function(){
			self.location.href="/product/getProduct?prodNo=${product.prodNo}&menu=manage";
		});
	});
</script>
<title>������ ��ǰ</title>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header">
			<br> <br> <br>
			<h3 class=" text-info">������ ��ǰ</h3>
		</div>
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ��ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ�̹���</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>�������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">Ȯ��</button>
				<button type="button" class="btn btn-primary">�߰�����</button>
			</div>

		</div>


		<br />

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>
