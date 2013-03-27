<%--
  User: Administrator
  Date: 2013-3-27
  Time: 13:49:06
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp" %>
<html>
<head><title></title>
<script language="javascript" src="txnInfoQry.js"></script>
<%
    String strSql =
            " SELECT 'WLXX' AS WLXX,\n" +
                    "       C1.BDHM AS BDHM,\n" +
                    "       C1.CCXH ,\n" +
                    "       C2.SA_DDP_ACCT_NO_DET_N AS WLXH,\n" +
                    "       CASE\n" +
                    "         WHEN C2.DR_CR_COD = '1' THEN\n" +
                    "          'ת��'\n" +
                    "         WHEN C2.DR_CR_COD = '2' THEN\n" +
                    "          'ת��'\n" +
                    "         ELSE\n" +
                    "          '����'\n" +
                    "       END ZJLX,\n" +
                    "       C2.SA_OP_ACCT_NO_32 AS ZCKZH,\n" +
                    "       C2.SA_OP_CUST_NAME AS ZCKZXM,\n" +
                    "       C2.CURR_CD AS BZ,\n" +
                    "       C2.CR_TX_AMT AS JE,\n" +
                    "       C2.SA_TX_DT AS JYRQ\n" +
                    "  FROM (SELECT B1.BDHM AS BDHM,\n" +
                    "               ROW_NUMBER() OVER(PARTITION BY B1.BDHM ORDER BY B2.CUST_ACCT_NO) AS CCXH,\n" +
                    "               B2.ACCT_NO,\n" +
                    "               B1.CCKKSSJ,\n" +
                    "               B1.CCKJSSJ\n" +
                    "          FROM (SELECT A2.EXT_SYSTEM_INDEX,\n" +
                    "                       A3.BDHM,\n" +
                    "                       A2.EXT_SYSTEM_ID,\n" +
                    "                       TO_CHAR(TO_DATE(SUBSTR(A3.CKKSSJ,1,10),'YYYY-MM-DD'),'YYYY-MM-DD') AS CCKKSSJ,\n" +
                    "                       TO_CHAR(TO_DATE(SUBSTR(A3.CKJSSJ,1,10),'YYYY-MM-DD'),'YYYY-MM-DD') AS CCKJSSJ\n" +
                    "                  FROM BF_PR_IND_INFO              A1,\n" +
                    "                       BF_PR_IND_PARTY_CROSS_INDEX A2,\n" +
                    "                       B_F_SFCX_QQINFO             A3\n" +
                    "                 WHERE A1.CERT_NO = A3.DSRZJHM\n" +
                    "                   AND A1.P_CUST_NO = A2.P_CUST_NO\n" +
                    "                   AND A2.EXT_SYSTEM_ID IN ('0012')) B1,\n" +
                    "               BF_AGT_DEP_ACCT_SAP B2\n" +
                    "         WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO) C1,\n" +
                    "       BF_EVT_DEP_SAP C2\n" +
                    " WHERE C1.ACCT_NO = C2.ACCT_NO \n" +
                    "   AND C2.SA_TX_DT >=C1.CCKKSSJ AND C2.SA_TX_DT <=C1.CCKJSSJ\n" +
                    "union     \n" +
                    " select\n" +
                    "'WLXX' as WLXX,\n" +
                    "C1.BDHM AS BDHM,\n" +
                    "C1.CCXH,\n" +
                    "C2.SA_DDP_ACCT_NO_DET_N AS WLXH,\n" +
                    "   case when C2.DR_CR_COD='1' then 'ת��'\n" +
                    "        when C2.DR_CR_COD='2' then 'ת��'\n" +
                    "        else '����'\n" +
                    "         end ZJLX,\n" +
                    "C2.CM_OPP_ACCT_NO AS ZCKZH,\n" +
                    "C2.SA_OP_CUST_NAME AS ZCKZXM,\n" +
                    "C2.CURR_CD AS BZ,\n" +
                    "C2.CR_TX_AMT AS JE,\n" +
                    "C2.SA_TX_DT AS JYRQ\n" +
                    "from   (SELECT \n" +
                    "       B1.BDHM AS BDHM,\n" +
                    "       row_number() over(partition by B1.BDHM order BY B2.Cust_Acct_No) AS CCXH,\n" +
                    "       B2.ACCT_NO,\n" +
                    "       B1.CCKKSSJ,\n" +
                    "       B1.CCKJSSJ\n" +
                    "         FROM (SELECT A2.EXT_SYSTEM_INDEX, A3.BDHM, A2.EXT_SYSTEM_ID,\n" +
                    "                TO_CHAR(TO_DATE(SUBSTR(A3.CKKSSJ,1,10),'YYYY-MM-DD'),'YYYY-MM-DD') AS CCKKSSJ,\n" +
                    "                TO_CHAR(TO_DATE(SUBSTR(A3.CKJSSJ,1,10),'YYYY-MM-DD'),'YYYY-MM-DD') AS CCKJSSJ\n" +
                    "          FROM BF_PR_CORP_INFO              A1,\n" +
                    "               BF_PR_CORP_PARTY_CROSS_INDEX A2,\n" +
                    "               B_F_SFCX_QQINFO             A3\n" +
                    "         WHERE A1.ORG_INSTN_CD = A3.DSRZJHM\n" +
                    "           AND A1.ECIF_CUST_NO = A2.P_CUST_NO\n" +
                    "           AND A2.EXT_SYSTEM_ID IN ('0000030002')) B1,\n" +
                    "       BF_AGT_DEP_ACCT_SAE B2\n" +
                    " WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO) C1,BF_EVT_DEP_SAE C2\n" +
                    "     WHERE C1.ACCT_NO = C2.ACCT_NO AND \n" +
                    "           C2.SA_TX_DT >=C1.CCKKSSJ AND C2.SA_TX_DT <=C1.CCKJSSJ\n" +
                    "     ORDER BY BDHM, CCXH, WLXH;            \n";

    DBGrid dbGrid = new DBGrid();
    dbGrid.setGridID("ActionTable");
    dbGrid.setGridType("edit");
    dbGrid.setfieldSQL(strSql);
    dbGrid.setField("WLXX", "text", "5", "WLXX", "true", "0");
    dbGrid.setField("��ѯ���󵥺�", "text", "8", "BDHM", "true", "0");
    dbGrid.setField("�˻����", "text", "8", "CCXH", "true", "0");
    dbGrid.setField("�ʽ��������", "text", "8", "WLXH", "true", "0");
    dbGrid.setField("�ʽ�����", "text", "5", "ZJLX", "true", "0");
    dbGrid.setField("�Է���/�ۺ�", "text", "8", "ZCKZH", "true", "0");
    dbGrid.setField("�Է���/������", "text", "8", "ZCKZXM", "true", "0");
    dbGrid.setField("����", "text", "5", "BZ", "true", "0");
    dbGrid.setField("���", "money", "15", "JE", "true", "0");
    dbGrid.setField("��������", "text", "5", "JYRQ", "true", "0");
    dbGrid.setWhereStr(" where 1=2");
    dbGrid.setpagesize(50);
    dbGrid.setCheck(false);
    //////���ݼ���ť
    dbGrid.setdataPilotID("datapilot");
    dbGrid.setbuttons("����Excel=excel,moveFirst,prevPage,nextPage,moveLast");
%>
</head>
<body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">
<fieldset>
    <legend>
        ��ѯ����
    </legend>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <form id="queryForm" name="queryForm" method="post" action="acctInfoQry.jsp">
            <tr height="20">
                <td width="100%" align="center" nowrap="nowrap">
                    <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button"
                           onClick="cbRetrieve_Click()" value="��ʼ��ѯ">
                </td>
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