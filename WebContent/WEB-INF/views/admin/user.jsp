<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>User management</title>
</head>
<body>
	<script>
		document.getElementById("nav-user").className = "active";
	</script>
	<div class="row">
		<div class="span12">
			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Id</th>
						<th>Tên đăng nhập</th>
						<th>Tên khách hàng</th>
						<th>Số điện thoại</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${user}">
						<tr>
							<td>${item.id}</td>
							<td>${item.username}</td>
							<td>${item.name}</td>
							<td>${item.phoneNumber}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th>Id</th>
						<th>Tên đăng nhập</th>
						<th>Tên khách hàng</th>
						<th>Số điện thoại</th>
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

							var table = $('#example').DataTable({
								orderCellsTop : true,
								fixedHeader : true
							});
						});
	</script> </content>
</body>
</html>