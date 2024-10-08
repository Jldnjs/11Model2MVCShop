
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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


<script type="text/javascript">

	$(function(){
		$("a[href='#']").on("click", function() {
			$("form")[0].reset();
		});
		
		$("button.btn.btn-primary").on("click",function(){
			
			$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
			//window.location="/purchase/addPurchase";
		});
		
	});
	
	$(function(){
		$(".divyDate").datepicker({
			dateFormat:"yy-mm-dd"
		});
	});
	
</script>

<title>상품구매</title>

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<br>
		<h1 class="bg-primary text-center">상 품 구 매</h1>
		
		<form class="form-horizontal">
		
			<br>
			<div class="form-group">
				<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
				<div class="col-sm-4" >
					${product.prodNo}
					<input type="hidden" name="prodNo" value=" ${product.prodNo }">
				</div>
			</div>
			<div class="form-group">
				<label for="prodName"
					class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4" >
					${product.prodName}
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					${product.prodDetail}
				</div>
			</div>
			
			<div class="form-group">
				<label for="manuDate"
					class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					${product.manuDate}
				</div>
			</div>
			
			<div class="form-group">
				<label for="price"
					class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					${product.price}
				</div>
			</div>
			
			<div class="form-group">
				<label for="regDate"
					class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
				<div class="col-sm-4">
					${product.regDate}
				</div>
			</div>
			<div class="form-group">
				<label for="buyerId"
					class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				<div class="col-sm-4">
					${sessionScope.user.userId}
				</div>
			</div>
			
			<div class="form-group">
				<label for="paymentOption"
					class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
				<div class="col-sm-4">
				
				
					<select name="paymentOption" class="form-control">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="receiverName"
					class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName"
						name="receiverName" value="${sessionScope.user.userName}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="receiverPhone"
					class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone"
						name="receiverPhone" value="${sessionScope.user.phone}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
				<div class="col-sm-4">
					<!--<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자" >-->

					<input type="text" class="form-control" id="divyAddr"
						name="divyAddr" value="${sessionScope.user.addr}">
				</div>
				
				

			</div>

			<div class="form-group">
				<label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest" name="divyRequest"
						placeholder="구매요청사항">
				</div>
			</div>
			<div class="form-group">
				<label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control divyDate"  readonly="readonly" id="divyDate"
					name="divyDate" >
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">구 &nbsp;매</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		</form>
	
	</div>
</body>
</html>