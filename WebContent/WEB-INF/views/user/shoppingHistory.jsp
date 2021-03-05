<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Lịch sử mua hàng</title>
</head>
<body>
	<c:if test="${not empty message}">
		<script type="text/javascript">
			var message = "${message}";
			alert(message);
		</script>
	</c:if>
	<div class="row">
		<div class="span16" style="margin-left: -100px;">
			<ul class="nav nav-tabs" id="productDetail">
				<li class="active"><a href="#home" data-toggle="tab">Hóa
						đơn</a></li>
				<li><a href="#profile" data-toggle="tab">Chi tiết hóa đơn </a></li>
			</ul>
			<div class="tab-content tabWrapper" id="myTabContent">
				<div class="tab-pane fade active in" id="home">
					<table id="example" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>Id</th>
								<th>Khách hàng</th>
								<th>Ngày</th>
								<th>Thành tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${bill}">
								<tr>
									<td>${item.id}</td>
									<td>${item.user}</td>
									<td>${item.date}</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${item.totalPrice}" /></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Khách hàng</th>
								<th>Ngày</th>
								<th>Thành tiền</th>
							</tr>
						</tfoot>
					</table>
				</div>

				<div class="tab-pane fade" id="profile">
					<table id="example2" class="display" style="width: 100%">
						<thead>
							<tr>
								<th>Id</th>
								<th>Bill</th>
								<th>Sản phẩm</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${billDetails}">
								<tr>
									<td>${item.id}</td>
									<td>${item.bill}</td>
									<td>${item.product}</td>
									<td>${item.quantity}</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${item.totalPrice}" /></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Bill</th>
								<th>Sản phẩm</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>


	<content tag="script"> <script>
		$(document)
				.ready(
						function() {
							// Setup - add a text input to each footer cell
							$('#example thead tr').clone(true).appendTo(
									'#example thead');
							$('#example thead tr:eq(1) th')
									.each(
											function(i) {
												var title = $(this).text();
												$(this)
														.html(
																'<input type="text" placeholder="Search '+title+'" />');

												$('input', this)
														.on(
																'keyup change',
																function() {
																	if (table
																			.column(
																					i)
																			.search() !== this.value) {
																		table
																				.column(
																						i)
																				.search(
																						this.value)
																				.draw();
																	}
																});
											});
							var table = $('#example')
									.DataTable(
											{
												orderCellsTop : true,
												fixedHeader : true,
												"footerCallback" : function(
														row, data, start, end,
														display) {
													var api = this.api(), data;

													// Remove the formatting to get integer data for summation
													var intVal = function(i) {
														return typeof i === 'string' ? i
																.replace(
																		/[\$,]/g,
																		'') * 1
																: typeof i === 'number' ? i
																		: 0;
													};

													// Total over all pages
													total = api
															.column(3)
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Total over this page
													pageTotal = api
															.column(
																	3,
																	{
																		page : 'current'
																	})
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Update footer
													$(api.column(3).footer())
															.html(
																	+pageTotal
																			+ 'đ'
																			+ '<br>'
																			+ '(Tổng cộng: '
																			+ total
																			+ ' đ)');
												}
											});
							// Setup - add a text input to each footer cell
							$('#example2 thead tr').clone(true).appendTo(
									'#example2 thead');
							$('#example2 thead tr:eq(1) th')
									.each(
											function(i) {
												var title = $(this).text();
												$(this)
														.html(
																'<input type="text" placeholder="Search '+title+'" />');

												$('input', this)
														.on(
																'keyup change',
																function() {
																	if (table
																			.column(
																					i)
																			.search() !== this.value) {
																		table
																				.column(
																						i)
																				.search(
																						this.value)
																				.draw();
																	}
																});
											});
							var table2 = $('#example2')
									.DataTable(
											{
												orderCellsTop : true,
												fixedHeader : true,
												"footerCallback" : function(
														row, data, start, end,
														display) {
													var api = this.api(), data;

													// Remove the formatting to get integer data for summation
													var intVal = function(i) {
														return typeof i === 'string' ? i
																.replace(
																		/[\$,]/g,
																		'') * 1
																: typeof i === 'number' ? i
																		: 0;
													};

													// Total over all pages
													total = api
															.column(4)
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Total over this page
													pageTotal = api
															.column(
																	4,
																	{
																		page : 'current'
																	})
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Update footer
													$(api.column(4).footer())
															.html(
																	+pageTotal
																			+ 'đ'
																			+ '<br>'
																			+ '(Tổng cộng: '
																			+ total
																			+ ' đ)');
												}
											});
						});
	</script> </content>
</body>
</html>