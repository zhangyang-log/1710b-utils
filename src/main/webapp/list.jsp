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
<body>
	<form action="queryAll" method="post">
		<input name="gname" value="${gname }"><input type="submit"
			value="搜索"> <a href="add.jsp"><input type="button"
			value="添加"></a><input type="button" value="批量删除" onclick="dels()">
	</form>
	<table>
		<tr>
			<th><input type="checkbox" onclick="o()">全选</th>
			<th>商品名称</th>
			<th>英文名称</th>
			<th>商品品牌</th>
			<th>商品种类</th>
			<th>尺寸</th>
			<th>单价</th>
			<th>数量</th>
			<th>标签</th>
			<th>图片</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${info.list }" var="v">
			<tr>
				<td><input type="checkbox" value="${v.gid }" name="ck"></td>
				<td>${v.gname }</td>
				<td>${v.ename }</td>
				<td>${v.brand.bname }</td>
				<td>${v.kind.kname }</td>
				<td>${v.size }</td>
				<td>${v.price }</td>
				<td>${v.num }</td>
				<td>${v.biao }</td>
				<td><img src="${v.img }" alt="图片受损" width="50px" height="50px"></td>
				<td><a href="selectOne?gid=${v.gid }"><input type="button"
						value="详情"></a><a href="update.jsp?gid=${v.gid }"><input
						type="button" value="修改"></a><input type="button" value="删除"
					onclick="del(${v.gid})"></td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="13"><a
				href="queryAll?pageNum=${info.firstPage }&gname=${gname}"><input
					type="button" value="首页"></a> <a
				href="queryAll?pageNum=${info.prePage }&gname=${gname}"><input
					type="button" value="上一页"></a> <a
				href="queryAll?pageNum=${info.nextPage }&gname=${gname}"><input
					type="button" value="下一页"></a> <a
				href="queryAll?pageNum=${info.lastPage }&gname=${gname}"><input
					type="button" value="末页"></a>共${info.pages }页</th>
		</tr>
	</table>

	<script type="text/javascript">
		function o() {
			$("[name=ck]").each(function() {
				this.checked = !this.checked;
			})
		}
		function del(gid) {
			if(gid!=null && gid!=''){if (confirm("确定删除吗?")) {
				location="dels?gid="+gid;
			}}else{
				alert("不可为空");
			}
			
		}
		function dels() {
			var gid=$("[name=ck]:checked").map(function () {
				return $(this).val();
			}).get().join(",");
			alert(gid)
			if(gid!=null && gid!=''){if (confirm("确定删除吗?")) {
				location="dels?gid="+gid;
			}}else{
				alert("不可为空");
			}
			
		}
		
	</script>
</body>
</html>