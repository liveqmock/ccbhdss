package com.ccb.cardinfo;

import com.ccb.consume.RtnTagKey;
import gov.mof.fasp.service.BankService;
import gov.mof.fasp.service.adapter.client.FaspServiceAdapter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import pub.platform.db.RecordSet;
import pub.platform.form.control.Action;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: zhangxiaobo
 * To change this template use File | Settings | File Templates.
 */
public class SendCardbaseAction extends Action {
    // 记录发送的卡信息记录数
    private int sendCrdTotalCnt = 0;

    // 记录发送成功的卡信息记录数
    private int sendCrdSucCnt = 0;

    private static final Log logger = LogFactory.getLog(SendCardbaseAction.class);

    // 发送未发送的卡信息
    public int sendCrdbaseInfos() {
        // 查询ls_cardbaseinfo中尚未发送的正常使用的卡数据
        List cardList = null;
        try {
            cardList = querySendCrds();
        } catch (Exception e) {
            logger.error("查询尚未发送的卡信息数据时出现异常，请查看系统日志。");
            this.res.setType(0);
            this.res.setResult(false);
            this.res.setMessage("查询尚未发送的卡信息数据时出现异常，请查看系统日志。");
            return -1;
        }
        List rtnlist = null;
        if(cardList != null && cardList.size() > 0){
            rtnlist = this.sendCrdInfos(cardList);
         }

         //
        if (rtnlist != null && rtnlist.size() > 0) {
            // 处理返回信息
            for (int i = 0; i < rtnlist.size(); i++) {
                Map m1 = (Map) rtnlist.get(i);
                String result = (String) m1.get(RtnTagKey.RESULT);
                // 通过判断result的值判断是否发送成功，若全部成功则返回一个result==success的值
                if (RtnTagKey.RESULT_SUCCESS.equalsIgnoreCase(result)) {
                    try {
                        // 更新本地数据状态
                       this.sendCrdSucCnt += updateSentFlag("1");
                    } catch (Exception e) {
                        logger.error("发送数据后更新本地数据为已发送状态出现异常，请查看系统日志。");
                        this.res.setType(0);
                        this.res.setResult(false);
                        this.res.setMessage("发送数据后更新本地数据为已发送状态出现异常，请查看系统日志。");
                        return -1;
                    }
                } else {
                    // 判断是否有重复帐号和身份证号，若有，则更改记录状态为已发送
                    String sameid = (String) m1.get("sameidnumber");
                    String sameaccount = (String) m1.get("sameaccount");
                    if ((sameid != null && !"".equals(sameid.trim()))
                            && (sameaccount != null && !"".equals(sameaccount.trim()))) {
                        try {
                           this.sendCrdSucCnt += updateSentFlag(sameid, sameaccount);
                        } catch (Exception e) {
                            logger.error("发送数据后更新重复发送的数据时出现异常，请查看系统日志。");
                            this.res.setType(0);
                            this.res.setResult(false);
                            this.res.setMessage("发送数据后更新重复发送的数据时出现异常，请查看系统日志。");
                            return -1;
                        }
                    }
                }
            }
        }
            String send_update_count = String.valueOf(this.sendCrdTotalCnt)+ "_" + String.valueOf(this.sendCrdSucCnt);
            this.res.setFieldName("rtnCnt");
            this.res.setFieldType("text");
            this.res.setEnumType("0");
            this.res.setFieldValue(send_update_count);
            this.res.setType(4);
            this.res.setResult(true);

        return 0;
    }

    // 查询未发送的正常卡数据
    private List querySendCrds() {
        List cardList = new ArrayList();
        String querySql = "select * from ls_cardbaseinfo where sentflag = '0'";
        RecordSet rs = dc.executeQuery(querySql);
        if (rs != null) {
            while (rs.next()) {
                this.sendCrdTotalCnt++;
                Map m = new HashMap();
                String account = rs.getString("account").trim();
                String cardname = rs.getString("cardname").trim();
                String bdgagency = rs.getString("bdgagency").trim();
                String GATHERINGBANKACCTNAME = rs.getString("GATHERINGBANKACCTNAME").trim();
                String GATHERINGBANKNAME = rs.getString("GATHERINGBANKNAME").trim();
                String GATHERINGBANKACCTCODE = rs.getString("GATHERINGBANKACCTCODE").trim();
                String IDNUMBER = rs.getString("IDNUMBER").trim();
                String DIGEST = rs.getString("DIGEST").trim();
                String BANK = rs.getString("BANK").trim();
                String CREATEDATE = rs.getString("CREATEDATE").trim();
                String Startdate = rs.getString("Startdate").trim();
                String enddate = rs.getString("enddate").trim();
                String action = rs.getString("action").trim();


                m.put("ACCOUNT", account);
                m.put("CARDNAME", cardname);
                m.put("Bdgagency", bdgagency);
                m.put("GATHERINGBANKACCTNAME ", GATHERINGBANKACCTNAME);
                m.put("GATHERINGBANKNAME ", GATHERINGBANKNAME);
                m.put("GATHERINGBANKACCTCODE ", GATHERINGBANKACCTCODE);
                m.put("IDNUMBER", IDNUMBER);
                m.put("DIGEST", DIGEST);
                m.put("BANK", BANK);
                m.put("CREATEDATE", CREATEDATE);
                m.put("Startdate", Startdate);
                m.put("enddate", enddate);
                m.put("action", action);
                cardList.add(m);
            }
        }
        return cardList;
    }

    // 发送卡信息到财政局
    private List sendCrdInfos(List cardList){
        List rtnList = null;
        if (cardList != null && cardList.size() > 0) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = df.format(new Date());
            String year = strDate.substring(0, 4);
            BankService service = FaspServiceAdapter.getBankService();
            rtnList = service.writeOfficeCard("BANK.CCB", "8015", year, "405", cardList);
            //rtnList = SendConsumeInfoTest.sendConsumeInfoRtn();
        }
        return rtnList;
    }

    // 更新为已发送
    private int updateSentFlag(String status){
        int rtnCnt = 0;
        String updateSql = "update ls_cardbaseinfo set sentflag = '1' where status = '"+status+"' and sentflag = '0'";
        rtnCnt = dc.executeUpdate(updateSql);
        return rtnCnt;
    }
     private int updateSentFlag(String sameid,String sameaccount){
        int rtnCnt = 0;
        String updateSql = "update ls_cardbaseinfo set sentflag = '1' where account = '"+sameaccount+
                           "' and idnumber = '"+sameid+"'and sentflag = '0'";
        rtnCnt = dc.executeUpdate(updateSql);
        return rtnCnt;
    }
}
