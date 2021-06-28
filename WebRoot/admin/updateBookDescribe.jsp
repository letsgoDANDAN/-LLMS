<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*,cn.jmu.po.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">    
    <title>   修改图书描述</title>        
    <style type="text/css">    
      html{margin: 0; padding: 0;}
      body{margin: 0 auto; padding: 0;max-width: 1200px; background: #f5f6f8;font-size: 14px;max-height: 800px;}
      .m-header{position: relative; height: 0.8rem;line-height: 1rem; font-size:0.18rem;border-bottom:1px solid #EBEBEB; text-align: center;color: #2C2C2C;letter-spacing: 0;background: #fff;}
       .m-return {position: absolute;display: inline-block;top:0.13rem;left: 0.12rem;width: 0.14rem; height: 0.3rem; background-image: url(http://c2.cgyouxi.com/website/mobile/img/arrow-l.png?v=20180122);background-size: 100% 100%;}
      .m-view{background: #fff;height: 400px;}     
      .m-division{height: 1px; background:#EBEBEB;} 
      @media screen and (min-width: 360px) {  
        html {
          font-size: 100px!important;
        }
      }
   </style>
</head>
<body>

<div class="m-header" id="m-header">
<div class="m-return" id="m-return"></div>
  <h2> 修改图书</h2>
  </div>
  <div class="m-division"></div>  
 <div id="m-view">
 <%
 request.setCharacterEncoding("utf-8");
 BookDescribe bookDescribe = (BookDescribe)request.getAttribute("bookDescribe");
 %>
<form action="${pageContext.request.contextPath}/admin/updateBookDescribe.do" method="post">
<table align="center" style="font-size:22px;border-collapse:separate;border-spacing:10px;">
	<tr><th>ISBN：</th>
		<td><input type="hidden" name="ISBN" value="<%=bookDescribe.getISBN()%>"><%=bookDescribe.getISBN()%></td> 
	</tr>
	<tr><th>分类：</th>
		<td><input type="text" name="sonID" value="<%=bookDescribe.getSonID()%>"></td>
	</tr>
	<tr><td>出版社：</td>
		<td><select name="publicID">
		<option value="">-->请选择<--</option>
		<%
		request.setCharacterEncoding("utf-8");
		List<Press> presses = (List<Press>)request.getAttribute("presses");
		for(int i=0;i<presses.size();i++){
			if(presses.get(i).getPublicID().equals(bookDescribe.getPublicID())) {
		%>
		<option value="<%=presses.get(i).getPublicID()%>" selected="selected"><%=presses.get(i).getPublicname() %></option>
		<%	}else{ %>
		<option value="<%=presses.get(i).getPublicID()%>"><%=presses.get(i).getPublicname() %></option>
		<%}
		} %>
		</select></td>
	</tr>
	<tr><th>借阅类型：</th>
	<td><select name="borrowtypeID">
		<option value="">-->请选择<--</option>
		<%
		List<BorrowType> borrowTypes = (List<BorrowType>)request.getAttribute("borrowTypes");
		for(int i=0;i<borrowTypes.size();i++){
			if(borrowTypes.get(i).getBorrowtypeID().equals(bookDescribe.getBorrowtypeID())){
		%>
		<option value="<%=borrowTypes.get(i).getBorrowtypeID()%>" selected="selected"><%=borrowTypes.get(i).getBorrowtypeName() %></option>
		<%}else{ %>
		<option value="<%=borrowTypes.get(i).getBorrowtypeID()%>"><%=borrowTypes.get(i).getBorrowtypeName() %></option>
		<%} }%>
		</select></td>
	</tr>
	<tr><th>书名：</th>
		<td><input type="text" name="bookname" value="<%=bookDescribe.getBookname()%>"></td>
	</tr>
	<tr><th>价格：</th>
		<td><input type="text" name="price" value="<%=bookDescribe.getPrice()%>"></td>
	</tr>
	<tr><th>简介：</th>
		<td><input type="text" name="introduce" value="<%=bookDescribe.getIntroduce()%>"></td>
	</tr>
	<tr><th>封面：</th>
		<td><input type="text" name="picture" value="<%=bookDescribe.getPicture()%>"></td>
	</tr>  
	<th></th>
          <td><input type="submit" value="修改">
      </tr>
</table>
</form>



 </div>

</body>
</html>