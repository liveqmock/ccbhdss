function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 235 + "px";
    ActionTable.fdwidth = "3000px";

}

function cbRetrieve_Click() {
 var whereStr = "";
    var operid = "";
    var date1 = "";
    var date2 = "";
    operid =  trimStr(document.getElementById("operid").value) ;
    date1 = trimStr(document.getElementById("busidate1").value);
       date2 = trimStr(document.getElementById("busidate2").value);
//    if(operid == "" && date1 == "" && date2=="" ){
//            alert("请输入查询条件!");
//            return;
//    }

    if (operid!= "") {
        whereStr += " and  operid  like '%" + operid+ "%'";
    }
    if (date1 != "") {
         whereStr += " and tasktime >= to_date('"+date1+"','YYYY-MM-DD HH24:MI:SS')";
    }
     if (date2 != "") {
         whereStr += " and tasktime <= to_date('"+date2+"','YYYY-MM-DD HH24:MI:SS')";
    }
     if (whereStr != document.all["ActionTable"].whereStr) {
        document.all["ActionTable"].whereStr = whereStr;
        document.all["ActionTable"].RecordCount = "0";
        document.all["ActionTable"].AbsolutePage = "1";

        Table_Refresh("ActionTable");
    }

}
//日期字符串格式转换 yyyy-mm-dd -> yyyymmdd
function dateChange(dt) {
    var dateStr = dt.substring(0,4) + dt.substring(5,7) + dt.substring(8,10);
    return dateStr;
}