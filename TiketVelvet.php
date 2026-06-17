<?php
require_once 'Tiket.php';

class TiketVelvet extends Tiket {
    private $bantalSelimutPack;
    private $layananButler;

    public function __construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $harga_dasar_tiket, $bantalSelimutPack, $layananButler) {
        parent::__construct($id_tiket, $nama_film, $jadwal_tayang, $jumlah_kursi, $harga_dasar_tiket);
        $this->bantalSelimutPack = $bantalSelimutPack;
        $this->layananButler = $layananButler;
    }

    public function hitungTotalHarga() {
        return ($this->jumlah_kursi * $this->harga_dasar_tiket) * 1.50;
    }

    public function tampilkanInfoFasilitas() {
        return "Fasilitas: " . $this->bantalSelimutPack . " | Layanan: " . $this->layananButler;
    }
}
?>