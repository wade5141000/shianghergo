<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<head>
<meta charset="UTF-8">
<title>平台留言</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script> -->
</head>
<style>
#contact-area {
	padding: 20px 0 60px;
}

.contact-box {
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 50px 50px 35px;
	background-color: #fff;
	border-radius: 6px;
}

.contact-box input {
	height: 50px;
	border: 1px solid #f7f6f5;
	font-size: 15px;
	background-color: #f7f6f5;
	font-weight: 500
}

.contact-box textarea {
	border: 1px solid #f7f6f5;
	padding-top: 10px;
	background-color: #f7f6f5;
	font-size: 15px;
	font-weight: 500
}

.contact-box button {
	background-color: #325eff;
	border: 0;
	color: #fff;
	padding: 10px 30px;
	border-radius: 4px;
	cursor: pointer;
	outline: 0;
	font-weight: 500;
	font-size: 15px
}

.contact-box button:hover {
	background-color: #0f39cf;
}

body {
	margin: 0px;
	padding: 0px;
	background: #fff url('images/bbg06.png') center center fixed ;　
}
</style>
<body>
<div>
<!-- 	<table border="1" class="table1"> -->
<jsp:include page="eric/header.jsp" />
	<div  style="padding-bottom: 500px;">
		<jsp:include page="shianghergo/../BlackLine.jsp" />
<div style="padding-left: 350px;padding-right: 350px;">
	<section id="contact-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 offset-lg-1">
					<div class="contact-box text-center">
						<form id="ajax-contact" action="saveMessage.do" method="post">
							<input type="hidden" name="member_id" value="${mm.id}" /> <input
								type="hidden" name="target" value="${mmm.id}" />
							<div class="form-group row">
								<div class="col-lg-3">
									<p class="form-control-static">收件人:${mmm.name}</p>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="標題">
							</div>
							<div class="form-group">
								<textarea class="form-control" id="contents" name="contents"
									rows="10" placeholder="留言内容*" required="required"></textarea>
							</div>
							<div>
								<input type="hidden" name="status" value="1" />
							</div>
							<button type="submit">提 交</button>
							<div id="form-messages"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	</div>
	</div>
	<jsp:include page="eric/foot.jsp" />
	<script src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>