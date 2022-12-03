<?php
include '../connection.php';

$id_transaksi = $_POST['id_transaksi'];
$trans_total = $_POST['total'];
$trans_kembali = $_POST['kembali'];



$sqlQuery = "INSERT INTO transaksi_kembali SET id_transaksi = '$id_transaksi', total = '$trans_total', kembali = '$trans_kembali'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
