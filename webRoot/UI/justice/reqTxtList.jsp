<%--
司法查询请求清单
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
    dbGrid.setField("标识", "text", "5", "BH", "true", "0");
    dbGrid.setField("查询请求单号", "text", "8", "BDHM", "true", "0");
    dbGrid.setField("类别", "text", "5", "LB", "true", "0");
    dbGrid.setField("性质", "text", "5", "XZ", "true", "0");
    dbGrid.setField("被查询人姓名", "text", "5", "XM", "true", "0");
    dbGrid.setField("国别", "text", "5", "GJ", "true", "0");
    dbGrid.setField("证件类型", "text", "5", "ZJLX", "true", "0");
    dbGrid.setField("证件号", "text", "10", "DSRZJHM", "true", "0");
    dbGrid.setField("发证机关", "text", "5", "FZJG", "true", "0");
    dbGrid.setField("执行法院名称", "text", "10", "FYMC", "true", "0");
    dbGrid.setField("承办法官", "text", "5", "CBR", "true", "0");
    dbGrid.setField("执行案号", "text", "10", "AH", "true", "0");
    dbGrid.setField("开始时间", "text", "10", "CKKSSJ", "true", "0");
    dbGrid.setField("结束时间", "text", "10", "CKJSSJ", "true", "0");
    dbGrid.setWhereStr(" where 1=1");
    dbGrid.setpagesize(30);
    dbGrid.setCheck(false);
    dbGrid.setdataPilotID("datapilot");
    dbGrid.setbuttons("导出Excel=excel,moveFirst,prevPage,nextPage,moveLast");
%>
</head>
<body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">
<fieldset>
    <legend>
        司法查询请求数据上传
    </legend>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <form id="queryForm" name="queryForm" action="<%=request.getContextPath()%>/UI/justice/reqFileUploadHandler.jsp" method="post" enctype="multipart/form-data" >
            <tr height="20">
                <td width="20%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    上传文件
                </td>
                <td width="60%" align="right" nowrap="nowrap" class="data_input">
                    <input type="file" name="file" style="width:90%" />
                </td>
                <td width="10%" align="center" nowrap="nowrap">
                    <input type="submit" name="uploadButton"  value="上传数据" />
                </td>
<%--
                <td  width="10%" align="left" nowrap="nowrap">
                    <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button"
                           onClick="cbRetrieve_Click()" value="清空当前数据">
                </td>
--%>
            </tr>
        </form>
    </table>
</fieldset>
<fieldset>
    <legend>
        查询结果
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
        操作
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