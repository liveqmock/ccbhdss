<%--
˾����ѯ�����嵥
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp" %>

<html>
<head>
    <title></title>
    <script language="javascript" src="reqTxtList.js"></script>
<%
    String strSql = "select * from b_f_sfcx_qqinfo";

    DBGrid dbGrid = new DBGrid();
    dbGrid.setGridID("ActionTable");
    dbGrid.setGridType("edit");
    dbGrid.setfieldSQL(strSql);
    dbGrid.setField("��ʶ", "text", "5", "BH", "true", "0");
    dbGrid.setField("��ѯ���󵥺�", "text", "8", "BDHM", "true", "0");
    dbGrid.setField("���", "text", "5", "LB", "true", "0");
    dbGrid.setField("����", "text", "5", "XZ", "true", "0");
    dbGrid.setField("����ѯ������", "text", "5", "XM", "true", "0");
    dbGrid.setField("����", "text", "5", "GJ", "true", "0");
    dbGrid.setField("֤������", "text", "5", "ZJLX", "true", "0");
    dbGrid.setField("֤����", "text", "10", "DSRZJHM", "true", "0");
    dbGrid.setField("��֤����", "text", "5", "FZJG", "true", "0");
    dbGrid.setField("ִ�з�Ժ����", "text", "10", "FYMC", "true", "0");
    dbGrid.setField("�а취��", "text", "5", "CBR", "true", "0");
    dbGrid.setField("ִ�а���", "text", "10", "AH", "true", "0");
    dbGrid.setField("��ʼʱ��", "text", "10", "CKKSSJ", "true", "0");
    dbGrid.setField("����ʱ��", "text", "10", "CKJSSJ", "true", "0");
    dbGrid.setWhereStr(" where 1=1");
    dbGrid.setpagesize(30);
    dbGrid.setCheck(false);
    dbGrid.setdataPilotID("datapilot");
    dbGrid.setbuttons("����Excel=excel,moveFirst,prevPage,nextPage,moveLast");
%>
</head>
<body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">
<fieldset>
    <legend>
        ˾����ѯ���������ϴ�
    </legend>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <form id="queryForm" name="queryForm" action="<%=request.getContextPath()%>/UI/justice/reqFileUploadHandler.jsp" method="post" enctype="multipart/form-data" >
            <tr height="20">
                <td width="20%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    �ϴ��ļ�
                </td>
                <td width="60%" align="right" nowrap="nowrap" class="data_input">
                    <input type="file" name="file" style="width:90%" />
                </td>
                <td width="10%" align="center" nowrap="nowrap">
                    <input type="submit" name="uploadButton"  value="�ϴ�����" />
                </td>
<%--
                <td  width="10%" align="left" nowrap="nowrap">
                    <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button"
                           onClick="cbRetrieve_Click()" value="��յ�ǰ����">
                </td>
--%>
            </tr>
        </form>
    </table>
</fieldset>
<fieldset>
    <legend>
        ��ѯ���
    </legend>
    <table width="100%">
        <tr>
            <td>
                <%=dbGrid.getDBGrid()%>
            </td>
        </tr>
    </table>
</fieldset>
<FIELDSET>
    <LEGEND>
        ����
    </LEGEND>
    <table width="100%" class="title1">
        <tr>
            <td id="cellButtons" align="right">
                <%=dbGrid.getDataPilot()%>
            </td>
        </tr>
    </table>
</FIELDSET>

</body>
</html>