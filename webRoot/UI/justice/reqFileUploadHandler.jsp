<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);//�õ����е��ļ�
            Iterator<FileItem> itr = items.iterator();
            while (itr.hasNext()) {//���δ���ÿ���ļ�
                FileItem item = (FileItem) itr.next();
                String fileName = item.getName();//����ļ���������·��
                if (fileName != null) {
                    File fullFile = new File(item.getName());
                    //File savedFile = new File(uploadPath, fullFile.getName());
                    byte[] buffer = item.get();
                    System.out.println(new String(buffer ));
                }
            }
            out.print("upload succeed");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        out.println("the enctype must be multipart/form-data");
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB18030">
    <title>File upload</title>
</head>
<body>
</body>
</html>