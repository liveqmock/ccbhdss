<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-11-23
  Time: 13:55:13
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
    <script language="javascript" src="asctlQry.js"></script>
      <%
       String operId = (String)session.getAttribute("operatorId");
       String strSql =  "select opun_cod, opun_nam from dccq_asctl where 1=1";
       DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
       dbGrid.setField("机构号","text","1","opun_cod","true","0");
       dbGrid.setField("机构名","text","1","opun_nam","true","0");
       dbGrid.setpagesize(50);
       dbGrid.setWhereStr(" and 1=2 ");
       dbGrid.setCheck(false);
        //////数据集按钮
       dbGrid.setdataPilotID("datapilot");
       dbGrid.setbuttons("moveFirst,prevPage,nextPage,moveLast");
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
                机构号
                <input type="hidden" value="dccq_ckmx" id="hidTabName" name="hidTabName"/>
                <input type="hidden" value="2004存款明细查询" id="hidRMK" name="hidRMK" />
                <input type="hidden" value="<%=operId%>" id="hidOpId" name="hidOpId"/>
                <input type="hidden" value="" id="hidGrantUsr" name="hidGrantUsr"/>
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
              <input style="width:90%" type="text" id="opun_cod" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>
            <%--<td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                客户名
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input">
                <input type="text" style="width:90%;" id="custName" name="custName" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>--%>
            <td width="10%" align="center" nowrap="nowrap">
              <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="检索">
            </td>
          </tr>
          <tr>
             <td width="15%" align="right" nowrap="nowrap" class="lbl_right_padding">
                机构名
            </td>
            <td width="30%" align="right" nowrap="nowrap" class="data_input" colspan="3">
                <input type="text" style="width:90%;" id="opun_nam" name="opun_nam" size="40" class="ajax-suggestion url-getLoanPull.jsp">
            </td>
            <%--<td colspan="2">&nbsp;</td>--%>
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