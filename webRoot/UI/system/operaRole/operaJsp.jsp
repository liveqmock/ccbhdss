<%@ include file="/pages/security/online.jsp" %>
<%@ page contentType="text/html; charset=GBK" %>

<html>
<head>

    <title>

    </title>
    <LINK href="/css/ccb.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="/js/basic.js"></script>
    <script language="javascript" src="/js/xmlHttp.js"></script>
    <script language="javascript" src="/js/dbutil.js"></script>
    <script language="javascript" src="/js/tree.js"></script>

    <script language="javascript" src="operaJsp.js"></script>

    <LINK href="/dhtmlx/codebase/dhtmlxlayout.css" type="text/css" rel="stylesheet">
    <LINK href="/dhtmlx/codebase/skins/dhtmlxlayout_dhx_skyblue.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="/dhtmlx/codebase/dhtmlxcommon.js"></script>
    <script language="javascript" src="/dhtmlx/codebase/dhtmlxlayout.js"></script>
    <script language="javascript" src="/dhtmlx/codebase/dhtmlxcontainer.js"></script>

</head>

<BODY onload="doOnLoad();" onclick="body_Click()" onresize="changeheigth()"
      oncontextmenu="event.returnValue=false;" class="Bodydefault">

<input type="hidden" id="paramValue" NAME="paramValue">

<div id="parentId"
     style="position:absolute; margin:10px 0px 0px 10px; width:98%; height:98%; aborder:#B5CDE4 1px solid;">
</div>

<div id="menuId" style="width: 100%; height: 100%; overflow: auto; display: none;">
    <div style="margin: 3px;">
        <ul id="rootUl" style="WIDTH:100%;left:-30px;POSITION: relative;top:5px"
            onmousemove="tv_OnMouseMove()" onmousedown="tv_OnMouseDown()" onmouseup="tv_OnMouseUp()">
        </ul>
    </div>
</div>

<div id="gridId" style="width: 100%; height: 100%; overflow: auto; display: none;">
    <div style="margin: 3px 5px 3px 5px;">
        <div id="innerDocTD">
            <iframe bgcolor="#d4d0c8" id='frmContainer'
                    style="WIDTH: 100%; HEIGHT: 90%"
                    frameborder='0' scrolling='auto'>
            </iframe>
        </div>
    </div>
</div>

</BODY>
</html>
