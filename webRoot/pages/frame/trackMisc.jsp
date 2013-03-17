<%@ page import="pub.platform.form.control.SessionContext" %>
<%@ page import="pub.platform.form.util.SessionAttributes" %>
<%@ page import="pub.platform.system.manage.dao.PtOperBean" %>
<!--
/*********************************************************************
* 功能描述: 登录系统后显示此页
* 开发日期: 2010/08/02
* 修 改 人: zxb
* 修改日期:
* 版 权: 公司
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
    String qryResult = "返回结果";
    String mxqryResult = "返回结果";
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
                qryResult += "(数据更新至" + str + ")";
            }
        } else {
            if (str != null && !"".equals(str.trim())) {
                mxUpdateDate = str;
                mxqryResult += "(数据查询截止至" + str + ")";
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
        <legend>开户信息</legend>
        <br>
        <table border="0" cellspacing="0" cellpadding="5" width="50%">
            <tr>
                <td width="60%" class="lbl_right_padding">开户信息更新时间截止到</td>
                <td width="40%" class="data_input" id="_cardbase_newCnt"><%=updateDate%>
                </td>
            </tr>
            <tr>
                <td width="60%" class="lbl_right_padding">明细信息查询交易时间截止至</td>
                <td width="40%" class="data_input" id="_cardbase_newCnt"><%=mxUpdateDate%>
                </td>
            </tr>
            <tr>
                <td width="60%" class="lbl_right_padding">查询范围说明</td>
                <td width="40%" class="data_input" style="color:red;" id="_cardbase_newCnt">
                    该行登录用户，只能查询开户行为本行的账号数据！！
                </td>
            </tr>
        </table>
        <br>
    </fieldset>
</div>
</body>
</html>
