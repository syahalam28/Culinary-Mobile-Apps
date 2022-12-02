<?php
include '../connection.php';

$currentOnLineUserID = $_POST["user_id"];

$sqlQuery = "SELECT id_transaksi, id_summary, trans_total,trans_date,jumlah_orang,kode_unik, saldo FROM transaksi CROSS JOIN rekening ON transaksi.user_id = rekening.user_id  WHERE transaksi.user_id = '$currentOnLineUserID' order by id_transaksi DESC limit 1;";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) //allow user to login 
{
    $cartRecord = array();
    while ($rowFound = $resultOfQuery->fetch_assoc()) {
        $cartRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "success" => true,
            "currentUserCartData" => $cartRecord,



        )
    );
} else {
    echo json_encode(array("success" => false));
}
