<?php
    $koneksi = mysqli_connect("localhost","root","","alat_kantor");

    function query($query){
        global $koneksi;

        $hasil = mysqli_query($koneksi, $query);
        $rows = [];

        while($row = mysqli_fetch_assoc($hasil)){
            $rows[] = $row;
        }

        return $rows;
    }

    $result = query("SELECT pb.NamaPembeli, ats.NamaBarang, tr.Jumlah, tr.Harga
    FROM transaksi AS tr
    JOIN pembeli AS pb ON tr.id_pembeli = pb.id
    JOIN alat_tulis AS ats ON tr.id_barang = ats.id");
    
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=`device-width`, initial-scale=1.0">
    <style>
        * {
            font-family: sans-serif;
            text-align: center;
        }
        body {
            background: url("bg.jpg");
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .main {
            background-color: rgba(0, 0, 0, .3);
            border-radius: 20px;
            padding: 30px;
        }
        th {background-color: lightblue;}
        td{background-color: white;}
        h2 {margin-bottom: 9%;color: white;}
    </style>
    <title>Kelompok 8</title>
</head>
<body>
    <div class="main">
        <h2>Daftar Alat Tulis Kantor</h2>

        <table border="1" cellpadding="8" cellspacing="0" align="center">
            <tr>
                <th>No</th>
                <th>Nama Pembeli</th>
                <th>Nama Barang</th>
                <th>Jumlah</th>
                <th>Harga</th>
            </tr>
            <?php 
                $i = 1;
                foreach($result as $data) :
            ?>
                <tr>
                    <td><?= $i ?></td>
                    <td><?= $data["NamaPembeli"] ?></td>
                    <td><?= $data["NamaBarang"] ?></td>
                    <td><?= $data["Jumlah"] ?></td>
                    <td>Rp <?= $data["Harga"] ?></td>
                </tr>
            <?php
                $i++;
                endforeach;
            ?>
        </table>
    </div>
</body>
</html>