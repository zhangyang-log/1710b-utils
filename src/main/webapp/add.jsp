<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
</head>
<script type="text/javascript">
	$(
			function() {
				$.post("selectBrand", function(obj) {
					for ( var i in obj) {
						var op = "<option value='"+obj[i].bid+"'>"
								+ obj[i].bname + "</option>"
						$("[name='brand.bid']").append(op)
					}
				}, "json")
				$.post("selectKind", function(obj1) {
					for ( var i in obj1) {
						var op1 = "<option value='"+obj1[i].kid+"'>"
								+ obj1[i].kname + "</option>"
						$("[name='kind.kid']").append(op1)
					}
				}, "json")
			})
</script>
<body>
	<form action="#">
		<p>
			商品名称:<input name="gname">
		</p>
		<p>
			英文名称:<input name="ename">
		</p>

		<p>
			尺寸:<input name="size">
		</p>
		<p>
			单价(元):<input name="price">
		</p>
		<p>
			数量:<input name="num">
		</p>
		<p>
			标签:<input name="biao">
		</p>
		<p>
			商品种类:<select name="kind.kid">
		</p>
		<p>
			<input type="button" value="提交" onclick="add()">
		</p>
		商品品牌: <select name="brand.bid"><br>
	</form>

	<script type="text/javascript">
		function add() {
			$.post("add", $("form").serialize(), function(i) {
				if (i > 0) {
					if (confirm("新增成功")) {
						location = "queryAll";
					}
				} else {
					if (confirm("新增成功")) {
						location = "add.jsp";
					}
				}
			}, "json")
		}
	</script>
</body>
</html>