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
     // ��־����
    private static final Log logger = LogFactory.getLog(GrantValidate.class);

    /*
    * ��Ȩ�û���֤����
    * ��֤ʧ�� resд�� 0
    * ��֤�ɹ� resд��1
    * */
    public void validate() {

        String operId = req.getFieldValue("operId"); //ȡ�ò�ѯ�û���¼�ţ�Ҳ������ţ�
        String grantUsrId = req.getFieldValue("userid").trim(); //ȡ����Ȩҳ�������û���
        String grantUsrPwd = req.getFieldValue("password").trim(); //ȡ����Ȩ�û�ҳ����������
        RecordSet rs1 = null;
        try {
            String strSql = " select t.operid,t.operpasswd from ptoper t where opertype='1' " +
                "and deptid=(select t1.deptid from ptoper t1 where t1.operid='"+operId+"') and t.operid ='"+ grantUsrId +"'  and t.operpasswd='"+ grantUsrPwd + "'";
            rs1 = dc.executeQuery(strSql);
             //��֤ʧ�� ����
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

