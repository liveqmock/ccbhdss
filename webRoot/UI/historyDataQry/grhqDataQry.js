function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";
}

function cbRetrieve_Click() {
    var whereStr = "";
    var acctno = "";
    var cardNo = "";
    var custNo = "";
    var custName = "";
    acctno =  trimStr(document.getElementById("acctno").value) ;
    cardNo = trimStr(document.getElementById("cardNo").value);
    custNo = trimStr(document.getElementById("custNo").value);
    custName =  trimStr(document.getElementById("custName").value) ;
    if(acctno == "" && cardNo == "" && custNo == "" && custName == ""){
            alert("请输入查询条件!");
            return;
    }
     //授权内用户验证
    var sfeature = "dialogwidth:300px; dialogheight:220px;center:yes;help:no;resizable:yes;scroll:no;status:yes";

    var rval = dialog("validate.jsp",'',sfeature);
    if (rval == undefined) {
        return false;
    }
    document.getElementById("hidGrantUsr").value=rval;
    //普通用户权限下查询数据判断提示
    if (document.getElementById("hidIsSuper").value != 1) {
        if (acctno != "" || cardNo != "") {
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
    }
    //帐号 acctno
    if (acctno!= "") {
        whereStr += " and  sacn.sa_acct_no=fnc_get_grnbzh('" + acctno+ "')";
    }
    // 卡号 cardNo
    if (cardNo != "") {
         whereStr += " and sacn.sa_card_no='" + cardNo + "'";
    }
    //身份证号 custNo
    if (custNo!= "") {
         whereStr += " and sacn.sa_cust_no like '%" + custNo+ "%'";
    }
    //姓名 custName
    if (custName != "") {
        whereStr += " and sacn.sa_cust_name like '%" + custName + "%'";
    }

     if (whereStr != document.all["ActionTable"].whereStr) {
        document.all["ActionTable"].whereStr = "  "+whereStr;
        document.all["ActionTable"].RecordCount = "0";
        document.all["ActionTable"].AbsolutePage = "1";
        //添加日志记录 taskAction
        retxml = createExecuteform(queryForm, "insert", "hsqr01", "taskinfoInsert");
        Table_Refresh("ActionTable");
    }
}