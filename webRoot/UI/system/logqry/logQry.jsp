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
    <script language="javascript" src="logQry.js"></script>
    <%
       String strSql =  "select tablename,tasktype,tasktime,operid,acctno,cardno,custno,custname,txdtstart,txdtend,origbranch," +
                              "  openaccdate,fsorigbranch,remarks,clientaddr,grantuser" +
                              " from dcc_taskinfo where 1=1";
       DBGrid dbGrid = new DBGrid();
       dbGrid.setGridID("ActionTable");
       dbGrid.setGridType("edit");
       dbGrid.setfieldSQL(strSql);
         dbGrid.setField("操作表名","text","60","tablename","true","0");
       dbGrid.setField("任务类型","text","70","tasktype","true","0");
       dbGrid.setField("任务执行完成时间","text","70","tasktime","true","0");
       dbGrid.setField("操作人员ID","text","70","operid","true","0");
         dbGrid.setField("帐号","text","70","acctno","true","0");
       dbGrid.setField("卡号","text","70","cardno","true","0");
        dbGrid.setField("身份证号","text","70","custno","true","0");
       dbGrid.setField("客户姓名","text","70","custname","true","0");
       dbGrid.setField("交易日期起","text","70","txdtstart","true","0");
       dbGrid.setField("交易日期止","text","70","txdtend","true","0");
       dbGrid.setField("开户所号","text","70","origbranch","true","0");
       dbGrid.setField("开户日期","text","70","openaccdate","true","0");
       dbGrid.setField("发生所号","text","70","fsorigbranch","true","0");
        dbGrid.setField("备注","text","70","remarks","true","0");
        dbGrid.setField("IP","text","70","clientaddr","true","0");
        dbGrid.setField("授权号","text","70","grantuser","true","0");
       dbGrid.setpagesize(50);
//       dbGrid.setWhereStr(" and 1=2 ");
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
  <form id="queryForm" name="queryForm" method="post" action="historyDataQry.jsp">
        <tr height="20">
            <td width="13%" align="right" nowrap="nowrap" class="lbl_right_padding">
              操作人员ID
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input">
              <input type="text" style="width:90%;" id="operid" name="operid" size="40" class="ajax-suggestion url-getLoanPull.jsp"/>
          </td>
              <td width="13%" nowrap="nowrap" class="lbl_right_padding">操作日期起</td>
            <td width="17%" nowrap="nowrap" class="data_input"><input type="text" id="busidate1" name="busidate1"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%"></td>
            <td width="2%" nowrap="nowrap" class="lbl_right_padding">至</td>
            <td width="17%" nowrap="nowrap" class="data_input"><input type="text" id="busidate2" name="busidate2"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%">
            </td>
          <td width="8%" align="left" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="检索"/>
            <input name="Input" class="buttonGrooveDisable" type="reset" value="重填" />
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