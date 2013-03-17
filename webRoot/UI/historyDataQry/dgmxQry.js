function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";

//    initDBGrid("ActionTable");
//    body_init(queryForm, "cbRetrieve_Click");
}

function cbRetrieve_Click() {
    var whereStr = "";
    //帐号判断
    if (trimStr(document.getElementById("acctno").value) == "") {
        alert("帐号不能为空！");
        return false;
    }
    //授权内用户验证
    var sfeature = "dialogwidth:300px; dialogheight:220px;center:yes;help:no;resizable:yes;scroll:no;status:yes";
    var rval = dialog("validate.jsp", '', sfeature);

    if (rval == undefined) {
        return false;
    }
    document.getElementById("hidGrantUsr").value=rval;
    //普通用户权限下查询数据判断提示
    if (document.getElementById("hidIsSuper").value != 1) {
       var rntxml = createExecuteform(queryForm, "insert", "ext001", "isExits_dghq");
        if (analyzeReturnXML(rntxml) != "false") {
            var dom = createDomDocument();
            dom.loadXML(rntxml);
            var fieldList = dom.getElementsByTagName("record")[0];
            for (var i = 0; i < fieldList.childNodes.length; i++) {
                if (fieldList.childNodes[i].nodeType == 1) {
                    oneRecord = fieldList.childNodes[i];
                    attrName = oneRecord.getAttribute("name");
                    // 记录数
                    if (attrName == "isExitsStr") {
                        msg = decode(oneRecord.getAttribute("value"));
                        if (msg != "true") {
                            alert(msg);
                            return false;
                        }
                    }
                }
            }
        }
    }
    if (trimStr(document.getElementById("acctno").value) != "") {
         whereStr += " and ( satn.sa_acct_no = fnc_get_dgnbzh('" + trimStr(document.getElementById("acctno").value) + "'))";
    }
    //交易日期
    var dt1 = trimStr(document.getElementById("busidate1").value);
    var dt2 = trimStr(document.getElementById("busidate2").value);

    if (dt1 != "") {
        whereStr += " and (satn.sa_tx_dt >= '" + dateChange(dt1) + "')";
    }
    if (dt2 != "") {
        whereStr += " and (satn.sa_tx_dt <= '" + dateChange(dt2) + "')";
    }
    //todo 登陆者权限判断（超级用户，普通用户）
    document.all["ActionTable"].whereStr = whereStr + " order by satn.sa_tx_dt , satn.sa_ddp_acct_no_det_n ";
    document.all["ActionTable"].RecordCount = "0";
    document.all["ActionTable"].AbsolutePage = "1";
    if (whereStr != document.all["ActionTable"].whereStr) {
        //添加日志记录 taskAction
        retxml = createExecuteform(queryForm, "insert", "hsqr01", "taskinfoInsert");
    }
    Table_Refresh("ActionTable");

}
//日期字符串格式转换 yyyy-mm-dd -> yyyymmdd
function dateChange(dt) {
    var dateStr = dt.substring(0,4) + dt.substring(5,7) + dt.substring(8,10);
    return dateStr;
}