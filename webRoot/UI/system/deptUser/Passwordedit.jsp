<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="pub.platform.security.OperatorManager"%>
<%@ page import="pub.platform.form.config.SystemAttributeNames"%>
<html>
  <head>
    <LINK href="/css/ccb.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="/js/basic.js"></script>
    <script language="javascript" src="/js/xmlHttp.js"></script>
    <script language="javascript" src="/js/dbutil.js"></script>
    <title>���������޸�</title>
    <%
          String deptID = "";
          String operID = "";
          OperatorManager om = (OperatorManager) session.getAttribute(SystemAttributeNames.USER_INFO_NAME);

          if (om != null) {

            deptID = om.getOperator().getDeptid();
            operID = om.getOperator().getOperid();
          }
    %>
    <script language="javascript">
	<!--
	   	var dbOperateType = "";

		function SaveClick(){
			if (checkForm(editdept)=="false")
				return;

			if (document.all.newpwd.value == document.all.checkpwd.value){

				 var xmlDoc = createDoc();

                    var rootNode =createRootNode(xmlDoc);

                    var actionNode = createActionNode(xmlDoc,"sm0045");

                    rootNode.appendChild(actionNode);

                    var RecorderNode = createRecorderNode(xmlDoc,"select");
                    actionNode.appendChild(RecorderNode);

                    var fieldNode = createFieldNode(xmlDoc,"deptid","text",document.all.DeptID.value);
                    RecorderNode.appendChild(fieldNode);

				var fieldNode = createFieldNode(xmlDoc,"operid","text",document.all.operID.value);
                    RecorderNode.appendChild(fieldNode);

				//var fieldNode = createFieldNode(xmlDoc,"oldpwd","text",document.all.oldpwd.value);
                  // RecorderNode.appendChild(fieldNode);

				var fieldNode = createFieldNode(xmlDoc,"newpwd","text",document.all.newpwd.value);
                    RecorderNode.appendChild(fieldNode);

				

                 var retStr = ExecServerPrgm("/BI/util/SqlSelectJsp.jsp","POST","sys_request_xml="+xmlDoc.xml);
				 if (analyzeReturnXML(retStr)=="true")
                   	   window.close();




			}else{
				alert("��������ȷ�����벻��ȣ�");
				document.all.checkpwd.focus();
			}

		}

        	//-->
		</script>
  </head>
  <body bgcolor="#ffffff" class="Bodydefault">
  <br>
    <form id="editdept">
      <fieldset>
        <legend>
          �û�����
        </legend>
        <input id="DeptID" fieldName="deptid" fieldType="text" type="hidden" value="<%=deptID%>">
        <table align="center" valign="center">
          <tr>
            <td class="lbl_right_padding">
              ����Ա��
            </td>
            <td class="data_input">
              <input id="operID" disabled="true" fieldName="operid" textLength="50" fieldType="text" type="text" value="<%=operID%>">
            </td>
          </tr>
          <tr>
            <td class="lbl_right_padding">
              ������
            </td>
            <td class="data_input">
              <input id="newpwd" fieldName="newpwd" fieldType="text" isNull=false type="password">
            </td>
          </tr>
          <tr>
            <td class="lbl_right_padding">
              ȷ������
            </td>
            <td class="data_input">
              <input id="checkpwd" fieldName="checkpwd" fieldType="text" isNull=false type="password">
            </td>
          </tr>
        </table>
      </fieldset>
      <fieldset>
        <legend>
          ����
        </legend>
        <table width="100%">
          <tr align="center">
            <td colspan="2" align="center">
              <input id="savebut" class="buttonGrooveDisable" onmouseover="button_onmouseover()" onmouseout="button_onmouseout()" type="button" value="ȷ��" onclick="SaveClick();">
              <input id="closebut" class="buttonGrooveDisable" onmouseover="button_onmouseover()" onmouseout="button_onmouseout()" type="button" value="ȡ��" onclick="window.close()">
            </td>
          </tr>
        </table>
      </fieldset>
    </form>
  </body>
</html>