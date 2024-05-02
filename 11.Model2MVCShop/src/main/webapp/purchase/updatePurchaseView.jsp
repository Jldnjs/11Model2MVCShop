
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>�������� ����</title>


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


	<script type="text/javascript">
	$(function(){
		$("a[href='#']").on("click", function() {
			$("form")[0].reset();
		});
		$("button.btn.btn-primary").on("click",function(){
			//alert($(this).children().val());
			//self.location ="/purchase/updatePurchase?tranNo="+$(this).children().val();
			$("form").attr("method","POST").attr("action","/purchase/updatePurchase").submit();
		});
	});
	
	$(function(){
		$("#divyDate").datepicker({
			dateFormat:"yy-mm-dd"
		});
	});
	
</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	<div class="page-header">
	       <h3 class=" text-info">���� ���� ����</h3>
	    </div>

<form class="form-horizontal">


<div class="form-group">
<input type="hidden" name="tranCode" value=" ${purchase.tranCode }">
<input type="hidden" name="tranNo" value=" ${purchase.tranNo }">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="buyerId"
					name="buyerId" value="${purchase.buyer.userId }">
			</div>
		</div>

		<div class="form-group">
			<label for="prodDetail"
				class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
			<div class="col-sm-4">
			
				<select name="paymentOption" 	class="form-control" >
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
			<div class="col-sm-4">
					
					 <input
					type="text" id="receiverName" name="receiverName"
					class="form-control" value="${purchase.receiverName}">
			</div>
		</div>

		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="receiverPhone" name="receiverPhone"
					value="${purchase.receiverPhone}">
			</div>
		</div>

		<div class="form-group">
			<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyAddr"
					name="divyAddr" value="${purchase.divyAddr}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="divyRequest"
					name="divyRequest" value="${purchase.divyRequest }">
			</div>
		</div>
		
		<div class="form-group">
			<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
			<div class="col-sm-4">
				<input type="text" class="form-control"  readonly="readonly" id="divyDate"
					name="divyDate" value="${purchase.divyDate}">
					
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary">�� &nbsp;��</button>
				<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
			</div>
		</div>
	</form>
	<!-- form Start /////////////////////////////////////-->
	</div>
</body>
</html>