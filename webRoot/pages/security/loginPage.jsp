<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="pub.platform.form.config.SystemAttributeNames" %>
<%@ page import="pub.platform.advance.utils.PropertyManager" %>
<%@ page import="pub.platform.security.OperatorManager" %>

<script language="javascript" src="/js/login.js"></script>
<%

    OperatorManager om = new OperatorManager();

    out.println("<script language=\"javascript\"> window.imgsign =\"" + om.getImgSign() + "\" </script>");


    String username = request.getParameter("username");
    if (username == null) {
        username = "";
    } else {
        username = new String(username.getBytes("ISO-8859-1"), "GBK");

    }

    String password = request.getParameter("password");
    if (password == null) {
        password = "";
    } else {
        password = new String(password.getBytes("ISO-8859-1"), "GBK");

    }
%>

<html>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=GBK">
    <%--<title>中国建设银行青岛分行抵押自动跟踪系统</title>--%>
    <title>历史数据查询系统</title>
    <script language="javascript" src="/js/basic.js"></script>
    <script language="javascript" src="/js/login.js"></script>
    <link href="../../css/ccb.css" rel="stylesheet" type="text/css">

    <style type="text/css">
        <!--
        .bg {
            background-repeat: repeat-y;
        }

        .f14 {
            font-family: "??ì?";
            font-size: 14px;
        }

        .style3 {
            font-size: 12px;
            color: #ffffff;
            background: #7d99ff;
            border: 3px double #7d99ff;
            width: auto;
            height: 21px;
            left: 1px;
            top: 1px;
            right: 1px;
            bottom: 1px;
            padding: 1px;
            margin: 3px;
        }

        -->
    </style>
</head>

<body topmargin="0" onLoad="FocusUsername();" background="/images/background-gradient.png">
<div align="center">
    <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <td width="10%" align="center" valign="middle">&nbsp; </td>
            <td width="10%" align="center" valign="middle">
                <form action="/pages/frame/homePage.jsp" method="post" name="winform" onSubmit="return false;">
                    <table width="60%" border="0" cellpadding="0" cellspacing="0" class="bg">
                        <tr>
                            <td><img src="/images/frame/login.gif" width="330" height="42"></td>
                        </tr>
                        <tr>
                            <td height="97" align="center" background="/images/frame/login_bg.gif" class="bg"><br>
                                <table width="100" height="100" border="0" align="center" cellpadding="0"
                                       cellspacing="0">
                                    <tr>
                                        <td width="10%" align="right" valign="middle" nowrap="nowrap">用户名：</td>
                                        <td colspan="2" valign="middle" nowrap="nowrap">
                                            <input name="username" type="text" value="" id="username"
                                                   onKeyPress="return focusNext(this.form, 'password', event)"
                                                   size="30"></td>
                                    </tr>
                                    <tr>
                                        <td width="10%" align="right" valign="middle">密码：</td>
                                        <td colspan="2" valign="middle"><input name="password" type="password" value=""
                                                                               id="password"
                                                                               onKeyPress="return submitViaEnter(event)"
                                                                               size="30"></td>
                                    </tr>
                                  
                                </table>
                                <br></td>
                        </tr>
                        <tr>
                            <td height="42" align="center" valign="middle" background="/images/frame/login_bottom.gif">
                                <%--<br>--%>
                                <input type="submit" name="Submit" value="&nbsp;&nbsp;&nbsp;确 认&nbsp;&nbsp;&nbsp;"
                                       onclick="if( ValidateLength()){  document.winform.submit();}"
                                       class="buttonGrooveDisable" onMouseOver="button_onmouseover()"
                                       onMouseOut="button_onmouseout()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input name="reset" type="reset" value="&nbsp;&nbsp;&nbsp;重 填&nbsp;&nbsp;&nbsp;" class="buttonGrooveDisable"
                                       onMouseOver="button_onmouseover()" onMouseOut="button_onmouseout()">
                        </tr>
                    </table>
                </form>
            </td>
            <td width="10%" align="center" valign="middle">&nbsp;</td>
        </tr>
    </table>
</div>
</body>
</html>
