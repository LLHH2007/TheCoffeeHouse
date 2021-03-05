<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<body>
	<script>
		document.getElementById("nav-threeColumn").className = "active";
	</script>

	<div id="wrapper">
		<section>
			<div class="data-container"></div>
			<div id="pagination-demo1"></div>
			<div class="data-container"></div>
			<div id="pagination-demo2"></div>
		</section>
	</div>
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	
	<script src="<c:url value="/assets/js/Pagination.js" />"></script>
	<script src="<c:url value="/assets/js/Pagination.min.js" />"></script>
	<script>
		$(function() {
			(function(name) {
				var container = $('#pagination-' + name);
				var sources = function() {
					var result = [];

					for (var i = 1; i < 196; i++) {
						result.push(i);
					}

					return result;
				}();

				var options = {
					dataSource : sources,
					callback : function(response, pagination) {
						window.console && console.log(response, pagination);

						var dataHtml = '<ul>';

						$.each(response, function(index, item) {
							dataHtml += '<li>' + item + '</li>';
						});

						dataHtml += '</ul>';

						container.prev().html(dataHtml);
					}
				};

				//$.pagination(container, options);

				container.addHook('beforeInit', function() {
					window.console && console.log('beforeInit...');
				});
				container.pagination(options);

				container.addHook('beforePageOnClick', function() {
					window.console && console.log('beforePageOnClick...');
					//return false
				});
			})('demo1');

			(function(name) {
				var container = $('#pagination-' + name);
				container
						.pagination({
							dataSource : 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
							locator : 'items',
							totalNumber : 120,
							pageSize : 20,
							ajax : {
								beforeSend : function() {
									container.prev().html(
											'Loading data from flickr.com ...');
								}
							},
							callback : function(response, pagination) {
								window.console
										&& console
												.log(22, response, pagination);
								var dataHtml = '<ul>';

								$.each(response, function(index, item) {
									dataHtml += '<li>' + item.title + '</li>';
								});

								dataHtml += '</ul>';

								container.prev().html(dataHtml);
							}
						})
			})('demo2');
		})
	</script>
</body>