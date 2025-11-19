INSERT INTO cabang (id, cabang) VALUES
(1, 'Bogor'),
(2, 'Bandung'),
(3, 'Jakarta');

INSERT INTO divisi (id, di_name) VALUES
(1, 'Badan Pengawas Harian'),
(2, 'Human Capital & General Affair'),
(3, 'Media Kreatif'),
(4, 'Public Relation'),
(5, 'Project Event'),
(6, 'Fund Raising');

INSERT INTO staff (id, nama, tempat_lahir, tanggal_lahir, mbti, instansi, id_cabang, id_divisi) VALUES
(1, 'Dinda Pratiwi', 'Bogor', '2004-03-15', 'ENFJ', 'IPB University', 1, 1),
(2, 'Bagus Saputra', 'Depok', '2005-08-22', 'ISTJ', 'IPB University', 1, 2),
(3, 'Nadila Putri', 'Cirebon', '2004-11-08', 'INFP', 'IPB University', 1, 3),
(4, 'Farhan Akbar', 'Bekasi', '2005-01-30', 'ENTJ', 'IPB University', 1, 4),
(5, 'Rizky Maulana', 'Bandung', '2003-07-22', 'ISTP', 'ITB', 2, 2),
(6, 'Larasati Dewi', 'Garut', '2004-12-18', 'ISFP', 'ITB', 2, 6),
(7, 'Aditya Wijaya', 'Sumedang', '2003-09-05', 'INTJ', 'ITB', 2, 1),
(8, 'Kevin Sanjaya', 'Cimahi', '2005-04-10', 'ESTP', 'ITB', 2, 5),
(9, 'Salsa Bilqis', 'Jakarta', '2005-05-12', 'ESFJ', 'Universitas Indonesia', 3, 6),
(10, 'Aurelia Citra', 'Tangerang', '2006-08-25', 'ENFP', 'Universitas Indonesia', 3, 3),
(11, 'Reihan Aditya', 'Bogor', '2004-02-14', 'ENTP', 'Universitas Indonesia', 3, 5),
(12, 'Maya Sari', 'Depok', '2005-07-20', 'ISFJ', 'Universitas Indonesia', 3, 4);

INSERT INTO tempat (id) VALUES
(1), (2), (3), (4), (5), (6);

INSERT INTO tempat_umum (id_tempat, ruang) VALUES
(1, 'RKU 2.01'),
(1, 'Auditorium FEM'),
(2, 'Gedung Utama ITB'),
(2, 'Auditorium SBM ITB'),
(3, 'Balairung UI'),
(3, 'Gedung Kemahasiswaan');

INSERT INTO tempat_panti (id_tempat, nama_panti, jml_anak, min_usia, max_usia, min_pendidikan, max_pendidikan) VALUES
(4, 'Panti Sejahtera', 100, 3, 17, 'TK', 'SMA'),
(5, 'Panti Asuhan Leuwiliang', 70, 4, 19, 'TK', 'SMA'),
(6, 'Panti Sayang Bunda', 80, 3, 18, 'TK', 'SMA');

INSERT INTO event (id, id_tempat, tema_event) VALUES
(1, 1, 'Rapat General Cabang Bogor 1.0'),
(2, 1, 'Workshop Literasi Digital Anak Panti'),
(3, 4, 'Ngabuburit Bareng Adik-Adik Panti'),
(4, 5, 'Sapa Panti 1.0'),
(5, 2, 'Rapat General Cabang Bandung 1.0'),
(6, 2, 'Pelatihan Coding untuk Anak Panti'),
(7, 4, 'Charity Concert Bandung'),
(8, 3, 'Rapat General Cabang Jakarta 1.0'),
(9, 3, 'Pelatihan Softskill Mahasiswa UI'),
(10, 6, 'Project #DearOrphanage Jakarta');

INSERT INTO event_internal (id_event) VALUES
(1), (2), (5), (6), (8), (9);

INSERT INTO event_eksternal (id_event, tanggal_mulai, tanggal_selesai, deskripsi) VALUES
(3, '2025-04-10', '2025-04-10', 'Ngabuburit dan buka puasa bersama anak panti saat Ramadhan'),
(4, '2025-09-17', '2025-10-10', 'Kunjungan rutin dan kegiatan permainan edukatif'),
(7, '2025-09-24', '2025-10-24', 'Konser amal penggalangan dana oleh relawan ITB'),
(10, '2025-08-20', '2025-08-20', 'Program pelatihan kerajinan tangan dan softskill untuk anak panti');

INSERT INTO partisipasi (id_staff, id_event) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 4),
(3, 2), (3, 3),
(4, 4),
(5, 5), (5, 6), (5, 7),
(6, 6), (6, 7),
(7, 5),
(8, 6),
(9, 8), (9, 10),
(10, 9), (10, 10),
(11, 8), (11, 9),
(12, 10);

INSERT INTO donatur (id, nama) VALUES
(1, 'Sentral Komputer'),
(2, 'Yayasan Sejahtera'),
(3, 'Dr. Endang Purnama Giri, S.Si., M.Si.'),
(4, 'Prof. Dr. Ir. Arif Satria, M.Sc.'),
(5, 'Mamang Pauji'),
(6, 'Cici Senkom');

INSERT INTO donasi (id, id_donatur, tanggal) VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-02-20'),
(3, 3, '2025-03-10'),
(4, 4, '2025-04-01'),
(5, 5, '2025-05-01'),
(6, 6, '2025-05-02'),
(7, 2, '2025-06-01'),
(8, 1, '2025-06-02');

INSERT INTO donasi_uang (id_donasi, nominal) VALUES
(1, 1500000.00),
(2, 2500000.00),
(3, 1000000.00),
(4, 5000000.00);

INSERT INTO donasi_barang (id_donasi, keterangan, kuantitas) VALUES
(6, 'Laptop Bekas (5 unit)', 5),
(5, 'Buku Pelajaran dan Alat Tulis', 300),
(7, 'Buku Tulis', 500),
(8, 'Mainan Edukatif', 200);
