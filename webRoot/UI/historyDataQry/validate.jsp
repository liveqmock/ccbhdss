<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2010-9-17
  Time: 10:41:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp"%>

<html>
  <head><title>�û���Ȩ</title>
  <script type="text/javascript" language="javascript">
      function validateValue() {
        if (trimStr(document.getElementById("userid").value) == "" || trimStr(document.getElementById("password").value) == "") {
            alert("�û������벻��Ϊ�գ�");
            return false;
        }
        var rntxml = createExecuteform(queryForm, "insert", "grant1", "validate");
        if (analyzeReturnXML(rntxml) != "false") {
            var dom = createDomDocument();
            dom.loadXML(rntxml);
            var fieldList = dom.getElementsByTagName("record")[0];
            for (var i = 0; i < fieldList.childNodes.length; i++) {
                if (fieldList.childNodes[i].nodeType == 1) {
                    oneRecord = fieldList.childNodes[i];
                    attrName = oneRecord.getAttribute("name");
                    if (attrName == "flag") {
                        flag = decode(oneRecord.getAttribute("value"));
                        if (flag != "1") {
                            alert("��Ȩδ�ɹ�����������ȷ����Ȩ��");
                            document.getElementById("userid").focus();
                            document.getElementById("userid").select();
                            return false;
                        } else {
                            window.returnValue = document.getElementById("userid").value;
                            window.close();
                        }
                    }
                }
            }
        }
      }

  </script>
  <%
    OperatorManager om = (OperatorManager) session.getAttribute(SystemAttributeNames.USER_INFO_NAME);
    String operId = "";
    operId = om.getOperatorId();


%>
  </head>
  <body>

          <fieldset>
              <legend>
                  ��ѯ��Ȩ
              </legend>
              <form id="queryForm" name="queryForm">
              <input type="hidden" id="operId" value="<%=operId%>">
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="30%" align="right" nowrap="nowrap" class="lbl_right_padding">��Ȩ�û�</td>
                    <td width="70%" align="right" nowrap="nowrap" class="data_input">
                        <input name="userid" id="userid" type="text" value="" size="30">
                    </td>
                <tr>
                    <td width="30%" align="right" nowrap="nowrap" class="lbl_right_padding">����</td>
                    <td width="70%" align="right" nowrap="nowrap" class="data_input">
                        <input name="password" id="password" type="password" value="" size="30">
                    </td>
                </tr>
            </table>
            </form>
          </fieldset>
          <fieldset>
              <legend>
                  ����
              </legend>
            <table align="center">
                 <tr>
                    <td align="center">
                        <input class="buttonGrooveDisable" type="button" id="btnSubmit" onclick="validateValue()" value="ȷ ��">
                         <input name="Input" class="buttonGrooveDisable" type="reset" value="ȡ ��"  onClick="window.close();">
                    </td>
                </tr>
            </table>
          </fieldset>

  </body>
</html>