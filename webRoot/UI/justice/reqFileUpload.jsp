<%--
    ˾����ѯ�����ļ��ϴ�
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>�ļ��ϴ�</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/servlet/FileUploadServlet" method="post" enctype="multipart/form-data" >
    �ϴ��ļ�:<input type="file" name="file" /><br/>
    <input type="submit" name="submit" value="�ύ" />
</form>
</body>
</html>