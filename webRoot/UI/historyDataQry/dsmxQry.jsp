<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-8-26
  Time: 14:55:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp"%>
<html>
  <head><title></title>
       <script language="javascript" src="/UI/support/pub.js"></script>
    <script language="javascript" src="/js/basic.js"></script>
    <script language="javascript" src="/js/xmlHttp.js"></script>
    <script language="javascript" src="/js/dbgrid.js"></script>
    <script language="javascript" src="/js/dropdownData.js"></script>
    <script language="javascript" src="/js/dbutil.js"></script>
    <script language="javascript" src="dsmxQry.js"></script>
    <%
       String qryResult = null;
       qryResult = (String)session.getAttribute("mxTimeFlagMsg");
//       String strSql =  " select fnc_get_contrast(satn.sa_acct_no) as acctno,satn.sa_ddp_acct_no_det_n,satn.sa_curr_cod," +
//               " satn.sa_opr_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1 where " +
//               " ct1.cm_opun_cod=substr(satn.sa_opr_no,0,9) ) as opac_inil_1_chn" +
//                " ,satn.sa_cr_amt,satn.sa_ddp_acct_bal ,satn.sa_dr_amt,satn.sa_tx_crd_no,satn.sa_tx_log_no" +
//               " ,satn.sa_rmrk,satn.sa_tx_dt,satn.sa_op_cust_name" +
//                " from saacntxn satn  left join dcc_saacnacn acn on satn.sa_acct_no=acn.sa_acct_no" +
//               " where satn.sa_tx_dt<=(select t.tx_dt from dcc_historydatadate t where t.tx_id=1) ";
//        // �����û����ж�
         String isSuper = (String)session.getAttribute("isSuper");
        String operId = (String)session.getAttribute("operatorId");
//        if(!"1".equalsIgnoreCase(isSuper)){
//            strSql += "  and acn.sa_opac_instn_no ='"+operId+"'";
//        }
       DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
//       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("�ʺ�","text","18","acctno","true","0");
       dbGrid.setField("��ϸ����","text","9","sa_ddp_acct_no_det_n","true","0");
       dbGrid.setField("�ұ�","text","6","sa_curr_cod","true","0");
       dbGrid.setField("����Ա��","text","14","sa_opr_no","true","0");
       dbGrid.setField("���׻�����","text","16","opac_inil_1_chn","true","0");
       dbGrid.setField("����������","text","11","sa_cr_amt","true","0");
       dbGrid.setField("����ʻ����","text","12","sa_ddp_acct_bal","true","0");
       dbGrid.setField("�跽������","text","11","sa_dr_amt","true","0");
       dbGrid.setField("���׿���","text","18","sa_tx_crd_no","true","0");
       dbGrid.setField("������ˮ��","text","18","sa_tx_log_no","true","0");
       dbGrid.setField("��ע","text","20","sa_rmrk","true","0");
       dbGrid.setField("ժҪ����","text","4","sa_dscrp_cod","true","0");
       dbGrid.setField("��������","text","9","sa_tx_dt","true","0");
       dbGrid.setField("�Է�����","text","10","sa_op_cust_name","true","0");
       dbGrid.setpagesize(50);
//       dbGrid.setWhereStr(" and 1=2 ");
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
      <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <form id="queryForm" name="queryForm" method="post" action="historyDataQry.jsp">
        <tr height="20">
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              �ʺ�
              <input type="hidden" value="saacntxn" id="hidTabName" name="hidTabName"/>
              <input type="hidden" value="��˽��ϸ��ѯ" id="hidRMK" name="hidRMK" />
              <input type="hidden" value="<%=isSuper%>" id="hidIsSuper" name="hidIsSuper" />
              <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
              <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
            <input style="width:90%" type="text" id="acctno" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              ����
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input">
              <input type="text" style="width:90%;" id="cardNo" name="cardNo" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="10%" align="center" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="����">
          </td>
        </tr>
        <tr>

          <td width="15%" nowrap="nowrap" class="lbl_right_padding">����������</td>
            <td width="14%" nowrap="nowrap" class="data_input"><input type="text" id="busidate1" name="busidate1"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%"></td>
            <td width="2%" nowrap="nowrap" class="lbl_right_padding">��</td>
            <td width="14%" nowrap="nowrap" class="data_input"><input type="text" id="busidate2" name="busidate2"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%">
            </td>
            <td colspan="2" width="45%" align="right" nowrap="nowrap">
              &nbsp;
          </td>
          <td width="10%" align="center" nowrap="nowrap">
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
            <td id="dbGridContents">
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