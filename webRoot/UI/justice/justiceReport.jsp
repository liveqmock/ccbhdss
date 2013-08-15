<%@page contentType="text/html; charset=GBK" %>
<%@page import="pub.platform.db.ConnectionManager" %>
<%@page import="pub.platform.db.DatabaseConnection" %>
<%@page import="pub.platform.db.RecordSet" %>
<%@page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStream" %>
<%

    try {
        do {
            // 输出报表
            response.reset();
            response.setContentType("text/plain");
            response.addHeader("Content-Disposition", "attachment; filename=" + "sfcxRpt.txt");

            StringBuffer sb = new StringBuffer();
            String path = new java.io.File(application.getRealPath(request.getRequestURI())).getParent();

            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path + "/justiceAcctInfo.xml"), "UTF-8"));

            OutputStream os = null;
            String data = null;
            try {
                while ((data = br.readLine()) != null) {
                    sb.append(data);
                }
            } catch (Exception e) {
                System.out.println(e);
            } finally {
                br.close();
            }

            StringBuffer outSb = new StringBuffer();
            DatabaseConnection conn = ConnectionManager.getInstance().get();
            RecordSet rs = conn.executeQuery(sb.toString());

            int columns = 14;
            while (rs.next()) {
                for (int i = 0; i < columns; i++) {
                    String field = rs.getString(i);
                    if (field == null || "null".equals(field)) {
                        field = "";
                    }
                    outSb.append(field);
                    if (i != columns - 1) {
                        outSb.append("|");
                    }else{
                        outSb.append("\r\n");
                    }
                }
            }


            try {
                os = response.getOutputStream();
                String historyAlarm = outSb.toString();
                byte[] byt = historyAlarm.getBytes();
                os.write(byt);
            } catch (Exception e) {
                System.out.println(e);
            } finally {
                os.flush();
                os.close();
            }

        } while (false);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 释放数据库连接
        ConnectionManager.getInstance().release();
    }
%>