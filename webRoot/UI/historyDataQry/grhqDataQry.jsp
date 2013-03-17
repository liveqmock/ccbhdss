<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-8-23
  Time: 13:49:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp"%>
<script language="javascript" src="grhqDataQry.js"></script>
 <script language="javascript" src="/UI/support/pub.js"></script>
<html>
  <head><title></title>
    <%
        String qryResult = null;
        qryResult = (String)session.getAttribute("TimeFlagMsg");
       String strSql =  "select   sacn.sa_cust_no,sacn.sa_cust_name,fnc_get_contrast(sacn.sa_acct_no) as wb_zh,"+
               "sacn.sa_card_no,sacn.sa_opac_instn_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1  where ct1.cm_opun_cod=sacn.sa_opac_instn_no) as opac_inil_1_chn,"+
               "sacn.sa_opac_dt,sacn.sa_cacct_instn_no,(select ct1.cm_opun_inil_1_chn from dcc_cmbctbct ct1 where ct1.cm_opun_cod=sacn.sa_cacct_instn_no) as cacct_inil_1_chn,"+
               "sacn.sa_cacct_dt,samt.sa_ddp_acct_sts from dcc_saacnacn sacn  join dcc_saacnamt samt on sacn.sa_acct_no=samt.sa_acct_no where 1=1 ";
                // 超级用户的判断
         String isSuper = (String)session.getAttribute("isSuper");
        String operId = (String)session.getAttribute("operatorId");
        if(!"1".equalsIgnoreCase(isSuper)){
            strSql += " and sa_opac_instn_no='"+operId+"'";
        }
        DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("客户编号","text","12","sa_cust_no","true","0");
       dbGrid.setField("客户名称","text","8","sa_cust_name","true","0");
       dbGrid.setField("帐号","text","12","wb_zh","true","0");
       dbGrid.setField("卡号","text","13","sa_card_no","true","0");
       dbGrid.setField("开户机构号","text","8","sa_opac_instn_no","true","0");
       dbGrid.setField("开户机构名","text","12","opac_inil_1_chn","true","0");
       dbGrid.setField("开户日期","text","8","sa_opac_dt","true","0");
       dbGrid.setField("销户机构号","text","8","sa_cacct_instn_no","true","0");
       dbGrid.setField("销户机构名","text","10","cacct_inil_1_chn","true","0");
       dbGrid.setField("销户日期","text","8","sa_cacct_dt","true","0");
       dbGrid.setField("帐户状态","dropdown","8","sa_ddp_acct_sts","true","GRHQHISACCTSTS");
       dbGrid.setWhereStr(" and 1=2 ");
       dbGrid.setpagesize(50);
       dbGrid.setCheck(false);
        //////数据集按钮
       dbGrid.setdataPilotID("datapilot");
       dbGrid.setbuttons("moveFirst,prevPage,nextPage,moveLast");
    %>
  </head>
  <body bgcolor="#ffffff" onload="body_resize();" class="Bodydefault">
  <fieldset>
      <legend>
        对私活期开户信息查询条件
      </legend>
      <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <form id="queryForm" name="queryForm" method="post" action="grhqDataQry.jsp">
        <tr height="20">
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              帐号
              <input type="hidden" value="dcc_saacnacn" id="hidTabName" name="hidTabName"/>
              <input type="hidden" value="对私活期主档查询" id="hidRMK" name="hidRMK" />
               <input type="hidden" value="<%=isSuper%>" id="hidIsSuper" name="hidIsSuper" />
              <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
              <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" >
            <input style="width:90%" type="text" id="acctno" name="acctno" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              卡号
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
              <input type="text" style="width:90%;" id="cardNo" name="cardNo" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="10%" align="center" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="检索">
          </td>
        </tr>
        <tr>
             <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              身份证号
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" >
            <input style="width:90%" type="text" id="custNo"  name="custNo" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
              客户姓名
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
              <input type="text" style="width:90%;" id="custName" name="custName" size="40" class="ajax-suggestion url-getLoanPull.jsp">
          </td>
          <td width="10%" align="center" nowrap="nowrap">
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