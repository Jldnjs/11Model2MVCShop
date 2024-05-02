<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- //////////////////docer -->
<link href="/css/animate.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript" src="../javascript/calendar.js"></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<script type="text/javascript">
	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});
	//$("button.btn.btn-primary").css("background","red");
	$(function() {
		$("a[href='#']").on("click", function() {
			$("form")[0].reset();
		});

	});


	 $(function(){
			$("#manuDate").datepicker({
				dateFormat: "yy-mm-dd"
			});
			
		});


	$("a").css("color", "red");

	function fncAddProduct() {

		var prodName = $("input[name='prodName']").val();
		var prodDetail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		var fileName = $("input[name='fileName']").val();

		if (prodName == null || prodName.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (prodDetail == null || prodDetail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
				.submit();
	}
</script>
<title>��ǰ���</title>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<br>
		<br>
		<br>
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>


		<form class="form-horizontal">
		
			<br>
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��
					ǰ ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName"
						name="prodName" placeholder="��ǰ��">
				</div>
			</div>
			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail"
						name="prodDetail" placeholder="��ǰ������">
				</div>
			</div>
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<!--<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������" >-->

					<input type="text" id="manuDate" readonly="readonly"
						name="manuDate" class="form-control">&nbsp;
				</div>
				
				

			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						placeholder="����">
				</div>
			</div>
			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fileName"
						name="fileName" placeholder="��ǰ�̹���">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>
		</form>

	</div>
</body>
</html>