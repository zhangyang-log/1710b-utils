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
	$(function() {
		$.post("selectBrand", function(obj) {
			for ( var i in obj) {
				var op = "<option value='"+obj[i].bid+"'>" + obj[i].bname
						+ "</option>"
				$("[name='brand.bid']").append(op)
			}
			$("[name='brand.bid']").val("${goods.brand.bid}");
		}, "json");
		$.post("selectKind", function(obj1) {
			for ( var i in obj1) {
				var op1 = "<option value='"+obj1[i].kid+"'>" + obj1[i].kname
						+ "</option>"
				$("[name='kind.kid']").append(op1)
			}
			$("[name='kind.kid']").val("${goods.kind.kid}");
		}, "json");
	})
</script>

<body>
	<div align="center">
		<p>
			商品名称:<input name="gname" value="${goods.gname }">
		</p>
		<p>
			英文名称:<input name="ename" value="${goods.ename }">
		</p>

		<p>
			尺寸:<input name="size" value="${goods.size }">
		</p>
		<p>
			单价(元):<input name="price" value="${goods.price }">
		</p>
		<p>
			数量:<input name="num" value="${goods.num }">
		</p>
		<p>
			标签:<input name="biao" value="${goods.biao }">
		</p>
		<p>
			商品种类:<select name="kind.kid">
			</select>
		</p>
		<p>
			商品品牌: <select name="brand.bid"><br>
			</select>
		</p>
		<p>
			<a href="queryAll"><input type="button" value="返回"></a>
		</p>
	</div>
</body>
</html>