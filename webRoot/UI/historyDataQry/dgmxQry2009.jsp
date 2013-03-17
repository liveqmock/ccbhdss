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
    <script language="javascript" src="dgmxQry2009.js"></script>
    <%
        String qryResult = null;
        qryResult = (String)session.getAttribute("mxTimeFlagMsg");
       String strSql =  " select fnc_get_contrast(satn.sa_acct_no) as acctno,satn.sa_ddp_acct_no_det_n," +
               " satn.sa_curr_cod,satn.sa_opr_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1" +
               " where ct1.cm_opun_cod=substr(satn.sa_opr_no,0,9)) as opac_inil_1_chn,satn.sa_cr_amt," +
               " satn.sa_ddp_acct_bal,satn.sa_dr_amt,satn.sa_tx_crd_no,satn.sa_tx_log_no,satn.sa_rmrk," +
               " satn.sa_tx_dt,satn.sa_op_cust_name,satn.sa_op_acct_no_32," +
               " satn.sa_op_bank_no,satn.sa_op_tx_no,satn.sa_op_tx_no_typ " +
               " from saecntxn satn left join dcc_saecnecn sen on satn.sa_acct_no=sen.sa_acct_no " +
               " where 1=1 " +
               " and satn.sa_tx_dt<=(select t.tx_dt from dcc_historydatadate t where t.tx_id=1)" +
               " and satn.sa_tx_dt>=20090101 ";
       // 超级用户的判断
         String isSuper = (String)session.getAttribute("isSuper");
        String operId = (String)session.getAttribute("operatorId");
        if(!"1".equalsIgnoreCase(isSuper)){
            strSql += "  and sen.sa_opac_instn_no ='"+operId+"'";
        }
       DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("帐号","text","30","acctno","true","0");
       dbGrid.setField("明细笔数","text","14","sa_ddp_acct_no_det_n","true","0");
       dbGrid.setField("币别","text","10","sa_curr_cod","true","0");
       dbGrid.setField("操作员号","text","24","sa_opr_no","true","0");
       dbGrid.setField("交易机构名","text","30","opac_inil_1_chn","true","0");
       dbGrid.setField("贷方发生额","text","16","sa_cr_amt","true","0");
       dbGrid.setField("活存帐户余额","text","16","sa_ddp_acct_bal","true","0");
       dbGrid.setField("借方发生额","text","16","sa_dr_amt","true","0");
       dbGrid.setField("交易卡号","text","20","sa_tx_crd_no","true","0");
       dbGrid.setField("交易流水号","text","32","sa_tx_log_no","true","0");
       dbGrid.setField("备注","text","20","sa_rmrk","true","0");
       dbGrid.setField("交易日期","text","16","sa_tx_dt","true","0");
       dbGrid.setField("对方账号","text","26","sa_op_acct_no_32","true","0");
       dbGrid.setField("对方户名","text","15","sa_op_cust_name","true","0");
       dbGrid.setField("对方行号","text","15","sa_op_bank_no","true","0");
       dbGrid.setField("对方交易账号","text","24","sa_op_tx_no","true","0");
       dbGrid.setField("对方交易账号类型","text","24","sa_op_tx_no_typ","true","0");
       dbGrid.setpagesize(50);
       dbGrid.setWhereStr(" and 1=2 ");
       dbGrid.setCheck(false);
        //////数据集按钮
       dbGrid.setdataPilotID("datapilot");
       dbGrid.setbuttons("导出Excel=excel,moveFirst,prevPage,nextPage,moveLast");
    %>
  </head>
  <body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">

  <fieldset>
      <legend>
        对公活期2009年后明细查询条件
      </legend>
      <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <form id="queryForm" name="queryForm" method="post" action="historyDataQry.jsp">
        <tr height="20">
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              帐号
              <input type="hidden" value="saecntxn" id="hidTabName" name="hidTabName"/>
              <input type="hidden" value="2009年后对公明细查询" id="hidRMK" name="hidRMK" />
              <input type="hidden" value="<%=isSuper%>" id="hidIsSuper" name="hidIsSuper" />
              <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
              <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
          </td>
          <td width="32%" align="right" nowrap="nowrap" class="data_input" colspan="3">
            <input style="width:90%" type="text" id="acctno" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="15%" nowrap="nowrap" class="lbl_right_padding">交易日期起</td>
            <td width="14%" nowrap="nowrap" class="data_input"><input type="text" id="busidate1" name="busidate1"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:90%"></td>
            <td width="2%" nowrap="nowrap" class="lbl_right_padding">至</td>
            <td width="14%" nowrap="nowrap" class="data_input"><input type="text" id="busidate2" name="busidate2"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:90%">
            </td>
          <td width="8%" align="left" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="检索">
            <input name="Input" class="buttonGrooveDisable" type="reset" value="重填" >
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