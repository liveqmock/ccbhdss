function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";

}

function cbRetrieve_Click() {
    
    var whereStr = "";
    //帐号判断
    if (trimStr(document.getElementById("acctno").value) == "" && trimStr(document.getElementById("cardNo").value) =="") {
        alert("帐号和卡号不能同时为空！");
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
       var rntxml = createExecuteform(queryForm, "insert", "ext001", "isExits_dshq");
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
    var rntxml = createExecuteform(queryForm, "insert", "ext001", "getGridContents");
        if (analyzeReturnXML(rntxml) != "false") {
            var dom = createDomDocument();
            dom.loadXML(rntxml);
            var fieldList = dom.getElementsByTagName("record")[0];
            for (var i = 0; i < fieldList.childNodes.length; i++) {
                if (fieldList.childNodes[i].nodeType == 1) {
                    oneRecord = fieldList.childNodes[i];
                    attrName = oneRecord.getAttribute("name");
                    // 记录数
                    if (attrName == "dbContentsStr") {
                        var gridCon = decode(oneRecord.getAttribute("value"));
                        var tempArr = gridCon.split("#@$%");
                        var gridCon1 = tempArr[0];
                        var gridPilot = tempArr[1];
                        document.getElementById("dbGridContents").innerHTML = gridCon1;
                        document.getElementById("cellButtons").innerHTML = gridPilot;
                    }
                }
            }
        }
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";
    if (trimStr(document.getElementById("acctno").value) != "") {
         whereStr += " and ( satn.sa_acct_no = fnc_get_grnbzh('" + trimStr(document.getElementById("acctno").value) + "'))";
    }
    //卡号判断
    
    if (trimStr(document.getElementById("cardNo").value) != "") {
        var cardNo = trimStr(document.getElementById("cardNo").value);
        whereStr += " and satn.sa_acct_no =(select t.sa_acct_no from dcc_saacnacn t where t.sa_card_no='" + cardNo + "')";
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
    
    document.all["ActionTable"].whereStr = whereStr + " order by satn.sa_tx_dt, satn.sa_ddp_acct_no_det_n ";
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