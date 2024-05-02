
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<c:choose>
	<c:when test="${param.menu=='manage'}">
		<title>��ǰ ����</title>
	</c:when>
	<c:otherwise>
		<title>��ǰ �����ȸ</title>
	</c:otherwise>
</c:choose>


<script type="text/javascript">
	function fncGetUserList(currentPage) {
		//document.getElementById("currentPage").value=currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action",
				"/product/listProduct?menu=${param.menu}").submit();
	}

	//�߰��� �κ�: �˻�, prodNo link Event ���� �� ó��
	$(function() {

		//�˻� event���� ó���κ�
		//dom object get 3���� ���: $(tagName)/(#id)/$(.className)
		//$("tagName.className:filter�Լ�")�����
		$("button:contains('�˻�')").on("click", function() {
			//alter($("td.ct_btn01:contains('�˻�')").html());
			fncGetUserList(1);
		});

		$("td:nth-child(2)").on(
				"click",
				function() {
					self.location = "/product/getProduct?prodNo="
							+ $($(this).children()).val()
							+ "&menu=${param.menu}";

				})

		//$(".className tagName:filter�Լ�")�����
		$("td:nth-child(6) > i").on(
				"click",
				function() {

					var prodNo = $(this).next().val();
					$.ajax({
						url : "/product/json/getProduct/" + prodNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {

							//alert("JSONData: \n"+JSONData);

							var displayValue = "<h5>" + "��ǰ��ȣ : "
									+ JSONData.prodNo + "<br/>" + "��ǰ�� : "
									+ JSONData.prodName + "<br/>" + "��ǰ�̹��� : "
									+ JSONData.fileName + "<br/>" + "��ǰ������ : "
									+ JSONData.prodDetail + "<br/>" + "�������� : "
									+ JSONData.manuDate + "<br/>" + "���� : "
									+ JSONData.price + "<br/>" + "������� : "
									+ JSONData.regDate + "<br/>" + "</h5>";
							$("h5").remove();
							$("#" + prodNo + "").html(displayValue);
						}
					});
				});

		//$("td:nth-child(6) > i").css("background-color","yellow");

		$("td:nth-child(5) > a").on(
				"click",
				function(event) {
					//alert($(this).parent().children("#tranNo").val());
					//alert($(this).parent().children("#tranCode").val());
					window.location = "/purchase/updateTranCode?tranNo="
							+ $(this).parent().children("#tranNo").val()
							+ "&tranCode="
							+ $(this).parent().children("#tranCode").val()
							+ "&menu=product"
				});

		$("td:nth-child(2)").css("color", "blue");

		$(".ct_list_pop:nth-child(4n-6)").css("background-color", "whitesmoke");

	});
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<div class="page-header text-info">
			<c:choose>
				<c:when test="${param.menu=='manage'}">
			��ǰ ����
		</c:when>
				<c:otherwise>
			��ǰ �����ȸ
		</c:otherwise>
			</c:choose>
		</div>

		<!-- table���� �˻�start -->
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected":"" }>��ǰ��ȣ</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected":"" }>��ǰ��</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected":"" }>��ǰ����</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" name="searchKeyword" placeholder="�˻���"
							value="${!empty search.searchKeyword ? search.searchKeyword: '' }"
							class="form-control" />
					</div>

					<button type="button" class="btn btn-default">�˻�</button>
					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>

		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>

					<th align="left">��ǰ��</th>

					<th align="left">����</th>

					<th align="left">�����</th>
					<th align="left">�������</th>
					<th align="left">��������</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list }">
					<c:set var="i" value="${ i+1 }" />

					<tr>
						<td align="center">${i }</td>
						<td align="left">${product.prodName}<input type="hidden"
							name="prodNo" value="${product.prodNo}">
						</td>
						<td align="left">${product.price}</td>
						<td align="left">${product.regDate}</td>
						<td align="left"><c:choose>
								<c:when test="${empty product.proTranCode}">
								�Ǹ���
							</c:when>
								<c:when test="${product.proTranCode eq '1'}">
									���ſϷ�
									<c:if test="${menu == 'manage' }">
										<input type="hidden" id="tranNo" value="${product.tranNo}">
										<input type="hidden" id="tranCode"
											value="${product.proTranCode}">
										<a>����ϱ�</a>
										<%-- <a href="/purchase/updateTranCode?tranNo=${product.tranNo}&tranCode=${product.proTranCode}&menu=product">����ϱ�</a>  --%>
									</c:if>
								</c:when>
								<c:when test="${product.proTranCode eq '2'}">
									�����
								</c:when>
								<c:otherwise>
									��ۿϷ�
								</c:otherwise>

							</c:choose></td>
						<td align="left"><i class="glyphicon glyphicon-search"
							id="${product.prodNo}"></i> <input type="hidden"
							value="${product.prodNo}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/pageNavigator_new.jsp" />

</body>
</html>
