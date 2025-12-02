<?php
session_start();
if (!isset($_SESSION["login"])) {
    header("Location: ../index.php");
    exit;
}

require '../function.php';
include '../templates/header.php';
include '../templates/sidebar.php';

// Ambil jenis donasi dari GET, default "uang"
$jenis = isset($_GET['jenis']) ? $_GET['jenis'] : 'uang';
?>

<div class="container mt-4">

    <h3>Daftar Donasi</h3>

    <!-- Tab untuk memilih jenis donasi dengan styling lebih jelas -->
    <ul class="nav nav-pills mb-3" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link <?= $jenis == 'uang' ? 'active' : ''; ?>" 
               href="donasi-list.php?jenis=uang"
               style="<?= $jenis == 'uang' ? '' : 'background-color: #e9ecef; color: #495057;'; ?>">
                <i class="bi bi-cash-coin"></i> Donasi Uang
            </a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link <?= $jenis == 'barang' ? 'active' : ''; ?>" 
               href="donasi-list.php?jenis=barang"
               style="<?= $jenis == 'barang' ? '' : 'background-color: #e9ecef; color: #495057;'; ?>">
                <i class="bi bi-box-seam"></i> Donasi Barang
            </a>
        </li>
    </ul>

    <?php if ($jenis == 'uang'): ?>
        <a href="donasi-add-uang.php" class="btn btn-primary mb-3">
            <i class="bi bi-plus-circle"></i> Tambah Donasi Uang
        </a>
    <?php else: ?>
        <a href="donasi-add-barang.php" class="btn btn-primary mb-3">
            <i class="bi bi-plus-circle"></i> Tambah Donasi Barang
        </a>
    <?php endif; ?>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>No</th>
                <th>Donatur</th>
                <?php if ($jenis == 'barang'): ?>
                    <th>Keterangan</th>
                    <th>Kuantitas</th>
                <?php else: ?>
                    <th>Nominal (Rp)</th>
                <?php endif; ?>
                <th>Tanggal</th>
                <th>Aksi</th>
            </tr>
        </thead>

        <tbody>
            <?php
            if ($jenis == 'uang') {
                $query = pg_query($koneksi, "
                    SELECT 
                        d.id,
                        d.tanggal,
                        dn.nama,
                        du.nominal
                    FROM donasi d
                    JOIN donatur dn ON d.id_donatur = dn.id
                    JOIN donasi_uang du ON du.id_donasi = d.id
                    ORDER BY d.id DESC
                ");
            } else {
                $query = pg_query($koneksi, "
                    SELECT 
                        d.id,
                        d.tanggal,
                        dn.nama,
                        db.keterangan,
                        db.kuantitas
                    FROM donasi d
                    JOIN donatur dn ON d.id_donatur = dn.id
                    JOIN donasi_barang db ON db.id_donasi = d.id
                    ORDER BY d.id DESC
                ");
            }

            $no = 1;
            while ($row = pg_fetch_assoc($query)) :
            ?>
                <tr>
                    <td><?= $no++; ?></td>
                    <td><?= $row['nama']; ?></td>

                    <?php if ($jenis == 'barang'): ?>
                        <td><?= $row['keterangan']; ?></td>
                        <td><?= $row['kuantitas']; ?> pcs</td>
                    <?php else: ?>
                        <td>Rp <?= number_format($row['nominal'], 0, ',', '.'); ?></td>
                    <?php endif; ?>

                    <td><?= $row['tanggal']; ?></td>

                    <td>
                        <?php if ($jenis == 'uang'): ?>
                            <a href="donasi-edit-uang.php?id=<?= $row['id']; ?>" class="btn btn-warning btn-sm">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                        <?php else: ?>
                            <a href="donasi-edit-barang.php?id=<?= $row['id']; ?>" class="btn btn-warning btn-sm">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                        <?php endif; ?>
                        
                        <a href="donasi-delete.php?id=<?= $row['id']; ?>&jenis=<?= $jenis; ?>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Yakin menghapus donasi ini?')">
                           <i class="bi bi-trash"></i> Hapus
                        </a>
                    </td>
                </tr>

            <?php endwhile; ?>
        </tbody>

    </table>

</div>

<?php include '../templates/footer.php'; ?>
