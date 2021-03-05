<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doanh thu</title>
</head>
<body>
	<script>
		document.getElementById("nav-revenue").className = "active";
	</script>
	<div class="row">
		<div class="span12">
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
						});
	</script> </content>
</body>
</html>