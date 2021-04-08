<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    @media print {
        body * {
            visibility: hidden;
        }
        #printDiv, #printDiv * {
            visibility: visible;
        }
        #printDiv {
            transform: scale(1.2);
            position: absolute;
            left: 100px;
            top: 10px;
        }
        @page {size: landscape}
    }

    * {
        font-size: 12px;
    }
    .results tr[visible='false'],
    .no-result{
        display:none;
    }

    .results tr[visible='true']{
        display:table-row;
    }

    .results th{
        line-height: 20px;
        background-color: #EDEDED;
    }


    a:link {
        color: none;
        text-decoration: none;
    }

    /* mouse over link */
    a:hover {
        color: hotpink;
        text-decoration: none;
    }

    .table th {
        background-color: #EDEDED;
    }


</style>


 
<div id="printDiv">
    <div style="margin-left: 10px; margin-top: 50px">
        <h3 style="text-align: left; margin-top: 10px">RASEEL</h3>
        <h5 align="left">JournalTypeDescription</h5>
    </div>
    <h6 style="text-align: right; margin-right: 90px" id="datetime"></h6>
    <h6 style="text-align: right" id='printbtn'><button onclick="printvoucher()">Print</button></h6>
    <div class="col-md-12" style="margin-top:10px;" >


        <table width="100%" border="0" class="table2" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <c:forEach var="aar" items="${th.rows}">
                        <c:set var="postby" value="${aar.username}" />
                        <c:set var="pno" value="${aar.voucherno}" />
                        <c:set var="jtid" value="${aar.JournalTypeDescription}" /> 

                        <c:set var="trdate" value="${ComFun.NormalDateFromat(aar.TransactionDate)}" /> 
                        <c:set var="podate" value="${ComFun.NormalDateFromat(aar.PostingDate)}" /> 

                        <table width="100%" border="1" class="table">
                            <tr>
                                <td width="14%" >Voucher #</td>
                                <td width="35%">${pno}</td>
                                <td width="33%" align="right">Transaction Date</td>
                                <td width="18%">${trdate}</td>
                            </tr>
                            <tr>
                                <td >Transaction Description</td>
                                <td>${aar.TransactionDescription}</td>
                                <td align="right">Posting Date</td>
                                <td>${podate}</td>
                            </tr>

                            <tr>
                                <td >Transaction Reference </td>
                                <td>${aar.TransactionReference}</td>
                                <td align="right">Journal Type</td>
                                <td>${jtid}</td>
                            </tr>

                            <!--                            <tr>
                                                            <td >Cheque no.</td>
                                                            <td>${aar.TransactionReference}</td>
                                                            <td align="right"></td>
                                                            <td></td>
                                                        </tr>-->

                        </table>


                    </c:forEach> 

                </td>
            </tr>
            <tr>
                <td><table width="100%" border="1" class="table">
                        <tr>
                            <th width="18%">Account Code</th>
                            <th width="35%">Line Description</th>
                            <th width="20%">Customer / Supplier</th>                       
                            <th width="13%">Debit</th>
                            <th width="14%">Credit</th>
                        </tr>

                        <c:forEach var="ad" items="${td.rows}">
                            <tr>
                                <td>${ad.AccountDescription}&nbsp;</td>
                                <td>${ad.LineDescription}&nbsp;</td>
                                <td>${ad.customer}&nbsp;${ad.supplier}</td>                                                      
                                <td>${entw.converttobignumbernominus(ad.Debit)}&nbsp;</td>
                                <td>${entw.converttobignumbernominus(ad.Credit)}&nbsp;</td>
                            </tr>

                        </c:forEach>

                        <tr class="blank_row" style="height: 10px">                      
                            <td colspan="4"></td>                      
                        </tr>

                        <c:forEach var="tamount" items="${totalsum.rows}">           

                            <tr>
                                <td style="text-align: center"><b>Total</b></td>
                                <td colspan="2"><b>${entw.convert(tamount.tamount)}</b></td>
                                <td><b>${entw.converttobignumber(tamount.tamount)}</b></td>
                                <td><b>${entw.converttobignumber(tamount.tamount)}</b></td>
                            </tr>


                        </c:forEach>

                    </table></td>
            </tr>
        </table>

        <div class="row" style="height: 80px; margin-top: 25px;" >
            <div class="col-lg-2" style="margin-top: 25px; text-align: right">
                Post By: <u><b style="">${postby}</b></u>
            </div>

            <div class="col-lg-2" style="margin-top: 25px;  text-align: right ">
                Checked By: ----------------------
            </div>

            <div class="col-lg-2" style="margin-top: 25px; text-align: right ">
                Approved By: ---------------------
            </div>

            <div class="col-lg-2" style="margin-top: 25px;  text-align: right">
                Received By: ---------------------
            </div>

        </div>




    </div>
</div>
<script>
    function printvoucher() {
        document.getElementById("printbtn").style.display = "none";
        var today = new Date();

        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = "Print : " + date + ' / ' + time;
        document.getElementById("datetime").innerHTML = dateTime;


        window.print();
    }
</script>