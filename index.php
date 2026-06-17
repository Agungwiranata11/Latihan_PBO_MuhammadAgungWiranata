<?php
// Memanggil koneksi database dan semua subclass tiket
require_once 'koneksi.php';
require_once 'TiketRegular.php';
require_once 'TiketIMAX.php';
require_once 'TiketVelvet.php';

// Membuat objek database dan mendapatkan koneksi
$database = new Database();
$db = $database->getConnection();

// Query untuk mengambil seluruh data dari tabel_tiket
$query = "SELECT * FROM tabel_tiket";
$result = $db->query($query);

// Array penampung untuk mengelompokkan objek berdasarkan jenis studio
$daftar_studio = [
    'Regular' => [],
    'IMAX' => [],
    'Velvet' => []
];

// Proses Pemetaan (Mapping) data Database ke dalam Objek OOP (Polimorfisme Instansiasi)
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $jenis = $row['jenis_studio'];
        
        if ($jenis == 'Regular') {
            $daftar_studio['Regular'][] = new TiketRegular(
                $row['id_tiket'], $row['nama_film'], $row['jadwal_tayang'], 
                $row['jumlah_kursi'], $row['harga_dasar_tiket'], 
                $row['tipe_audio'], $row['lokasi_baris']
            );
        } elseif ($jenis == 'IMAX') {
            $daftar_studio['IMAX'][] = new TiketIMAX(
                $row['id_tiket'], $row['nama_film'], $row['jadwal_tayang'], 
                $row['jumlah_kursi'], $row['harga_dasar_tiket'], 
                $row['kacamata_3d_id'], $row['efek_gerak_fitur']
            );
        } elseif ($jenis == 'Velvet') {
            $daftar_studio['Velvet'][] = new TiketVelvet(
                $row['id_tiket'], $row['nama_film'], $row['jadwal_tayang'], 
                $row['jumlah_kursi'], $row['harga_dasar_tiket'], 
                $row['bantal_selimut_pack'], $row['layanan_butler']
            );
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Manajemen Tiket Bioskop</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f8f9fa; color: #333; }
        h1 { text-align: center; margin-bottom: 30px; color: #222; text-transform: uppercase; letter-spacing: 1px; }
        h2 { color: #fff; padding: 12px 20px; margin-top: 40px; border-radius: 5px; font-size: 1.2rem; }
        
        /* Pewarnaan Badge/Header per Studio */
        .studio-Regular { background: #1e88e5; box-shadow: 0 2px 5px rgba(30,136,229,0.3); }
        .studio-IMAX { background: #f4511e; box-shadow: 0 2px 5px rgba(244,81,30,0.3); }
        .studio-Velvet { background: #8e24aa; box-shadow: 0 2px 5px rgba(142,36,170,0.3); }
        
        table { width: 100%; border-collapse: collapse; margin-top: 15px; background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.06); border-radius: 5px; overflow: hidden; }
        th, td { padding: 14px 18px; text-align: left; border-bottom: 1px solid #e0e0e0; }
        th { background-color: #f1f3f5; font-weight: bold; color: #495057; }
        tr:last-child td { border-bottom: none; }
        tr:hover { background-color: #f8f9fa; }
        .text-bold { font-weight: bold; }
        .text-italic { font-style: italic; color: #666; }
        .price { color: #2e7d32; font-weight: bold; }
    </style>
</head>
<body>

    <h1>Sistem Manajemen Tiket & Fasilitas Studio Bioskop</h1>

    <?php foreach ($daftar_studio as $jenisStudio => $listTiket): ?>
        <h2 class="studio-<?php echo $jenisStudio; ?>">Kategori: Studio <?php echo $jenisStudio; ?></h2>
        <table>
            <thead>
                <tr>
                    <th>ID Tiket</th>
                    <th>Nama Film</th>
                    <th>Jadwal Tayang</th>
                    <th>Jumlah Kursi</th>
                    <th>Harga Dasar</th>
                    <th>Spesifikasi Fasilitas Unik (Polimorfik)</th>
                    <th>Total Harga (Polimorfik)</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($listTiket)): ?>
                    <tr>
                        <td colspan="7" style="text-align: center; color: #999;">Tidak ada data pemesanan untuk studio ini.</td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($listTiket as $tiket): ?>
                        <tr>
                            <td><?php echo $tiket->getIdTiket(); ?></td>
                            <td class="text-bold"><?php echo $tiket->getNamaFilm(); ?></td>
                            <td><?php echo date('d M Y - H:i', strtotime($tiket->getJadwalTayang())); ?> WIB</td>
                            <td><?php echo $tiket->getJumlahKursi(); ?> Kursi</td>
                            <td>Rp <?php echo number_format($tiket->getHargaDasar(), 0, ',', '.'); ?></td>
                            
                            <td class="text-italic"><?php echo $tiket->tampilkanInfoFasilitas(); ?></td>
                            
                            <td class="price">Rp <?php echo number_format($tiket->hitungTotalHarga(), 0, ',', '.'); ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    <?php endforeach; ?>

</body>
</html>