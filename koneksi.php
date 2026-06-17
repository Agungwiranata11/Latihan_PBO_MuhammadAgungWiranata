<?php
class Database {
    private $host = "localhost";
    private $username = "root";
    private $password = "";
    private $db_name = "db_latihan_pbo_trpl1b_muhammadagungwiranata.sql"; 
    public $conn;

    public function getConnection() {
        $this->conn = null;
        try {
            $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db_name);
            if ($this->conn->connect_error) {
                die("Koneksi gagal: " . $this->conn->connect_error);
            }
        } catch (Exception $e) {
            echo "Error Koneksi: " . $e->getMessage();
        }
        return $this->conn;
    }
}
?>