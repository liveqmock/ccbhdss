<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-8-23
  Time: 13:49:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp" %>
<script language="javascript" src="grdqDataQry.js"></script>
<html>
<head><title></title>
     <script language="javascript" src="/UI/support/pub.js"></script>
    <script language="javascript" src="grdqDataQry.js"></script>
    <%
        String qryResult = null;
        qryResult = (String)session.getAttribute("TimeFlagMsg");
        String strSql = "select fnc_get_contrast(tcan.td_td_acct_no) as wb_zh,tcan.td_curr_code,tcan.td_tdp_intr,tcan.td_dep_prd_n," +
                " tcan.td_due_dt,tcan.td_clsd_dt,tcan.td_opac_tlr_no," +
                " (select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1 where ct1.cm_opun_cod=substr(tcan.td_opac_tlr_no,0,9)) as opac_inil_1_chn," +
                " tcan.td_opac_amt,tcan.td_opac_dt,tcan.td_cust_no,tcan.td_actu_amt,tcan.td_cacct_tlr_no," +
                " (select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1 where ct1.cm_opun_cod=substr(tcan.td_cacct_tlr_no,0,9)) as opac_inil_2_chn," +
                " tcan.td_acct_sts,tcan.td_clsd_int,tcan.td_cust_name from dcc_tdacnacn tcan  where 1=1 ";
         // �����û����ж�
         String isSuper = (String)session.getAttribute("isSuper");
        String operId = (String)session.getAttribute("operatorId");
        if(!"1".equalsIgnoreCase(isSuper)){
            strSql += " and td_opac_instn_no='"+operId+"'";
        }
        DBGrid dbGrid = new DBGrid();
        dbGrid.setGridID("ActionTable");
        dbGrid.setGridType("edit");
        dbGrid.setfieldSQL(strSql);
        dbGrid.setField("�����ʺ�", "text", "18", "wb_zh", "true", "0");
        dbGrid.setField("�ұ�", "text", "8", "td_curr_code", "true", "0");
        dbGrid.setField("�浥����", "text", "10", "td_tdp_intr", "true", "0");
        dbGrid.setField("����", "text", "10", "td_dep_prd_n", "true", "0");
        dbGrid.setField("��������", "text", "10", "td_due_dt", "true", "0");
        dbGrid.setField("��������", "text", "10", "td_clsd_dt", "true", "0");
        dbGrid.setField("������Ա��", "text", "13", "td_opac_tlr_no", "true", "0");
        dbGrid.setField("����������", "text", "20", "opac_inil_1_chn", "true", "0");
        dbGrid.setField("�������", "text", "12", "td_opac_amt", "true", "0");
        dbGrid.setField("��������", "text", "10", "td_opac_dt", "true", "0");
        dbGrid.setField("�ͻ����", "text", "18", "td_cust_no", "true", "0");
         dbGrid.setField("ʵ�ʽ��", "text", "12", "td_actu_amt", "true", "0");
        dbGrid.setField("������Ա��", "text", "13", "td_opac_tlr_no", "true", "0");
        dbGrid.setField("����������", "text", "20", "opac_inil_2_chn", "true", "0");
        dbGrid.setField("�ʻ�״̬", "dropdown", "10", "td_acct_sts", "true", "HISACCTSTS");
        dbGrid.setField("������Ϣ", "text", "9", "td_clsd_int", "true", "0");
        dbGrid.setField("�ͻ�����", "text", "9", "td_cust_name", "true", "0");
        dbGrid.setWhereStr(" and 1=2 ");
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
        ��˽���ڿ�����Ϣ��ѯ����
    </legend>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <form id="queryForm" name="queryForm" method="post" action="grhqDataQry.jsp">
            <tr height="20">
                <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    �ʺ�
                    <input type="hidden" value="dcc_tdacnacn" id="hidTabName" name="hidTabName"/>
                    <input type="hidden" value="��˽����������ѯ" id="hidRMK" name="hidRMK" />
                    <input type="hidden" value="<%=isSuper%>" id="hidIsSuper" name="hidIsSuper" />
                    <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
                    <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
                </td>
                <td width="30%" align="right" nowrap="nowrap" class="data_input">
                    <input style="width:80%" type="text" id="acctno" name="acctno" size="40"
                           class="ajax-suggestion url-getLoanPull.jsp">
                </td>
                <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    ���֤��
                </td>
                <td width="30%" align="right" nowrap="nowrap" class="data_input">
                    <input style="width:80%" type="text" id="custNo" name="custNo" size="40"
                           class="ajax-suggestion url-getLoanPull.jsp">
                </td>
                <td width="15%" align="right" nowrap="nowrap">
                    <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button"
                           onClick="cbRetrieve_Click()" value="����">
                </td>
            </tr>
            <tr height="20">
                <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                    �ͻ�����
                </td>
                <td width="30%" align="right" nowrap="nowrap" class="data_input">
                    <input type="text" style="width:80%;" id="custName" name="custName" size="40"
                           class="ajax-suggestion url-getLoanPull.jsp">
                </td>
                <td colspan="2">
                    &nbsp;
                </td>
                <td width="15%" align="left" nowrap="nowrap">
                    <input name="Input" class="buttonGrooveDisable" type="reset" value="����">
                </td>
            </tr>
        </form>
    </table>
</fieldset>
<fieldset>
    <legend>
        <%=qryResult%>
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