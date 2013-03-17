package com.ccb.historydataqry;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2010-9-20
 * Time: 10:45:19
 * To change this template use File | Settings | File Templates.
 */

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import pub.platform.db.RecordSet;
import pub.platform.form.control.Action;

public class GrantValidate  extends Action  {
     // 日志对象
    private static final Log logger = LogFactory.getLog(GrantValidate.class);

    /*
    * 授权用户验证功能
    * 验证失败 res写入 0
    * 验证成功 res写入1
    * */
    public void validate() {

        String operId = req.getFieldValue("operId"); //取得查询用户登录号（也是网点号）
        String grantUsrId = req.getFieldValue("userid").trim(); //取得授权页面输入用户号
        String grantUsrPwd = req.getFieldValue("password").trim(); //取得授权用户页面输入密码
        RecordSet rs1 = null;
        try {
            String strSql = " select t.operid,t.operpasswd from ptoper t where opertype='1' " +
                "and deptid=(select t1.deptid from ptoper t1 where t1.operid='"+operId+"') and t.operid ='"+ grantUsrId +"'  and t.operpasswd='"+ grantUsrPwd + "'";
            rs1 = dc.executeQuery(strSql);
             //验证失败 返回
            if (rs1.getRecordCount() < 1) {
               this.res.setFieldName("flag");
               this.res.setFieldType("text");
               this.res.setEnumType("0");
               this.res.setFieldValue("0");
               this.res.setType(4);
               this.res.setResult(true);
           } else {
               this.res.setFieldName("flag");
               this.res.setFieldType("text");
               this.res.setEnumType("0");
               this.res.setFieldValue("1");
               this.res.setType(4);
               this.res.setResult(true);
           }
        } catch (Exception ex) {
            ex.printStackTrace();
            this.res.setFieldName("flag");
           this.res.setFieldType("text");
           this.res.setEnumType("0");
           this.res.setFieldValue("0");
           this.res.setType(4);
           this.res.setResult(true);
        } finally {
            if (rs1 != null) {
                rs1.close();
            }
        }

    }
}

