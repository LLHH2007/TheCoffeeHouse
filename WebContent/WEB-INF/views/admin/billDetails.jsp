<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Chi tiết hóa đơn</title>
</head>
<body>
	<script>
		document.getElementById("nav-billDetails").className = "active";
	</script>
	<table id="example" class="display" style="width: 100%;margin-left: -130px;">
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