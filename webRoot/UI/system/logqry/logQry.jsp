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
         dbGrid.setField("��������","text","60","tablename","true","0");
       dbGrid.setField("��������","text","70","tasktype","true","0");
       dbGrid.setField("����ִ�����ʱ��","text","70","tasktime","true","0");
       dbGrid.setField("������ԱID","text","70","operid","true","0");
         dbGrid.setField("�ʺ�","text","70","acctno","true","0");
       dbGrid.setField("����","text","70","cardno","true","0");
        dbGrid.setField("���֤��","text","70","custno","true","0");
       dbGrid.setField("�ͻ�����","text","70","custname","true","0");
       dbGrid.setField("����������","text","70","txdtstart","true","0");
       dbGrid.setField("��������ֹ","text","70","txdtend","true","0");
       dbGrid.setField("��������","text","70","origbranch","true","0");
       dbGrid.setField("��������","text","70","openaccdate","true","0");
       dbGrid.setField("��������","text","70","fsorigbranch","true","0");
        dbGrid.setField("��ע","text","70","remarks","true","0");
        dbGrid.setField("IP","text","70","clientaddr","true","0");
        dbGrid.setField("��Ȩ��","text","70","grantuser","true","0");
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
            <td width="13%" align="right" nowrap="nowrap" class="lbl_right_padding">
              ������ԱID
          </td>
          <td width="30%" align="right" nowrap="nowrap" class="data_input">
              <input type="text" style="width:90%;" id="operid" name="operid" size="40" class="ajax-suggestion url-getLoanPull.jsp"/>
          </td>
              <td width="13%" nowrap="nowrap" class="lbl_right_padding">����������</td>
            <td width="17%" nowrap="nowrap" class="data_input"><input type="text" id="busidate1" name="busidate1"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%"></td>
            <td width="2%" nowrap="nowrap" class="lbl_right_padding">��</td>
            <td width="17%" nowrap="nowrap" class="data_input"><input type="text" id="busidate2" name="busidate2"
                                                                      onClick="WdatePicker()" fieldType="date"
                                                                      style="width:80%">
            </td>
          <td width="8%" align="left" nowrap="nowrap">
            <input name="cbRetrieve" type="button" class="buttonGrooveDisable" id="button" onClick="cbRetrieve_Click()" value="����"/>
            <input name="Input" class="buttonGrooveDisable" type="reset" value="����" />
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