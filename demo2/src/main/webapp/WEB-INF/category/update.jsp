<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function(){
				var id=${param.id}
				//回显数据
				$.ajax({
					url:"<%=request.getContextPath() %>/queryCategoryById",
					dataType:"json",
					data:{id:id},
					success:function(obj){
						$("#id").val(obj.id);
						$("#name").val(obj.name);
					}
				});

				$("#xg").click(function(){
					$.ajax({
						url:"update",
						data:$("form").serialize(),
						type:"post",
						dataType:"json",
						success:function(obj){
							console.log(obj)
							if(obj){
								alert("修改成功")
								location="<%=request.getContextPath() %>/list";
							}else{
								alert("修改失败")
							}
						}
					});
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
						<input type="hidden" name="id" id="id"/>
						<input type="text" name="name" id="name">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="修改" id="xg">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>