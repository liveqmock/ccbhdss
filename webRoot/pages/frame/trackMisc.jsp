<%@ page import="pub.platform.form.control.SessionContext" %>
<%@ page import="pub.platform.form.util.SessionAttributes" %>
<%@ page import="pub.platform.system.manage.dao.PtOperBean" %>
<!--
/*********************************************************************
* ��������: ��¼ϵͳ����ʾ��ҳ
* ��������: 2010/08/02
* �� �� ��: zxb
* �޸�����:
* �� Ȩ: ��˾
***********************************************************************/
-->
<%@page contentType="text/html; charset=GBK" %>
<%@include file="/global.jsp" %>
<%
    OperatorManager om = (OperatorManager) session.getAttribute(SystemAttributeNames.USER_INFO_NAME);
    if (om != null) {
        PtOperBean userBean = om.getOperator();
        String isSuper = userBean.getIssuper();
        String operId = om.getOperatorId();
        if (isSuper != null && operId != null) {
            session.setAttribute("isSuper", isSuper);
            session.setAttribute("operatorId", operId);
        }
    }
    DatabaseConnection conn = ConnectionManager.getInstance().get();
    RecordSet rs = conn.executeQuery(" select TX_DT as ftime,tx_id from DCC_HISTORYDATADATE where TX_ID IN(1,2) ");
    String str = "";
    String tx_id = "";
    List list1 = new ArrayList();
    while (rs.next()) {
        str = rs.getString("ftime");
        tx_id = rs.getString("tx_id");
        List tempList = new ArrayList();
        tempList.add(str);
        tempList.add(tx_id);
        list1.add(tempList);
    }
    ConnectionManager.getInstance().release();
    String qryResult = "���ؽ��";
    String mxqryResult = "���ؽ��";
    String updateDate = "";
    String mxUpdateDate = "";
    for (int i=0;i<list1.size();i++) {
        List tempList = new ArrayList();
        tempList = (ArrayList)list1.get(i);
        str = tempList.get(0).toString();
        tx_id = tempList.get(1).toString();
        str = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6,8);
        if (tx_id.equals("2")) {
            if (str != null && !"".equals(str.trim())) {
                updateDate = str;
                qryResult += "(���ݸ�����" + str + ")";
            }
        } else {
            if (str != null && !"".equals(str.trim())) {
                mxUpdateDate = str;
                mxqryResult += "(���ݲ�ѯ��ֹ��" + str + ")";
            }
        }
    }
    session.setAttribute("TimeFlagMsg", qryResult);
    session.setAttribute("mxTimeFlagMsg",mxqryResult);
%>
<html>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=GBK">
    <title></title>
    <script language="javascript" src="trackMisc.js"></script>
    <script language="javascript" src="/UI/support/pub.js"></script>
</head>
<body bgcolor="#ffffff" onLoad="" class="Bodydefault">
<div id="cardbaseinfo_msg" class="queryPanalDiv">
    <fieldset style="padding-top:30px;padding-bottom:0px">
        <%--<fieldset>--%>
        <legend>������Ϣ</legend>
        <br>
        <table border="0" cellspacing="0" cellpadding="5" width="50%">
            <tr>
                <td width="60%" class="lbl_right_padding">������Ϣ����ʱ���ֹ��</td>
                <td width="40%" class="data_input" id="_cardbase_newCnt"><%=updateDate%>
                </td>
            </tr>
            <tr>
                <td width="60%" class="lbl_right_padding">��ϸ��Ϣ��ѯ����ʱ���ֹ��</td>
                <td width="40%" class="data_input" id="_cardbase_newCnt"><%=mxUpdateDate%>
                </td>
            </tr>
            <tr>
                <td width="60%" class="lbl_right_padding">��ѯ��Χ˵��</td>
                <td width="40%" class="data_input" style="color:red;" id="_cardbase_newCnt">
                    ���е�¼�û���ֻ�ܲ�ѯ������Ϊ���е��˺����ݣ���
                </td>
            </tr>
        </table>
        <br>
    </fieldset>
</div>
</body>
</html>
