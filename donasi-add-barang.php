<?php
session_start();
if (!isset($_SESSION["login"])) {
    header("Location: ../index.php");
    exit;
}

require '../function.php';
include '../templates/header.php';
include '../templates/sidebar.php';

// Ambil data donatur untuk dropdown
$donatur_query = pg_query($koneksi, "SELECT id, nama FROM donatur ORDER BY nama ASC");

if (isset($_POST['submit'])) {
    $id_donatur = $_POST['id_donatur'];
    $keterangan = $_POST['keterangan'];
    $kuantitas = $_POST['kuantitas'];
    $tanggal = $_POST['tanggal'];

    // Insert ke tabel donasi
    $query_donasi = pg_query($koneksi, "
        INSERT INTO donasi (id_donatur, tanggal) 
        VALUES ('$id_donatur', '$tanggal') 
        RETURNING id
    ");
    
    $result = pg_fetch_assoc($query_donasi);
    $id_donasi = $result['id'];

    // Insert ke tabel donasi_barang
    $query_barang = pg_query($koneksi, "
        INSERT INTO donasi_barang (id_donasi, keterangan, kuantitas) 
        VALUES ('$id_donasi', '$keterangan', '$kuantitas')
    ");

    if ($query_barang) {
        echo "<script>
            alert('Donasi barang berhasil ditambahkan!');
            window.location.href = 'donasi-list.php?jenis=barang';
        </script>";
    } else {
        echo "<script>
            alert('Gagal menambahkan donasi barang!');
        </script>";
    }
}
?>

<div class="container mt-4">
    <h3>Tambah Donasi Barang</h3>

    <div class="card">
        <div class="card-body">
            <form method="POST">
                <div class="mb-3">
                    <label for="id_donatur" class="form-label">Donatur</label>
                    <select name="id_donatur" id="id_donatur" class="form-select" required>
                        <option value="">-- Pilih Donatur --</option>
                        <?php while ($donatur = pg_fetch_assoc($donatur_query)): ?>
                            <option value="<?= $donatur['id']; ?>"><?= $donatur['nama']; ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="keterangan" class="form-label">Keterangan Barang</label>
                    <input type="text" name="keterangan" id="keterangan" class="form-control" required placeholder="Contoh: Beras, Pakaian, Alat Tulis">
                </div>

                <div class="mb-3">
                    <label for="kuantitas" class="form-label">Kuantitas</label>
                    <input type="number" name="kuantitas" id="kuantitas" class="form-control" required min="1">
                </div>

                <div class="mb-3">
                    <label for="tanggal" class="form-label">Tanggal</label>
                    <input type="date" name="tanggal" id="tanggal" class="form-control" required value="<?= date('Y-m-d'); ?>">
                </div>

                <button type="submit" name="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Simpan
                </button>
                <a href="donasi-list.php?jenis=barang" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Kembali
                </a>
            </form>
        </div>
    </div>
</div>

<?php include '../templates/footer.php'; ?>