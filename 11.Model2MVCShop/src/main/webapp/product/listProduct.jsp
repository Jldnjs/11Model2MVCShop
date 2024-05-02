
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<c:choose>
	<c:when test="${param.menu=='manage'}">
		<title>상품 관리</title>
	</c:when>
	<c:otherwise>
		<title>상품 목록조회</title>
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

	//추가된 부분: 검색, prodNo link Event 연결 및 처리
	$(function() {

		//검색 event연결 처리부분
		//dom object get 3가지 방법: $(tagName)/(#id)/$(.className)
		//$("tagName.className:filter함수")사용함
		$("button:contains('검색')").on("click", function() {
			//alter($("td.ct_btn01:contains('검색')").html());
			fncGetUserList(1);
		});

		$("td:nth-child(2)").on(
				"click",
				function() {
					self.location = "/product/getProduct?prodNo="
							+ $($(this).children()).val()
							+ "&menu=${param.menu}";

				})

		//$(".className tagName:filter함수")사용함
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

							var displayValue = "<h5>" + "상품번호 : "
									+ JSONData.prodNo + "<br/>" + "상품명 : "
									+ JSONData.prodName + "<br/>" + "상품이미지 : "
									+ JSONData.fileName + "<br/>" + "상품상세정보 : "
									+ JSONData.prodDetail + "<br/>" + "제조일자 : "
									+ JSONData.manuDate + "<br/>" + "가격 : "
									+ JSONData.price + "<br/>" + "등록일자 : "
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
			상품 관리
		</c:when>
				<c:otherwise>
			상품 목록조회
		</c:otherwise>
			</c:choose>
		</div>

		<!-- table위쪽 검색start -->
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected":"" }>상품번호</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected":"" }>상품명</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected":"" }>상품가격</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" name="searchKeyword" placeholder="검색어"
							value="${!empty search.searchKeyword ? search.searchKeyword: '' }"
							class="form-control" />
					</div>

					<button type="button" class="btn btn-default">검색</button>
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>

		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>

					<th align="left">상품명</th>

					<th align="left">가격</th>

					<th align="left">등록일</th>
					<th align="left">현재상태</th>
					<th align="left">간략정보</th>
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
								판매중
							</c:when>
								<c:when test="${product.proTranCode eq '1'}">
									구매완료
									<c:if test="${menu == 'manage' }">
										<input type="hidden" id="tranNo" value="${product.tranNo}">
										<input type="hidden" id="tranCode"
											value="${product.proTranCode}">
										<a>배송하기</a>
										<%-- <a href="/purchase/updateTranCode?tranNo=${product.tranNo}&tranCode=${product.proTranCode}&menu=product">배송하기</a>  --%>
									</c:if>
								</c:when>
								<c:when test="${product.proTranCode eq '2'}">
									배송중
								</c:when>
								<c:otherwise>
									배송완료
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
