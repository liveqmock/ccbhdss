function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";

}

function cbRetrieve_Click() {
 var whereStr = "";
    var acctno = "";
    var bankNo = "";
    var regdate = "";
    var OccBankNo = "";
    acctno =  trimStr(document.getElementById("acctno").value) ;
    bankNo = trimStr(document.getElementById("bankNo").value);
    regdate = trimStr(document.getElementById("date").value);
    OccBankNo =  trimStr(document.getElementById("OccBankNo").value) ;
    if(acctno == "" && bankNo == "" && regdate == "" && OccBankNo == ""){
            alert("请输入查询条件!");
            return;
    }
    //授权内用户验证
    var sfeature = "dialogwidth:300px; dialogheight:220px;center:yes;help:no;resizable:yes;scroll:no;status:yes";
    var rval = dialog("../historyDataQry/validate.jsp", '', sfeature);

    if (rval == undefined) {
        return false;
    }
    document.getElementById("hidGrantUsr").value=rval;
    if (acctno!= "") {
        whereStr += " and  AccNo ='" + acctno+ "'";
    }
    if (bankNo != "") {
         whereStr += " and OpnBankNo ='" + bankNo + "'";
    }
    if (regdate!= "") {
         whereStr += " and RegDate = '" + dateChange(regdate)+ "'";
    }
    if (OccBankNo != "") {
        whereStr += " and OccBankNo = '" + OccBankNo + "'";
    }
     if (whereStr != document.all["ActionTable"].whereStr) {
        document.all["ActionTable"].whereStr = whereStr;
        document.all["ActionTable"].RecordCount = "0";
        document.all["ActionTable"].AbsolutePage = "1";
        //添加日志记录 taskAction
        retxml = createExecuteform(queryForm, "insert", "hsqr01", "taskinfoInsert");
        Table_Refresh("ActionTable");
    }

}
//日期字符串格式转换 yyyy-mm-dd -> yyyymmdd
function dateChange(dt) {
    var dateStr = dt.substring(0,4) + dt.substring(5,7) + dt.substring(8,10);
    return dateStr;
}