function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "1300px";
}

function cbRetrieve_Click() {
    var whereStr = "";
    var acctno = "";
    var custNo = "";
    var custName = "";
    acctno =  trimStr(document.getElementById("acctno").value) ;
    custNo = trimStr(document.getElementById("custNo").value);
    custName =  trimStr(document.getElementById("custName").value) ;
    if(acctno == ""  && custNo == "" && custName == ""){
            alert("�������ѯ����!");
            return;
    }
    //��Ȩ���û���֤
    var sfeature = "dialogwidth:300px; dialogheight:220px;center:yes;help:no;resizable:yes;scroll:no;status:yes";
    var rval = dialog("validate.jsp", '', sfeature);

    if (rval == undefined) {
        return false;
    }
    document.getElementById("hidGrantUsr").value=rval;
    //��ͨ�û�Ȩ���²�ѯ�����ж���ʾ
    if (document.getElementById("hidIsSuper").value != 1) {
        if (acctno != "") {
            var rntxml = createExecuteform(queryForm, "insert", "ext001", "isExits_dsdq");
            if (analyzeReturnXML(rntxml) != "false") {
                var dom = createDomDocument();
                dom.loadXML(rntxml);
                var fieldList = dom.getElementsByTagName("record")[0];
                for (var i = 0; i < fieldList.childNodes.length; i++) {
                    if (fieldList.childNodes[i].nodeType == 1) {
                        oneRecord = fieldList.childNodes[i];
                        attrName = oneRecord.getAttribute("name");
                        // ��¼��
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
    //�ʺ� acctno
    if (acctno!= "") {
        whereStr += " and  tcan.td_td_acct_no=fnc_get_grnbzh('" + acctno+ "')";
    }
    //���֤�� custNo
    if (custNo!= "") {
         whereStr += " and tcan.td_cust_no like '%" + custNo+ "%'";
    }
    //���� custName
    if (custName != "") {
        whereStr += " and tcan.td_cust_name like '%" + custName + "%'";
    }
    //��������
//    if (trimStr(document.getElementById("busidate1").value) != "") {
//        whereStr += " and (t.sa_tx_dt >= '" + document.getElementById("busidate1").value + "')";
//    }
//    if (trimStr(document.getElementById("busidate2").value) != "") {
//        whereStr += " and (t.sa_tx_dt <= '" + document.getElementById("busidate2").value + "')";
//    }
     if (whereStr != document.all["ActionTable"].whereStr) {
        document.all["ActionTable"].whereStr = whereStr;
        document.all["ActionTable"].RecordCount = "0";
        document.all["ActionTable"].AbsolutePage = "1";
        //�����־��¼ taskAction
        retxml = createExecuteform(queryForm, "insert", "hsqr01", "taskinfoInsert");
        Table_Refresh("ActionTable");
    }
}