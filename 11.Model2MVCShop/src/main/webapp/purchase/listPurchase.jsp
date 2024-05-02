
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.Map"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �����ȸ</title>


<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">
	function fncGetUserList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action",
				"/purchase/listPurchase").submit();

	}

	$(function() {

		$("td:nth-child(7) > i").on(
				"click",
				function() {
					//alert($(this).children().val());
					//self.location="/purchase/getPurchase?tranNo="+$(this).children().val()+"&userId=${sessionScope.user.userId}"
					var tranNo = $(this).next().val();
					//var userId = ${sessionScope.user.userId};
					//alert(tranNo);
					$.ajax({
						url : "/purchase/json/getPurchase/" + tranNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},

						success : function(JSONData, status) {
							var displayValue = "<h5>" + "��ǰ��ȣ: "
									+ JSONData.purchaseProd.prodNo + "</br>"
									+ "������ ���̵�: " + JSONData.buyer.userId
									+ "</br>" + "���Ź��: "
									+ JSONData.paymentOption + "</br>"
									+ "������ �̸�: " + JSONData.receiverName
									+ "</br>" + "������ ����ó: "
									+ JSONData.receiverPhone + "</br>"
									+ "������ �ּ�: " + JSONData.divyAddr + "</br>"
									+ "��������: " + JSONData.divyDate + "</br>"
									+ "�ֹ���: " + JSONData.orderDate + "</br>"
									+ "���� ��û ����: " + JSONData.divyRequest
									+ "</br>" + "</h5>";
							//alert(displayValue);						
							$("h5").remove();
							$("#" + tranNo + "").html(displayValue);
						}
					});

				});
		$(".ct_list_pop td:nth-child(1)").css("color", "blue");
		
		$(".ct_list_pop td:nth-child(1)").on("click",function()
				{
					//alert($(this).children().val());
					self.location="/purchase/getPurchase?tranNo="+$(this).children().val()+"&userId=${sessionScope.user.userId}"
				});
		
		$(".ct_list_pop td:nth-child(2)").on("click",function(){
			self.location="/user/getUser?userId=${sessionScope.user.userId}"

			//alert($(this).text().trim());
	});
		

	/* 	$(".ct_list_pop td:nth-child(3)").on(
				"click",
				function() {
					//self.location="/user/getUser?userId=${sessionScope.user.userId}"

					//alert($(this).text().trim());
					//
					var userId = $(this).text().trim();
					$.ajax(

					{
						url : "/user/json/getUser/" + userId,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							var displayValue = "<h3>" + "���̵� : "
									+ JSONData.userId + "<br/>" + "�� �� : "
									+ JSONData.userName + "<br/>" + "�̸��� : "
									+ JSONData.email + "<br/>" + "ROLE : "
									+ JSONData.role + "<br/>" + "����� : "
									+ JSONData.regDataString + "<br/>"
									+ "</h3>";

							//	alert(displayValue);
							$("h3").remove();
							$("#" + userId + "").html(displayValue);

						}
					});
				}); */

		$(".ct_list_pop td:nth-child(11) > a").on(
				"click",
				function() {
					//alert($(this).children().val());
					//alert($(this).closest('tr').find('#tranNo').val());
					self.location = "/purchase/updateTranCode?tranNo="
							+ $(this).closest('tr').find('#tranNo').val()
							+ "&tranCode=" + $(this).children().val()
							+ "&menu=purchase"
				});

		$(".ct_list_pop:nth-child(2n)").css("background-color", "whitesmoke");
	});
</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<div class="page-header text-info">���� �����ȸ</div>
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					
					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>

		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>

					<th align="left">ȸ��ID</th>

					<th align="left">ȸ����</th>

					<th align="left">��ȭ��ȣ</th>
					<th align="left">�����Ȳ</th>
					<th align="left">��������</th>
					<th align="left">��������</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list }">
					<c:set var="i" value="${i+1 }" />


					<tr class="ct_list_pop">
						<td align="center">${i }<input type="hidden" id="tranNo"
							value="${purchase.tranNo}">
						</td>
						<td align="left"><input type="hidden" name="userId"
							value="${purchase.buyer.userId}" /> ${purchase.buyer.userId}</td>

						<td align="left">${purchase.receiverName }</td>

						<td align="left">${purchase.receiverPhone}</td>

						<td align="left">���� 
						<c:choose>
								<c:when test="${empty purchase.tranCode }">

								</c:when>
								<c:otherwise>
									<c:if test="${purchase.tranCode eq '1'}">���ſϷ�</c:if>
									<c:if test="${purchase.tranCode eq '2'}">�����
						</c:if>
									<c:if test="${purchase.tranCode eq '3'}">��ۿϷ�</c:if>
								</c:otherwise>

							</c:choose> �����Դϴ�.
						<td align="left"><c:if
								test="${not empty purchase.tranCode && purchase.tranCode eq '2'}">
								<a>����</a>
							</c:if> <input type="hidden" id="tranCode" value="${purchase.tranCode}" />
						</td>
						<td align="left"><i class="glyphicon glyphicon-search"
							id="${purchase.tranNo}"></i> <input type="hidden"
							value="${purchase.tranNo}"></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<jsp:include page="../common/pageNavigator_new.jsp" />
</body>
</html>