package com.ccb.dao;
import java.util.*;
import pub.platform.db.*;
import pub.platform.utils.*;
import pub.platform.db.AbstractBasicBean;
public class DCCTASKINFO extends AbstractBasicBean implements Cloneable {
     public static List find(String sSqlWhere) {           return new DCCTASKINFO().findByWhere(sSqlWhere);      }       public static List findAndLock(String sSqlWhere) {           return new DCCTASKINFO().findAndLockByWhere(sSqlWhere);      }       public static DCCTASKINFO findFirst(String sSqlWhere) {           return (DCCTASKINFO)new DCCTASKINFO().findFirstByWhere(sSqlWhere);      }       public static DCCTASKINFO findFirstAndLock(String sSqlWhere) {           return (DCCTASKINFO)new DCCTASKINFO().findFirstAndLockByWhere(sSqlWhere);      }            public static RecordSet findRecordSet(String sSqlWhere) {           return new DCCTASKINFO().findRecordSetByWhere(sSqlWhere);      }       public static List find(String sSqlWhere,boolean isAutoRelease) {           DCCTASKINFO bean = new DCCTASKINFO();           bean.setAutoRelease(isAutoRelease);           return bean.findByWhere(sSqlWhere);      }       public static List findAndLock(String sSqlWhere,boolean isAutoRelease) {           DCCTASKINFO bean = new DCCTASKINFO();           bean.setAutoRelease(isAutoRelease);           return bean.findAndLockByWhere(sSqlWhere);      }       public static DCCTASKINFO findFirst(String sSqlWhere,boolean isAutoRelease) {           DCCTASKINFO bean = new DCCTASKINFO();           bean.setAutoRelease(isAutoRelease);           return (DCCTASKINFO)bean.findFirstByWhere(sSqlWhere);      }       public static DCCTASKINFO findFirstAndLock(String sSqlWhere,boolean isAutoRelease) {           DCCTASKINFO bean = new DCCTASKINFO();           bean.setAutoRelease(isAutoRelease);           return (DCCTASKINFO)bean.findFirstAndLockByWhere(sSqlWhere);      }       public static RecordSet findRecordSet(String sSqlWhere,boolean isAutoRelease) {           DCCTASKINFO bean = new DCCTASKINFO();           bean.setAutoRelease(isAutoRelease);           return bean.findRecordSetByWhere(sSqlWhere);      }      public static List findByRow(String sSqlWhere,int row) {           return new DCCTASKINFO().findByWhereByRow(sSqlWhere,row);      } String taskid;
String tablename;
String acctno;
String tasktype;
String tasktime;
String operid;
String remarks;
String cardno;
String custno;
String custname;
String txdtstart;
String txdtend;
String origbranch;
String openaccdate;
String fsorigbranch;
String clientaddr;
String grantuser;
public static final String TABLENAME ="dcc_taskinfo";
private String operate_mode = "add";
public ChangeFileds cf = new ChangeFileds();
public String getTableName() {return TABLENAME;}
public void addObject(List list,RecordSet rs) {
DCCTASKINFO abb = new DCCTASKINFO();
abb.taskid=rs.getString("taskid");abb.setKeyValue("TASKID",""+abb.getTaskid());
abb.tablename=rs.getString("tablename");abb.setKeyValue("TABLENAME",""+abb.getTablename());
abb.acctno=rs.getString("acctno");abb.setKeyValue("ACCTNO",""+abb.getAcctno());
abb.tasktype=rs.getString("tasktype");abb.setKeyValue("TASKTYPE",""+abb.getTasktype());
abb.tasktime=rs.getTimeString("tasktime");abb.setKeyValue("TASKTIME",""+abb.getTasktime());
abb.operid=rs.getString("operid");abb.setKeyValue("OPERID",""+abb.getOperid());
abb.remarks=rs.getString("remarks");abb.setKeyValue("REMARKS",""+abb.getRemarks());
abb.cardno=rs.getString("cardno");abb.setKeyValue("CARDNO",""+abb.getCardno());
abb.custno=rs.getString("custno");abb.setKeyValue("CUSTNO",""+abb.getCustno());
abb.custname=rs.getString("custname");abb.setKeyValue("CUSTNAME",""+abb.getCustname());
abb.txdtstart=rs.getString("txdtstart");abb.setKeyValue("TXDTSTART",""+abb.getTxdtstart());
abb.txdtend=rs.getString("txdtend");abb.setKeyValue("TXDTEND",""+abb.getTxdtend());
abb.origbranch=rs.getString("origbranch");abb.setKeyValue("ORIGBRANCH",""+abb.getOrigbranch());
abb.openaccdate=rs.getString("openaccdate");abb.setKeyValue("OPENACCDATE",""+abb.getOpenaccdate());
abb.fsorigbranch=rs.getString("fsorigbranch");abb.setKeyValue("FSORIGBRANCH",""+abb.getFsorigbranch());
abb.clientaddr=rs.getString("clientaddr");abb.setKeyValue("CLIENTADDR",""+abb.getClientaddr());
abb.grantuser=rs.getString("grantuser");abb.setKeyValue("GRANTUSER",""+abb.getGrantuser());
list.add(abb);
abb.operate_mode = "edit";
}public String getTaskid() { if ( this.taskid == null ) return ""; return this.taskid;}
public String getTablename() { if ( this.tablename == null ) return ""; return this.tablename;}
public String getAcctno() { if ( this.acctno == null ) return ""; return this.acctno;}
public String getTasktype() { if ( this.tasktype == null ) return ""; return this.tasktype;}
public String getTasktime() {  if ( this.tasktime == null ) { return ""; } else { return this.tasktime.trim().split(" ")[0];} }public String getTasktimeTime() {  if ( this.tasktime == null ) return ""; return this.tasktime.split("\\.")[0];}
public String getOperid() { if ( this.operid == null ) return ""; return this.operid;}
public String getRemarks() { if ( this.remarks == null ) return ""; return this.remarks;}
public String getCardno() { if ( this.cardno == null ) return ""; return this.cardno;}
public String getCustno() { if ( this.custno == null ) return ""; return this.custno;}
public String getCustname() { if ( this.custname == null ) return ""; return this.custname;}
public String getTxdtstart() { if ( this.txdtstart == null ) return ""; return this.txdtstart;}
public String getTxdtend() { if ( this.txdtend == null ) return ""; return this.txdtend;}
public String getOrigbranch() { if ( this.origbranch == null ) return ""; return this.origbranch;}
public String getOpenaccdate() { if ( this.openaccdate == null ) return ""; return this.openaccdate;}
public String getFsorigbranch() { if ( this.fsorigbranch == null ) return ""; return this.fsorigbranch;}
public String getClientaddr() { if ( this.clientaddr == null ) return ""; return this.clientaddr;}
public String getGrantuser() { if ( this.grantuser == null ) return ""; return this.grantuser;}
public void setTaskid(String taskid) { sqlMaker.setField("taskid",taskid,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getTaskid().equals(taskid)) cf.add("taskid",this.taskid,taskid); } this.taskid=taskid;}
public void setTablename(String tablename) { sqlMaker.setField("tablename",tablename,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getTablename().equals(tablename)) cf.add("tablename",this.tablename,tablename); } this.tablename=tablename;}
public void setAcctno(String acctno) { sqlMaker.setField("acctno",acctno,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getAcctno().equals(acctno)) cf.add("acctno",this.acctno,acctno); } this.acctno=acctno;}
public void setTasktype(String tasktype) { sqlMaker.setField("tasktype",tasktype,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getTasktype().equals(tasktype)) cf.add("tasktype",this.tasktype,tasktype); } this.tasktype=tasktype;}
public void setTasktime(String tasktime) { sqlMaker.setField("tasktime",tasktime,Field.DATE); if (this.operate_mode.equals("edit")) { if (!this.getTasktime().equals(tasktime)) cf.add("tasktime",this.tasktime,tasktime); } this.tasktime=tasktime;}
public void setOperid(String operid) { sqlMaker.setField("operid",operid,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getOperid().equals(operid)) cf.add("operid",this.operid,operid); } this.operid=operid;}
public void setRemarks(String remarks) { sqlMaker.setField("remarks",remarks,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getRemarks().equals(remarks)) cf.add("remarks",this.remarks,remarks); } this.remarks=remarks;}
public void setCardno(String cardno) { sqlMaker.setField("cardno",cardno,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getCardno().equals(cardno)) cf.add("cardno",this.cardno,cardno); } this.cardno=cardno;}
public void setCustno(String custno) { sqlMaker.setField("custno",custno,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getCustno().equals(custno)) cf.add("custno",this.custno,custno); } this.custno=custno;}
public void setCustname(String custname) { sqlMaker.setField("custname",custname,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getCustname().equals(custname)) cf.add("custname",this.custname,custname); } this.custname=custname;}
public void setTxdtstart(String txdtstart) { sqlMaker.setField("txdtstart",txdtstart,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getTxdtstart().equals(txdtstart)) cf.add("txdtstart",this.txdtstart,txdtstart); } this.txdtstart=txdtstart;}
public void setTxdtend(String txdtend) { sqlMaker.setField("txdtend",txdtend,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getTxdtend().equals(txdtend)) cf.add("txdtend",this.txdtend,txdtend); } this.txdtend=txdtend;}
public void setOrigbranch(String origbranch) { sqlMaker.setField("origbranch",origbranch,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getOrigbranch().equals(origbranch)) cf.add("origbranch",this.origbranch,origbranch); } this.origbranch=origbranch;}
public void setOpenaccdate(String openaccdate) { sqlMaker.setField("openaccdate",openaccdate,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getOpenaccdate().equals(openaccdate)) cf.add("openaccdate",this.openaccdate,openaccdate); } this.openaccdate=openaccdate;}
public void setFsorigbranch(String fsorigbranch) { sqlMaker.setField("fsorigbranch",fsorigbranch,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getFsorigbranch().equals(fsorigbranch)) cf.add("fsorigbranch",this.fsorigbranch,fsorigbranch); } this.fsorigbranch=fsorigbranch;}
public void setClientaddr(String clientaddr) { sqlMaker.setField("clientaddr",clientaddr,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getClientaddr().equals(clientaddr)) cf.add("clientaddr",this.clientaddr,clientaddr); } this.clientaddr=clientaddr;}
public void setGrantuser(String grantuser) { sqlMaker.setField("grantuser",grantuser,Field.TEXT); if (this.operate_mode.equals("edit")) { if (!this.getGrantuser().equals(grantuser)) cf.add("grantuser",this.grantuser,grantuser); } this.grantuser=grantuser;}
public void init(int i,ActionRequest actionRequest) throws Exception { if ( actionRequest.getFieldValue(i,"taskid") !=null ) {this.setTaskid(actionRequest.getFieldValue(i,"taskid"));}
if ( actionRequest.getFieldValue(i,"tablename") !=null ) {this.setTablename(actionRequest.getFieldValue(i,"tablename"));}
if ( actionRequest.getFieldValue(i,"acctno") !=null ) {this.setAcctno(actionRequest.getFieldValue(i,"acctno"));}
if ( actionRequest.getFieldValue(i,"tasktype") !=null ) {this.setTasktype(actionRequest.getFieldValue(i,"tasktype"));}
if ( actionRequest.getFieldValue(i,"tasktime") !=null ) {this.setTasktime(actionRequest.getFieldValue(i,"tasktime"));}
if ( actionRequest.getFieldValue(i,"operid") !=null ) {this.setOperid(actionRequest.getFieldValue(i,"operid"));}
if ( actionRequest.getFieldValue(i,"remarks") !=null ) {this.setRemarks(actionRequest.getFieldValue(i,"remarks"));}
if ( actionRequest.getFieldValue(i,"cardno") !=null ) {this.setCardno(actionRequest.getFieldValue(i,"cardno"));}
if ( actionRequest.getFieldValue(i,"custno") !=null ) {this.setCustno(actionRequest.getFieldValue(i,"custno"));}
if ( actionRequest.getFieldValue(i,"custname") !=null ) {this.setCustname(actionRequest.getFieldValue(i,"custname"));}
if ( actionRequest.getFieldValue(i,"txdtstart") !=null ) {this.setTxdtstart(actionRequest.getFieldValue(i,"txdtstart"));}
if ( actionRequest.getFieldValue(i,"txdtend") !=null ) {this.setTxdtend(actionRequest.getFieldValue(i,"txdtend"));}
if ( actionRequest.getFieldValue(i,"origbranch") !=null ) {this.setOrigbranch(actionRequest.getFieldValue(i,"origbranch"));}
if ( actionRequest.getFieldValue(i,"openaccdate") !=null ) {this.setOpenaccdate(actionRequest.getFieldValue(i,"openaccdate"));}
if ( actionRequest.getFieldValue(i,"fsorigbranch") !=null ) {this.setFsorigbranch(actionRequest.getFieldValue(i,"fsorigbranch"));}
if ( actionRequest.getFieldValue(i,"clientaddr") !=null ) {this.setClientaddr(actionRequest.getFieldValue(i,"clientaddr"));}
if ( actionRequest.getFieldValue(i,"grantuser") !=null ) {this.setGrantuser(actionRequest.getFieldValue(i,"grantuser"));}
}public void init(ActionRequest actionRequest) throws Exception { this.init(0,actionRequest);}public void initAll(int i,ActionRequest actionRequest) throws Exception { this.init(i,actionRequest);}public void initAll(ActionRequest actionRequest) throws Exception { this.initAll(0,actionRequest);}public Object clone() throws CloneNotSupportedException { DCCTASKINFO obj = (DCCTASKINFO)super.clone();obj.setTaskid(obj.taskid);
obj.setTablename(obj.tablename);
obj.setAcctno(obj.acctno);
obj.setTasktype(obj.tasktype);
obj.setTasktime(obj.tasktime);
obj.setOperid(obj.operid);
obj.setRemarks(obj.remarks);
obj.setCardno(obj.cardno);
obj.setCustno(obj.custno);
obj.setCustname(obj.custname);
obj.setTxdtstart(obj.txdtstart);
obj.setTxdtend(obj.txdtend);
obj.setOrigbranch(obj.origbranch);
obj.setOpenaccdate(obj.openaccdate);
obj.setFsorigbranch(obj.fsorigbranch);
obj.setClientaddr(obj.clientaddr);
obj.setGrantuser(obj.grantuser);
return obj;}}