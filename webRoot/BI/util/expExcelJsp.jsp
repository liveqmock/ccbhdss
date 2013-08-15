<%@ page contentType="application/x-download; charset=UTF-8" %>
<%@ page import="pub.platform.db.DBXML" %>
<%@ page import="pub.platform.utils.Basic" %>
<%@ page import="jxl.Workbook" %>
<%@ page import="jxl.write.WritableWorkbook" %>
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ page import="java.io.OutputStream" %>
<%
    //    Log logger = LogFactory.getLog("expExcelJsp.jsp");

//    try {
    DBXML testxml = new DBXML();
    String xmnlStr = request.getParameter("xx");

    request.setCharacterEncoding("GBK");
    response.reset();
    response.setContentType("application/vnd.ms-excel");
    response.addHeader("Content-Disposition", "attachment; filename=" + "export" + ".xls");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("Expires", "0");


    OutputStream outputStream = response.getOutputStream();

    WritableWorkbook workbook = Workbook.createWorkbook(outputStream);
    //..... write the excel
    String decode = Basic.decode(xmnlStr);
    String rexml = testxml.doExcelHou(decode, workbook);

    workbook.write();
    workbook.close();
    outputStream.close();

    response.flushBuffer();

//    } catch (Exception e) {
//        logger.error(e);
//    }


%>
<%--<%=rexml%>--%>
