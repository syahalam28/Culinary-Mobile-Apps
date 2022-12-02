<?php
include '../connection.php';

$id_transaksi = $_POST['id_transaksi'];

$sqlQuery = "DELETE FROM transaksi WHERE id_transaksi = '$id_transaksi'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
