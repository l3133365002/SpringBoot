<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			function page(p){
				location = "list?currentPage="+p;
			}
		</script>
		<script type="text/javascript">
			$(function (){
				$("#qx").click(function(){
					$(".cks").prop("checked",true);
				})
				$("#qbx").click(function(){
					$(".cks").prop("checked",false);
				})
				$("#fx").click(function(){
					$(".cks").each(function(){
						$(this).prop("checked",!$(this).prop("checked"))
					});
				});
				

				
				//删除
				$(".delete").click(function(){
					var id = $(this).next().val();
					console.log(id)
					$.ajax({
						url:"<%=request.getContextPath()%>/delete",
						data:{id:id},
						dataType:"json",
						type:"post",
						success:function(obj){
							if(obj){
								location.reload();
							}else{
								alert("删除失败")
							}
						}
					});
				});

				
				
				$("#add").click(function(){
					location="<%=request.getContextPath()%>/toadd"
				});
				
				//修改
				$(".update").click(function(){
					var id=$(this).prev().val();
					location="<%=request.getContextPath()%>/toupdate?id="+id;
				})
			});
		</script>
	</head>
	<body>
		<table>
			<tr>
				<td>编号</td>
				<td>姓名</td>
				<td>
					<!-- <a href="add.jsp">添加</a> -->
					<input type="button" value="添加" id="add">
				</td>
			</tr>
	
			<c:forEach items="${pageInfo.list}" var="c">
				<tr>
					<td>
						<input type="checkbox" class="cks" value="${c.id}" />
					</td>
					<td>${c.id}</td>
					<td>${c.name}</td>
					<td>
						<input type="button" value="删除" class="delete" /><br>
						<input type="hidden" value="${c.id}" />
						<input type="button" value="修改" class="update" />
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10"><input type="button" value="全选" id="qx" />
					<input type="button" value="全不选" id="qbx" /> 
					<input type="button" value="反选" id="fx" /> 
					<!-- <input type="button" value="批量删除" id="plsc" /> -->
				</td>
			</tr>
			<%-- <tr>
				<td colspan="10">
					<input type="button" value="首页" onclick="page(1)" /> 
					<input type="button" value="上一页" onclick="page(${pageInfo.prePage==0?1:pageInfo.prePage})" /> 
					<input type="button" value="下一页" onclick="page(${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage})" />
					<input type="button" value="尾页" onclick="page(${pageInfo.pages})" />
				</td>
			</tr> --%>
		</table>
		
	</body>
</html>