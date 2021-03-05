<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<title>General</title>
<body>

	<script>
		document.getElementById("nav-general").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<div class="row">
		<div class="span3" id="sidebar">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${category}">
						<li><a href="<c:url value ="/product/category/${item.id}"/>"><span
								class="icon-circle-blank"></span>${item.name}</a></li>
					</c:forEach>
					<li style="border: 0">&nbsp;</li>
				</ul>
			</div>
			<div class="well well-small">
				<a href="#"><img alt="payment method paypal"
					src="assets/img/paypal.jpg"></a>
			</div>
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a> <span class="divider">/</span></li>
				<li class="active">Page Title</li>
			</ul>
			<div class="well well-small">
				<h1>Title of the page</h1>
				<h2>Title of the page</h2>
				<h3>Title of the page</h3>
				<h4>Title of the page</h4>
				<h5>Title of the page</h5>
				<h6>Title of the page</h6>
				<hr class="soft">
				<h2>List of the text</h2>

				<h3>Unordered List</h3>
				<br>
				<ul>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus.</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta.</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta felis .</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta felis at
						sollicitudin.</li>
				</ul>
				<h3>Ordered List</h3>
				<br>
				<ol>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus.</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta.</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta felis .</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam elementum varius dapibus. Sed hendrerit porta felis at
						sollicitudin.</li>
				</ol>
				<hr class="soft">
				<h2>Paragraph</h2>
				<p>Sed at nunc ac neque semper fermentum. Proin diam sem, semper
					fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et
					vehicula imperdiet, felis tortor vehicula turpis, non fermentum
					enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium
					sed leo. Cum sociis natoque penatibus et magnis dis parturient
					montes, nascetur ridiculus mus. In viverra porta est, consequat
					elementum metus tristique a. Mauris tempus tellus a metus dapibus
					faucibus egestas lectus consectetur. Integer libero dolor, luctus
					non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam
					pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis
					ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.</p>

				<h5>Lorem ipsum dolor sit amet</h5>
				<br>
				<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur
					ultrices commodo mauris, sit amet faucibus lectus fermentum in.
					Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet
					urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit
					sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing
					lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac
					erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec
					nisi eleifend auctor.</p>

				<hr class="soft">
				<h2>Table</h2>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
				<br> <br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="2">1</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<td>Mark</td>
							<td>Otto</td>
							<td>@TwBootstrap</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<td>3</td>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<h2>Form with validation states</h2>
				<br>

				<form class="bs-docs-example form-horizontal">
					<div class="control-group warning">
						<label class="control-label" for="inputWarning">Input with
							warning</label>
						<div class="controls">
							<input id="inputWarning" type="text"> <span
								class="help-inline">Something may have gone wrong</span>
						</div>
					</div>
					<div class="control-group error">
						<label class="control-label" for="inputError">Input with
							error</label>
						<div class="controls">
							<input id="inputError" type="text"> <span
								class="help-inline">Please correct the error</span>
						</div>
					</div>
					<div class="control-group info">
						<label class="control-label" for="inputInfo">Input with
							info</label>
						<div class="controls">
							<input id="inputInfo" type="text"> <span
								class="help-inline">Username is taken</span>
						</div>
					</div>
					<div class="control-group success">
						<label class="control-label" for="inputSuccess">Input with
							success</label>
						<div class="controls">
							<input id="inputSuccess" type="text"> <span
								class="help-inline">Woohoo!</span>
						</div>
					</div>
				</form>

				<h5>Lorem ipsum dolor sit amet</h5>
				<br>
				<p>Aliquam interdum, ipsum a posuere dictum, tellus risus
					blandit dolor, at tristique sapien urna vel purus. Pellentesque in
					dictum urna. Sed feugiat libero sit amet arcu malesuada eu
					convallis dui convallis. Donec facilisis massa a ipsum aliquam
					lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante
					neque, volutpat ac tempor et, bibendum at ligula. Nunc porta
					vestibulum sodales.</p>
			</div>
		</div>
	</div>
	<!-- 
Clients 
-->
	<section class="our_client">
		<hr class="soften">
		<h4 class="title cntr">
			<span class="text">Manufactures</span>
		</h4>
		<hr class="soften">
		<div class="row">
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/1.png"></a>
			</div>
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/2.png"></a>
			</div>
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/3.png"></a>
			</div>
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/4.png"></a>
			</div>
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/5.png"></a>
			</div>
			<div class="span2">
				<a href="#"><img alt="" src="assets/img/6.png"></a>
			</div>
		</div>
	</section>

</body>