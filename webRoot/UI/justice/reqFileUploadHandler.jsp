<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="pub.platform.db.ConnectionManager" %>
<%@ page import="pub.platform.db.DatabaseConnection" %>

<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    int count = 0;
    String errmsg = "";
    if (isMultipart) {
        try {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);//得到所有的文件
            Iterator<FileItem> itr = items.iterator();
            while (itr.hasNext()) {//依次处理每个文件
                FileItem item = (FileItem) itr.next();
                String fileName = item.getName();//获得文件名，包括路径
                if (fileName != null) {
                    //File fullFile = new File(item.getName());
                    //File savedFile = new File(uploadPath, fullFile.getName());

                    //清理现存数据
                    ConnectionManager cm = ConnectionManager.getInstance();
                    DatabaseConnection dc = cm.get();
                    dc.executeUpdate("delete from B_F_SFCX_QQINFO");

                    BufferedReader in = new BufferedReader(new InputStreamReader(item.getInputStream(), "UTF-8"));
                    StringBuffer buffer = new StringBuffer();
                    String line = "";
                    while ((line = in.readLine()) != null) {
                        String[] fields = line.split("\\|",-1);
                        count = dc.executeUpdate("insert into B_F_SFCX_QQINFO  values " +
                                "(" +
                                "'" + fields[0] + "'," +
                                "'" + fields[1] + "'," +
                                "'" + fields[2] + "'," +
                                "'" + fields[3] + "'," +
                                "'" + fields[4] + "'," +
                                "'" + fields[5] + "'," +
                                "'" + fields[6] + "'," +
                                "'" + fields[7] + "'," +
                                "'" + fields[8] + "'," +
                                "'" + fields[9] + "'," +
                                "'" + fields[10] + "'," +
                                "'" + fields[11] + "'," +
                                "'" + fields[12] + "'," +
                                "'" + fields[13] + "'" +
                                ")");

                        buffer.append(line);
                    }
                    errmsg="数据上传成功。";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            errmsg = "数据上传失败。" + e.getMessage();
            count = 0;
        }
    } else {
        out.println("the enctype must be multipart/form-data");
    }

    out.write(errmsg);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title></title>
</head>
<body>
<form action="<%=request.getContextPath()%>/UI/justice/reqTxtList.jsp">
    已处理笔数：<input type="text" size="5" value="<%=count%>">
    <input type="submit" value=" 返 回 " size="10"/>
</form>
</body>
</html>