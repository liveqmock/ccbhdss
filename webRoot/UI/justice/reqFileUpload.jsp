<%--
    司法查询请求文件上传
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/servlet/FileUploadServlet" method="post" enctype="multipart/form-data" >
    上传文件:<input type="file" name="file" /><br/>
    <input type="submit" name="submit" value="提交" />
</form>
</body>
</html>