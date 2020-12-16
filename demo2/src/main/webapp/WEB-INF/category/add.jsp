<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#tj").click(function (){
					$.ajax({
						url:"<%=request.getContextPath() %>/add",
						data:$("form").serialize(),
						dataType:"json",
						type:"post",
						success:function(obj){
							if(obj){
								alert("添加成功")
								location="<%=request.getContextPath() %>/list"
							}else{
								alert("添加失败")
							}
						}
					})
				});
			});
		</script>
	</head>
	<body>
		<form id="form">
			<table>
				<tr>
					<td>姓名</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="添加" id="tj">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>