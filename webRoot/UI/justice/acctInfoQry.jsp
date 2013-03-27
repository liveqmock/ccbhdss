<%--
  User: Administrator
  Date: 2013-3-27
  Time: 13:49:06
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp" %>
<html>
<head><title></title>
<script language="javascript" src="acctInfoQry.js"></script>
<%
    String strSql =
            "SELECT 'ZHXX',\n" +
                    "       BDHM,\n" +
                    "       ROW_NUMBER() OVER(PARTITION BY BDHM ORDER BY KHZH) AS CCXH,\n" +
                    "       KHZH,\n" +
                    "       YE,\n" +
                    "       FKSJ,\n" +
                    "       CCLB,\n" +
                    "       ZHZT,\n" +
                    "       KHWD,\n" +
                    "       BZ,\n" +
                    "       TXDZ,\n" +
                    "       YZBM,\n" +
                    "       LXDH,\n" +
                    "       BEIZ\n" +
                    "FROM (\n" +
                    "SELECT 'ZHXX',\n" +
                    "       BDHM,\n" +
                    "       KHZH,\n" +
                    "       YE,\n" +
                    "       FKSJ,\n" +
                    "       CCLB,\n" +
                    "       ZHZT,\n" +
                    "       KHWD,\n" +
                    "       BZ,\n" +
                    "       TXDZ,\n" +
                    "       YZBM,\n" +
                    "       LXDH,\n" +
                    "       BEIZ\n" +
                    "  FROM (SELECT 'ZHXX',\n" +
                    "               B1.BDHM AS BDHM,\n" +
                    "               CASE\n" +
                    "                 WHEN TRIM(B2.CRD_NO) IS NULL THEN\n" +
                    "                  B2.CUST_ACCT_NO\n" +
                    "                 ELSE\n" +
                    "                  B2.CRD_NO\n" +
                    "               END KHZH,\n" +
                    "               B2.ACCT_BAL AS YE,\n" +
                    "               CASE WHEN TRIM(B2.CUST_ACCT_NO) IS NOT NULL THEN\n" +
                    "                (SELECT CURRENT_DATE\n" +
                    "                  FROM DUAL )  ELSE NULL END FKSJ,\n" +
                    "                       CASE\n" +
                    "                         WHEN TRIM(B2.CRD_NO) IS NOT NULL THEN\n" +
                    "                          '��'\n" +
                    "                         ELSE\n" +
                    "                          ''\n" +
                    "                       END CCLB,\n" +
                    "                       (SELECT SOURCE_CD_DESC\n" +
                    "                          FROM BF_CM_STD_CODE\n" +
                    "                         WHERE CATEGORY_CD = 'ACD0100043'\n" +
                    "                           AND ODS_STANDARD_CD = B2.ACCT_STS) AS ZHZT,\n" +
                    "                       (select CM_OPUN_FLNM_CHN from BF_PR_BR_INSTN where OPR_UNIT_CD=B2.INST_NO) AS KHWD,\n" +
                    "                       B2.CURR_CD AS BZ,\n" +
                    "                       '' AS TXDZ,\n" +
                    "                       '' AS YZBM,\n" +
                    "                       '' AS LXDH,\n" +
                    "                       '' AS BEIZ\n" +
                    "                  FROM (SELECT C1.EXT_SYSTEM_INDEX, C2.BDHM, C1.EXT_SYSTEM_ID\n" +
                    "                          FROM (SELECT A2.EXT_SYSTEM_INDEX,\n" +
                    "                                       A2.EXT_SYSTEM_ID,\n" +
                    "                                       A1.CERT_NO\n" +
                    "                                  FROM BF_PR_IND_INFO              A1,\n" +
                    "                                       BF_PR_IND_PARTY_CROSS_INDEX A2\n" +
                    "                                 WHERE A1.P_CUST_NO = A2.P_CUST_NO\n" +
                    "                                   AND A2.EXT_SYSTEM_ID IN ('0012')) C1,\n" +
                    "                               B_F_SFCX_QQINFO C2\n" +
                    "                         WHERE C1.CERT_NO(+) = C2.DSRZJHM) B1,\n" +
                    "                       BF_AGT_DEP_ACCT_SAP B2\n" +
                    "                 WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO(+)\n" +
                    "                UNION\n" +
                    "                SELECT 'ZHXX',\n" +
                    "                       B1.BDHM AS BDHM,\n" +
                    "                       B2.CUST_ACCT_NO AS KHZH,\n" +
                    "                       B2.REAL_BAL AS YE,\n" +
                    "                       CASE WHEN TRIM(B2.CUST_ACCT_NO) IS NOT NULL THEN\n" +
                    "                        (SELECT CURRENT_DATE\n" +
                    "                          FROM DUAL) ELSE NULL END FKSJ,\n" +
                    "                               CASE\n" +
                    "                                 WHEN SUBSTR(B2.CUST_ACCT_NO, 1, 1) = '2' THEN\n" +
                    "                                  '��'\n" +
                    "                                 ELSE\n" +
                    "                                  ''\n" +
                    "                               END CCLB,\n" +
                    "                               CASE\n" +
                    "                                 WHEN TRIM(B2.POFF_DATE) <> '1899-12-31' THEN\n" +
                    "                                  '����'\n" +
                    "                                 WHEN TRIM(B2.POFF_DATE) = '1899-12-31' THEN\n" +
                    "                                  '����'\n" +
                    "                                 ELSE\n" +
                    "                                  ''\n" +
                    "                               END ZHZT,\n" +
                    "                               (select CM_OPUN_FLNM_CHN from BF_PR_BR_INSTN where OPR_UNIT_CD=B2.INST_NO) AS KHWD,\n" +
                    "                               B2.CURR_CD AS BZ,\n" +
                    "                               '' AS TXDZ,\n" +
                    "                               '' AS YZBM,\n" +
                    "                               '' AS LXDH,\n" +
                    "                               '' AS BEIZ\n" +
                    "                          FROM (SELECT C1.EXT_SYSTEM_INDEX,\n" +
                    "                                       C2.BDHM,\n" +
                    "                                       C1.EXT_SYSTEM_ID\n" +
                    "                                  FROM (SELECT A2.EXT_SYSTEM_INDEX,\n" +
                    "                                               A2.EXT_SYSTEM_ID,\n" +
                    "                                               A1.CERT_NO\n" +
                    "                                          FROM BF_PR_IND_INFO              A1,\n" +
                    "                                               BF_PR_IND_PARTY_CROSS_INDEX A2\n" +
                    "                                         WHERE A1.P_CUST_NO = A2.P_CUST_NO\n" +
                    "                                           AND A2.EXT_SYSTEM_ID IN ('0012')) C1,\n" +
                    "                                       B_F_SFCX_QQINFO C2\n" +
                    "                                 WHERE C1.CERT_NO(+) = C2.DSRZJHM) B1,\n" +
                    "                               BF_AGT_DEP_ACCT_TDP B2\n" +
                    "                         WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO(+) \n" +
                    "        \n" +
                    "        )\n" +
                    "UNION\n" +
                    "SELECT 'ZHXX',\n" +
                    "       BDHM,\n" +
                    "       KHZH,\n" +
                    "       YE,\n" +
                    "       FKSJ,\n" +
                    "       CCLB,\n" +
                    "       ZHZT,\n" +
                    "       KHWD,\n" +
                    "       BZ,\n" +
                    "       TXDZ,\n" +
                    "       YZBM,\n" +
                    "       LXDH,\n" +
                    "       BEIZ\n" +
                    "  FROM (SELECT 'ZHXX',\n" +
                    "               B1.BDHM AS BDHM,\n" +
                    "               B2.CUST_ACCT_NO AS KHZH,\n" +
                    "               B2.ACCT_BAL AS YE,\n" +
                    "               CASE WHEN TRIM(B2.CUST_ACCT_NO) IS NOT NULL THEN\n" +
                    "                (SELECT CURRENT_DATE\n" +
                    "                  FROM DUAL) ELSE NULL END FKSJ,\n" +
                    "                       CASE\n" +
                    "                         WHEN SUBSTR(B2.CUST_ACCT_NO, 1, 3) = '371' THEN\n" +
                    "                          '�Թ�'\n" +
                    "                         ELSE\n" +
                    "                          ''\n" +
                    "                       END CCLB,\n" +
                    "                       (SELECT SOURCE_CD_DESC\n" +
                    "                          FROM BF_CM_STD_CODE\n" +
                    "                         WHERE CATEGORY_CD = 'ACD0100043'\n" +
                    "                           AND ODS_STANDARD_CD = B2.ACCT_STS) AS ZHZT,\n" +
                    "                       (select CM_OPUN_FLNM_CHN from BF_PR_BR_INSTN where OPR_UNIT_CD=B2.INST_NO) AS KHWD,\n" +
                    "                       B2.CURR_CD AS BZ,\n" +
                    "                       '' AS TXDZ,\n" +
                    "                       '' AS YZBM,\n" +
                    "                       '' AS LXDH,\n" +
                    "                       '' AS BEIZ\n" +
                    "                  FROM (SELECT C1.EXT_SYSTEM_INDEX, C2.BDHM, C1.EXT_SYSTEM_ID\n" +
                    "                          FROM (SELECT A2.EXT_SYSTEM_INDEX,\n" +
                    "                                       A2.EXT_SYSTEM_ID,\n" +
                    "                                       A1.ORG_INSTN_CD\n" +
                    "                                  FROM BF_PR_CORP_INFO_CLPM         A1,\n" +
                    "                                       BF_PR_CORP_PARTY_CROSS_INDEX A2\n" +
                    "                                 WHERE A1.CUST_NO = A2.P_CUST_NO\n" +
                    "                                   AND A2.EXT_SYSTEM_ID IN ('0000030002')) C1,\n" +
                    "                               B_F_SFCX_QQINFO C2\n" +
                    "                         WHERE C1.ORG_INSTN_CD(+) = C2.DSRZJHM) B1,\n" +
                    "                       BF_AGT_DEP_ACCT_SAE B2\n" +
                    "                 WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO(+)\n" +
                    "                UNION\n" +
                    "                SELECT 'ZHXX',\n" +
                    "                       B1.BDHM AS BDHM,\n" +
                    "                       B2.CUST_ACCT_NO AS KHZH,\n" +
                    "                       B2.REAL_BAL AS YE,\n" +
                    "                       CASE WHEN TRIM(B2.CUST_ACCT_NO) IS NOT NULL THEN\n" +
                    "                        (SELECT CURRENT_DATE\n" +
                    "                          FROM DUAL) ELSE NULL END FKSJ,\n" +
                    "                               CASE\n" +
                    "                                 WHEN SUBSTR(B2.CUST_ACCT_NO, 1, 3) = '371' THEN\n" +
                    "                                  '�Թ�'\n" +
                    "                                 ELSE\n" +
                    "                                  ''\n" +
                    "                               END CCLB,\n" +
                    "                               CASE\n" +
                    "                                 WHEN TRIM(B2.POFF_DATE) <> '1899-12-31' THEN\n" +
                    "                                  '����'\n" +
                    "                                 WHEN TRIM(B2.POFF_DATE) = '1899-12-31' THEN\n" +
                    "                                  '����'\n" +
                    "                                 ELSE\n" +
                    "                                  ''\n" +
                    "                               END ZHZT,\n" +
                    "                               (select CM_OPUN_FLNM_CHN from BF_PR_BR_INSTN where OPR_UNIT_CD=B2.INST_NO) AS KHWD,\n" +
                    "                               B2.CURR_CD AS BZ,\n" +
                    "                               '' AS TXDZ,\n" +
                    "                               '' AS YZBM,\n" +
                    "                               '' AS LXDH,\n" +
                    "                               '' AS BEIZ\n" +
                    "                          FROM (SELECT C1.EXT_SYSTEM_INDEX,\n" +
                    "                                       C2.BDHM,\n" +
                    "                                       C1.EXT_SYSTEM_ID\n" +
                    "                                  FROM (SELECT A2.EXT_SYSTEM_INDEX,\n" +
                    "                                               A2.EXT_SYSTEM_ID,\n" +
                    "                                               A1.ORG_INSTN_CD\n" +
                    "                                          FROM BF_PR_CORP_INFO_CLPM         A1,\n" +
                    "                                               BF_PR_CORP_PARTY_CROSS_INDEX A2\n" +
                    "                                         WHERE A1.CUST_NO = A2.P_CUST_NO\n" +
                    "                                           AND A2.EXT_SYSTEM_ID IN\n" +
                    "                                               ('0000030002')) C1,\n" +
                    "                                       B_F_SFCX_QQINFO C2\n" +
                    "                                 WHERE C1.ORG_INSTN_CD(+) = C2.DSRZJHM) B1,\n" +
                    "                               BF_AGT_DEP_ACCT_TDE B2\n" +
                    "                         WHERE B1.EXT_SYSTEM_INDEX = B2.CUST_NO(+)\n" +
                    "        \n" +
                    "        ))\n";

    DBGrid dbGrid = new DBGrid();
    dbGrid.setGridID("ActionTable");
    dbGrid.setGridType("edit");
    dbGrid.setfieldSQL(strSql);
    dbGrid.setField("ZHXX", "text", "5", "ZHXX", "true", "0");
    dbGrid.setField("��ѯ���󵥺�", "text", "8", "BDHM", "true", "0");
    dbGrid.setField("�˻����", "text", "5", "CCXH", "true", "0");
    dbGrid.setField("�����˺�", "text", "8", "KHZH", "true", "0");
    dbGrid.setField("���", "money", "5", "YE", "true", "0");
    dbGrid.setField("����ʱ��", "text", "5", "FKSJ", "true", "0");
    dbGrid.setField("�˻����", "text", "5", "CCLB", "true", "0");
    dbGrid.setField("�˻�״̬", "text", "5", "ZHZT", "true", "0");
    dbGrid.setField("��������", "text", "5", "KHWD", "true", "0");
    dbGrid.setField("����", "text", "5", "BZ", "true", "0");
    dbGrid.setField("ͨѶ��ַ", "text", "15", "TXDZ", "true", "0");
    dbGrid.setField("��������", "text", "5", "YZBM", "true", "0");
    dbGrid.setField("��ϵ�绰", "text", "5", "LXDH", "true", "0");
    dbGrid.setField("��ע", "text", "10", "BEIZ", "true", "0");
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