<%--
    ˾����ѯ�����ļ��ϴ�
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>�ļ��ϴ�</title>
    <LINK href="<%=path %>/css/ccb.css" type="text/css" rel="stylesheet">

    <script language="javascript" src="reqTxtList.js"></script>
</head>
<%--<body>--%>
<body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">

<%--<form action="<%=request.getContextPath() %>/servlet/FileUploadServlet" method="post" enctype="multipart/form-data" >--%>

<fieldset>
    <legend>
        ˾����ѯ���������ϴ�
    </legend>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">

        <form action="<%=request.getContextPath() %>/UI/justice/reqFileUploadHandler.jsp" method="post"
              enctype="multipart/form-data">
            <tr height="20">
                <td width="20%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    �ϴ��ļ�
                </td>
                <td width="60%" align="right" nowrap="nowrap" class="data_input">
                    <input type="file" name="file" style="width:90%" />
                </td>
                <td width="10%" align="center" nowrap="nowrap">
                    <input type="submit" name="submit"  value="�ϴ�����" />
                </td>
                <td width="10%" align="center" nowrap="nowrap">
                    <input type="button" name="expTxt"  value="���ɱ���" onClick="expTxt_click()" />
                </td>
            </tr>
        </form>
    </table>

</fieldset>
</body>
</html>