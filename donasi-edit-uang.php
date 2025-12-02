<?php
session_start();
if (!isset($_SESSION["login"])) {
    header("Location: ../index.php");
    exit;
}

require '../function.php';
include '../templates/header.php';
include '../templates/sidebar.php';

$id = $_GET['id'];

// Ambil data donasi uang
$query = pg_query($koneksi, "
    SELECT 
        d.id,
        d.id_donatur,
        d.tanggal,
        du.nominal
    FROM donasi d
    JOIN donasi_uang du ON du.id_donasi = d.id
    WHERE d.id = '$id'
");

$data = pg_fetch_assoc($query);

// Ambil data donatur untuk dropdown
$donatur_query = pg_query($koneksi, "SELECT id, nama FROM donatur ORDER BY nama ASC");

if (isset($_POST['submit'])) {
    $id_donatur = $_POST['id_donatur'];
    $nominal = $_POST['nominal'];
    $tanggal = $_POST['tanggal'];

    // Update tabel donasi
    $query_donasi = pg_query($koneksi, "
        UPDATE donasi 
        SET id_donatur = '$id_donatur', tanggal = '$tanggal' 
        WHERE id = '$id'
    ");

    // Update tabel donasi_uang
    $query_uang = pg_query($koneksi, "
        UPDATE donasi_uang 
        SET nominal = '$nominal' 
        WHERE id_donasi = '$id'
    ");

    if ($query_uang) {
        echo "<script>
            alert('Donasi uang berhasil diupdate!');
            window.location.href = 'donasi-list.php?jenis=uang';
        </script>";
    } else {
        echo "<script>
            alert('Gagal mengupdate donasi uang!');
        </script>";
    }
}
?>

<div class="container mt-4">
    <h3>Edit Donasi Uang</h3>

    <div class="card">
        <div class="card-body">
            <form method="POST">
                <div class="mb-3">
                    <label for="id_donatur" class="form-label">Donatur</label>
                    <select name="id_donatur" id="id_donatur" class="form-select" required>
                        <option value="">-- Pilih Donatur --</option>
                        <?php while ($donatur = pg_fetch_assoc($donatur_query)): ?>
                            <option value="<?= $donatur['id']; ?>" <?= $donatur['id'] == $data['id_donatur'] ? 'selected' : ''; ?>>
                                <?= $donatur['nama']; ?>
                            </option>
                        <?php endwhile; ?>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="nominal" class="form-label">Nominal (Rp)</label>
                    <input type="number" name="nominal" id="nominal" class="form-control" required min="0" value="<?= $data['nominal']; ?>">
                </div>

                <div class="mb-3">
                    <label for="tanggal" class="form-label">Tanggal</label>
                    <input type="date" name="tanggal" id="tanggal" class="form-control" required value="<?= $data['tanggal']; ?>">
                </div>

                <button type="submit" name="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Update
                </button>
                <a href="donasi-list.php?jenis=uang" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Kembali
                </a>
            </form>
        </div>
    </div>
</div>

<?php include '../templates/footer.php'; ?>