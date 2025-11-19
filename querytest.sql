-- Cari panti berdasarkan nama
SELECT 
    tp.nama_panti,
    tp.jml_anak,
    CONCAT(tp.min_usia, ' - ', tp.max_usia, ' tahun') as rentang_usia,
    CONCAT(tp.min_pendidikan, ' - ', tp.max_pendidikan) as rentang_pendidikan,
    COUNT(DISTINCT e.id) as jumlah_event
FROM tempat_panti tp
LEFT JOIN event e ON tp.id_tempat = e.id_tempat
WHERE tp.nama_panti ILIKE '%Sejahtera%'
GROUP BY tp.nama_panti, tp.jml_anak, tp.min_usia, tp.max_usia, tp.min_pendidikan, tp.max_pendidikan;

-- Cari staff berdasarkan nama, instansi, MBTI, atau divisi
SELECT 
    s.nama,
    s.instansi,
    s.mbti,
    d.di_name as divisi,
    c.cabang
FROM staff s
JOIN divisi d ON s.id_divisi = d.id
JOIN cabang c ON s.id_cabang = c.id
WHERE 
    s.nama ILIKE '%Dinda%' OR
    s.instansi ILIKE '%IPB%' OR
    s.mbti ILIKE '%ENFJ%' OR
    d.di_name ILIKE '%Media%';

-- Cari event berdasarkan nama, tanggal, tema, tempat, deskripsi
SELECT 
    e.tema_event as nama_event,
    ee.tanggal_mulai,
    ee.tanggal_selesai,
    COALESCE(tu.ruang, tp.nama_panti) as tempat,
    ee.deskripsi
FROM event e
LEFT JOIN event_eksternal ee ON e.id = ee.id_event
LEFT JOIN tempat_umum tu ON e.id_tempat = tu.id_tempat
LEFT JOIN tempat_panti tp ON e.id_tempat = tp.id_tempat
WHERE 
    e.tema_event ILIKE '%Workshop%' OR
    ee.tanggal_mulai BETWEEN '2025-04-01' AND '2025-04-30' OR
    COALESCE(tu.ruang, tp.nama_panti) ILIKE '%RKU%' OR
    ee.deskripsi ILIKE '%puasa%';

-- Pencatatan demografi berdasarkan rentang umur dan jenjang pendidikan
SELECT 
    tp.nama_panti,
    CASE 
        WHEN tp.min_usia BETWEEN 3 AND 6 THEN 'Usia Dini (3-6 tahun)'
        WHEN tp.min_usia BETWEEN 7 AND 12 THEN 'Usia Anak (7-12 tahun)'
        WHEN tp.min_usia BETWEEN 13 AND 17 THEN 'Usia Remaja (13-17 tahun)'
        ELSE 'Usia Dewasa Muda (18+ tahun)'
    END as kelompok_usia,
    CONCAT(tp.min_pendidikan, ' - ', tp.max_pendidikan) as jenjang_pendidikan,
    tp.jml_anak as jumlah_anak,
    ROUND(tp.jml_anak * 100.0 / SUM(tp.jml_anak) OVER (), 2) as persentase_total
FROM tempat_panti tp
ORDER BY tp.nama_panti, kelompok_usia;

-- Cari donasi berdasarkan sumber donatur
SELECT 
    dt.nama as donatur,
    d.tanggal,
    COALESCE(du.nominal, 0) as donasi_uang,
    COALESCE(db.keterangan, 'Tidak ada') as donasi_barang,
    COALESCE(db.kuantitas, 0) as kuantitas
FROM donasi d
JOIN donatur dt ON d.id_donatur = dt.id
LEFT JOIN donasi_uang du ON d.id = du.id_donasi
LEFT JOIN donasi_barang db ON d.id = db.id_donasi
WHERE dt.nama ILIKE '%Sentral Komputer%' OR dt.nama ILIKE '%Yayasan%';

-- Lacak staff yang terlibat di setiap event
SELECT 
    e.tema_event,
    s.nama as staff,
    d.di_name as divisi,
    c.cabang,
    ee.tanggal_mulai,
    ee.tanggal_selesai
FROM partisipasi p
JOIN staff s ON p.id_staff = s.id
JOIN event e ON p.id_event = e.id
JOIN divisi d ON s.id_divisi = d.id
JOIN cabang c ON s.id_cabang = c.id
LEFT JOIN event_eksternal ee ON e.id = ee.id_event
WHERE e.tema_event ILIKE '%Ngabuburit%'
ORDER BY ee.tanggal_mulai DESC;

-- Laporan staff per divisi
SELECT 
    d.di_name as divisi_program,
    COUNT(DISTINCT s.id) as total_staff,
    COUNT(DISTINCT p.id_event) as total_event_diikuti,
    ROUND(COUNT(DISTINCT p.id_event) * 1.0 / COUNT(DISTINCT s.id), 2) as rata_event_per_staff
FROM divisi d
LEFT JOIN staff s ON d.id = s.id_divisi
LEFT JOIN partisipasi p ON s.id = p.id_staff
GROUP BY d.id, d.di_name
ORDER BY total_event_diikuti DESC;

-- Laporan donasi per donatur
SELECT 
    dt.nama as donatur,
    COUNT(DISTINCT d.id) as jumlah_donasi,
    COALESCE(SUM(du.nominal), 0) as total_donasi_uang,
    COUNT(DISTINCT db.id_donasi) as jumlah_donasi_barang,
    MIN(d.tanggal) as donasi_pertama,
    MAX(d.tanggal) as donasi_terakhir
FROM donatur dt
LEFT JOIN donasi d ON dt.id = d.id_donatur
LEFT JOIN donasi_uang du ON d.id = du.id_donasi
LEFT JOIN donasi_barang db ON d.id = db.id_donasi
GROUP BY dt.id, dt.nama
HAVING COUNT(DISTINCT d.id) > 0
ORDER BY total_donasi_uang DESC;