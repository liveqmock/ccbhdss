<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-8-23
  Time: 13:49:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp"%>
 <script language="javascript" src="/UI/support/pub.js"></script>
<script language="javascript" src="dghqDataQry.js"></script>
<html>
  <head><title></title>
    <script language="javascript" src="dghqDataQry.js"></script>
    <%
         String qryResult = null;
        qryResult = (String)session.getAttribute("TimeFlagMsg");
       String strSql =  "select   secn.sa_cust_no,secn.sa_cust_name,fnc_get_contrast(secn.sa_acct_no) as wb_zh,"+
               "secn.sa_opac_instn_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1  where ct1.cm_opun_cod=secn.sa_opac_instn_no)as opac_inil_1_chn,"+
               "secn.sa_opac_dt,secn.sa_cacct_instn_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1 where ct1.cm_opun_cod=secn.sa_cacct_instn_no)as cacct_inil_1_chn,"+
               "secn.sa_cacct_dt,semt.sa_ddp_acct_sts from dcc_saecnecn  secn  join dcc_saecnamt  semt on secn.sa_acct_no=semt.sa_acct_no where 1=1 ";
         // �����û����ж�
         String isSuper = (String)session.getAttribute("isSuper");
        String operId = (String)session.getAttribute("operatorId");
        if(!"1".equalsIgnoreCase(isSuper)){
            strSql += " and sa_opac_instn_no='"+operId+"'";
        }
        DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("�ͻ����","text","8","sa_cust_no","true","0");
       dbGrid.setField("�ͻ�����","text","12","sa_cust_name","true","0");
       dbGrid.setField("�ʺ�","text","14","wb_zh","true","0");
       //dbGrid.setField("����","text","13","sa_card_no","true","0");
       dbGrid.setField("����������","text","8","sa_opac_instn_no","true","0");
       dbGrid.setField("����������","text","8","opac_inil_1_chn","true","0");
       dbGrid.setField("��������","text","8","sa_opac_dt","true","0");
       dbGrid.setField("����������","text","8","sa_cacct_instn_no","true","0");
       dbGrid.setField("����������","text","8","cacct_inil_1_chn","true","0");
       dbGrid.setField("��������","text","8","sa_cacct_dt","true","0");
       dbGrid.setField("�ʻ�״̬","dropdown","8","sa_ddp_acct_sts","true","GRHQHISACCTSTS");
       dbGrid.setWhereStr(" and 1=2 ");
       dbGrid.setpagesize(50);
       dbGrid.setCheck(false);
        //////���ݼ���ť
       dbGrid.setdataPilotID("datapilot");
       dbGrid.setbuttons("moveFirst,prevPage,nextPage,moveLast");
    %>
  </head>
  <body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">
  <fieldset>
      <legend>
        �Թ����ڿ�����Ϣ��ѯ����
      </legend>
      <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <form id="queryForm" name="queryForm" method="post" action="grhqDataQry.jsp">
        <tr height="20">
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              �ʺ�
              <input type="hidden" value="dcc_saecnecn" id="hidTabName" name="hidTabName"/>
              <input type="hidden" value="�Թ�����������ѯ" id="hidRMK" name="hidRMK" />
               <input type="hidden" value="<%=isSuper%>" id="hidIsSuper" name="hidIsSuper" />
              <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
              <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" >
            <input style="width:80%" type="text" id="acctno" name="acctno" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
             <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              �ͻ����
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" >
            <input style="width:80%" type="text" id="custNo"  name="custNo" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="15%" align="right" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="����">
          </td>
        </tr>
        <tr height="20">
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              �ͻ�����
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input">
              <input type="text" style="width:80%;" id="custName" name="custName" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td colspan="2">&nbsp;</td>
          <td width="15%" align="left" nowrap="nowrap">
            <input name="Input" class="buttonGrooveDisable" type="reset" value="����" >
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