function body_resize() {
    divfd_ActionTable.style.height = document.body.clientHeight - 180 + "px";
    ActionTable.fdwidth = "1200px";
    // divfd_ActionTable.style.height = "100%";
     //ActionTable.fdwidth = "100%";
}

function cbRetrieve_Click() {
    var whereStr = " ";
    document.all["ActionTable"].whereStr = whereStr;
    document.all["ActionTable"].RecordCount = "0";
    document.all["ActionTable"].AbsolutePage = "1";

    Table_Refresh("ActionTable");
}

function expTxt_click() {

    document.getElementById("rptForm").target = "_blank";
    document.getElementById("rptForm").action = "justiceReport.jsp";
    document.getElementById("rptForm").submit();
}