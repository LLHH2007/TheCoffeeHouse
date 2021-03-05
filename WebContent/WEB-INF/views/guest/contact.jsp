<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Liên hệ</title>
<body>
	<script>
		document.getElementById("contactActive").className = "active";
	</script>
	<!-- 
Body Section 
-->
	<hr class="soften">
	<div class="well well-small">
		<h1>Visit us</h1>
		<hr class="soften">
		<div class="row-fluid">
			<div class="span8 relative">
				<iframe
					src="http://maps.google.co.uk/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Newbury+Street,+Boston,+MA,+United+States&amp;aq=1&amp;oq=NewBoston,+MA,+United+States&amp;sll=42.347238,-71.084011&amp;sspn=0.014099,0.033023&amp;ie=UTF8&amp;hq=Newbury+Street,+Boston,+MA,+United+States&amp;t=m&amp;ll=42.348994,-71.088248&amp;spn=0.001388,0.006276&amp;z=18&amp;iwloc=A&amp;output=embed"
					frameborder="0" marginwidth="0" marginheight="0" scrolling="no"
					style="width: 100%; height: 350px"></iframe>

				<div class="absoluteBlk">
					<div class="well wellsmall">
						<h4>Contact Details</h4>
						<h5>
							2601 Mission St.<br> San Francisco, CA 94110<br>
							<br> info@mysite.com<br> ﻿Tel 123-456-6780<br> Fax
							123-456-5679<br> web:wwwmysitedomain.com
						</h5>
					</div>
				</div>
			</div>

			<div class="span4">
				<h4>Email Us</h4>
				<form class="form-horizontal">
					<fieldset>
						<div class="control-group">

							<input class="input-xlarge" type="text" placeholder="name">

						</div>
						<div class="control-group">

							<input class="input-xlarge" type="text" placeholder="email">

						</div>
						<div class="control-group">

							<input class="input-xlarge" type="text" placeholder="subject">

						</div>
						<div class="control-group">
							<textarea class="input-xlarge" id="textarea" rows="3"></textarea>

						</div>

						<button class="shopBtn" type="submit">Send email</button>

					</fieldset>
				</form>
			</div>
		</div>


	</div>


</body>