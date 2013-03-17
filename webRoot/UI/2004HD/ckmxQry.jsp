<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-11-23
  Time: 11:52:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp"%>
<html>
  <head><title>Simple jsp page</title>
  <script language="javascript" src="/UI/support/pub.js"></script>
    <script language="javascript" src="/js/basic.js"></script>
    <script language="javascript" src="/js/xmlHttp.js"></script>
    <script language="javascript" src="/js/dbgrid.js"></script>
    <script language="javascript" src="/js/dropdownData.js"></script>
    <script language="javascript" src="/js/dbutil.js"></script>
    <script language="javascript" src="ckmxQry.js"></script>
      <%
       String operId = (String)session.getAttribute("operatorId");
       String strSql =  "select t.year,t.md,t.accno,t.vouchers,t.voutype,t.abst,t.jieamt/100,t.daiamt/100,t.curbal/100" +
               ",t.daynum,t.balttl/100,t.teller,t.checker,t.prtpage " +
               " from gwk.dccq_ckmx t left join gwk.dccq_asacc t1 on t.accno=t1.accno where 1=1";
       DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("年份","text","8","year","true","0");
       dbGrid.setField("月日","text","6","md","true","0");
       dbGrid.setField("账号","text","12","accno","true","0");
       dbGrid.setField("凭证号","text","10","vouchers","true","0");
       dbGrid.setField("凭证种类","text","6","voutype","true","0");
       dbGrid.setField("摘要","text","10","abst","true","0");
       dbGrid.setField("借方发生额","text","11","jieamt","true","0");
       dbGrid.setField("贷方发生额","text","10","daiamt","true","0");
       dbGrid.setField("余额","text","10","curbal","true","0");
       dbGrid.setField("累计日数","text","8","daynum","true","0");
       dbGrid.setField("累计积数","text","8","balttl","true","0");
       dbGrid.setField("柜员代码","text","8","teller","true","0");
       dbGrid.setField("复核员","text","10","checker","true","0");
       dbGrid.setField("页号","text","6","prtpage","true","0");
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
          查询条件
        </legend>
        <table border="0" cellspacing="0" cellpadding="0" width="100%" >
          <form id="queryForm" name="queryForm" method="post" action="dargnQry.jsp">
          <tr height="20">
            <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                帐号
                <input type="hidden" value="dccq_ckmx" id="hidTabName" name="hidTabName"/>
                <input type="hidden" value="2004存款明细查询" id="hidRMK" name="hidRMK" />
                <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
                <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
              <input style="width:90%" type="text" id="acctno" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>
            <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                客户名
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input">
                <input type="text" style="width:90%;" id="custName" name="custName" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>
            <td width="10%" align="center" nowrap="nowrap">
              <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="检索">
            </td>
          </tr>
          <tr>
             <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                年份
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
                <input type="text" style="width:90%;" id="year" name="year" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>
            <td colspan="2">&nbsp;</td>
            <td width="10%" align="center" nowrap="nowrap">
              <input name="Input" class="buttonGrooveDisable" type="reset" value="重填" >
            </td>
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