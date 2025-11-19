INSERT INTO cabang (cabang) values
('Bogor'),
('Bandung'),
('Jakarta'),
('Yogyakarta'),
('Surabaya');

INSERT INTO divisi (di_name) VALUES
('Badan Pengawas Harian'),
('Human Capital & General Affair'),
('Media Kreatif'),
('Public Relation'),
('Project Event'),
('Fund Raising');

INSERT INTO staff (nama, tempat_lahir, tanggal_lahir, mbti, instansi, id_cabang, id_divisi) VALUES
('Dinda Pratiwi', 'Bogor', '2004-03-15', 'ENFJ', 'IPB University', 1, 1),
('Bagus Saputra', 'Depok', '2005-08-22', 'ISTJ', 'IPB University', 1, 2),
('Nadila Putri', 'Cirebon', '2004-11-08', 'INFP', 'IPB University', 1, 3),
('Farhan Akbar', 'Bekasi', '2005-01-30', 'ENTJ', 'IPB University', 1, 4),
('Rizky Maulana', 'Bandung', '2003-07-22', 'ISTP', 'ITB', 2, 2),
('Larasati Dewi', 'Garut', '2004-12-18', 'ISFP', 'ITB', 2, 6),
('Aditya Wijaya', 'Sumedang', '2003-09-05', 'INTJ', 'ITB', 2, 1),
('Kevin Sanjaya', 'Cimahi', '2005-04-10', 'ESTP', 'ITB', 2, 5),
('Salsa Bilqis', 'Jakarta', '2005-05-12', 'ESFJ', 'Universitas Indonesia', 3, 6),
('Aurelia Citra', 'Tangerang', '2006-08-25', 'ENFP', 'Universitas Indonesia', 3, 3),
('Reihan Aditya', 'Bogor', '2004-02-14', 'ENTP', 'Universitas Indonesia', 3, 5),
('Maya Sari', 'Depok', '2005-07-20', 'ISFJ', 'Universitas Indonesia', 3, 4),
('Budi Santoso', 'Surabaya', '2004-07-15', 'INTJ', 'ITS', 5, 1),
('Sri Mulyani', 'Malang', '2005-02-28', 'ESFJ', 'ITS', 5, 2),
('Ahmad Fauzi', 'Pasuruan', '2004-11-10', 'ENTP', 'ITS', 5, 5),
('Putri Ayu', 'Yogyakarta', '2005-05-20', 'ISFP', 'UGM', 4, 3),
('Eko Prasetyo', 'Sleman', '2004-09-05', 'ISTJ', 'UGM', 4, 4),
('Lutfi Rahman', 'Bantul', '2006-01-12', 'INFP', 'UGM', 4, 6),
('Rahmat Hidayat', 'Surabaya', '2004-06-10', 'ISFP', 'ITS', 5, 6),
('Siti Nurhaliza', 'Sidoarjo', '2005-09-22', 'ESFJ', 'ITS', 5, 6),
('Firman Syah', 'Bantul', '2004-11-05', 'ENTP', 'UGM', 4, 5),
('Dewi Kartika', 'Medan', '2006-01-17', 'INFJ', 'UGM', 4, 4);


INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;
INSERT INTO tempat DEFAULT VALUES;

INSERT INTO tempat_umum (id_tempat, ruang) VALUES
(1, 'RKU 2.01'),
(1, 'Auditorium FEM'),
(2, 'Gedung Utama ITB'),
(2, 'Auditorium SBM ITB'),
(3, 'Balairung UI'),
(3, 'Gedung Kemahasiswaan'),
(9, 'Gedung Rektorat ITS'),
(9, 'Auditorium Pascasarjana ITS'),
(10, 'Balairung UGM'),
(10, 'Gedung Pusat Kegiatan Mahasiswa UGM'),
(11, 'Gedung Serba Guna ITS'),
(12, 'Aula Kampus UGM');

INSERT INTO tempat_panti (id_tempat, nama_panti, jml_anak, min_usia, max_usia, min_pendidikan, max_pendidikan) VALUES
(4, 'Panti Sejahtera', 100, 3, 17, 'BELUM SEKOLAH', 'SMA'),
(5, 'Panti Asuhan Leuwiliang', 70, 4, 19, 'BELUM SEKOLAH', 'SMA'),
(6, 'Panti Kasih', 80, 3, 18, 'BELUM SEKOLAH', 'SMA'),
(9, 'Panti Asuhan Harapan Bangsa', 65, 2, 16, 'BELUM SEKOLAH', 'SMP'),
(10, 'Panti Tresna Werdha Muda', 40, 1, 18, 'BELUM SEKOLAH', 'SMA'),
(11, 'Panti Asuhan Harapan Bangsa Surabaya', 65, 2, 16, 'BELUM SEKOLAH', 'SMP'),
(12, 'Panti Jaya', 40, 5, 18, 'BELUM SEKOLAH', 'SMA');

INSERT INTO event (id_tempat, tema_event) VALUES
(1, 'Rapat General Cabang Bogor 1.0'),
(1, 'Workshop Literasi Digital Anak Panti'),
(4, 'Ngabuburit Bareng Adik-Adik Panti'),
(5, 'Sapa Panti 1.0'),
(2, 'Rapat General Cabang Bandung 1.0'),
(2, 'Pelatihan Coding untuk Anak Panti'),
(4, 'Charity Concert Bandung'),
(3, 'Rapat General Cabang Jakarta 1.0'),
(3, 'Pelatihan Softskill Mahasiswa UI'),
(6, 'Project #DearOrphanage Jakarta'),
(9, 'Rapat General Cabang Surabaya 1.0'),
(9, 'Workshop Kewirausahaan Mahasiswa ITS'),
(9, 'Charity Run for Orphans Surabaya'),
(10, 'Rapat General Cabang Yogyakarta 1.0'),
(10, 'Pelatihan Jurnalistik untuk Anak Muda'),
(10, 'Ngayogyakarta Bersama Anak Panti'),
(11, 'Kegiatan Ramadhan'),
(12, 'Sosialisasi Kesehatan Remaja'),
(9, 'Pelatihan Kewirausahaan');

INSERT INTO event_internal (id_event) VALUES
(1), (2), (5), (6), (8), (9), (11), (12), (14), (15), (19);

INSERT INTO event_eksternal (id_event, tanggal_mulai, tanggal_selesai, deskripsi) VALUES
(3, '2025-04-10', '2025-04-10', 'Ngabuburit dan buka puasa bersama anak panti saat Ramadhan'),
(4, '2025-09-17', '2025-10-10', 'Kunjungan rutin dan kegiatan permainan edukatif'),
(7, '2025-09-24', '2025-10-24', 'Konser amal penggalangan dana oleh relawan ITB'),
(10, '2025-08-20', '2025-08-20', 'Program pelatihan kerajinan tangan dan softskill untuk anak panti'),
(13, '2025-11-30', '2025-11-30', 'Acara amal berupa lari santai untuk mengumpulkan dana bagi anak panti di Surabaya.'),
(16, '2025-12-05', '2025-12-05', 'Kegiatan budaya dan seni bersama anak-anak panti di Yogyakarta.'),
(17, '2025-03-15', '2025-03-15', 'Kegiatan buka bersama dan pembagian sembako'),
(18, '2025-11-05', '2025-11-05', 'Sosialisasi kesehatan reproduksi dan gizi bagi remaja putus sekolah');

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
(12, 10),
(19, 17),
(20, 17),
(21, 18),
(22, 18),
(19, 19);

INSERT INTO donatur (nama) VALUES
('Sentral Komputer'),
('Yayasan Sejahtera'),
('Dr. Endang Purnama Giri, S.Si., M.Si.'),
('Prof. Dr. Ir. Arif Satria, M.Sc.'),
('Mamang Pauji'),
('Cici Senkom'),
('PT. Maju Jaya Abadi'),
('Paul Rest');

INSERT INTO donasi (id_donatur, tanggal) VALUES
(1, '2025-01-15'),
(2, '2025-02-20'),
(3, '2025-03-10'),
(4, '2025-04-01'),
(5, '2025-05-01'),
(6, '2025-05-02'),
(2, '2025-06-01'),
(1, '2025-06-02'),
(7, '2025-06-10'),
(8, '2025-06-15');

INSERT INTO donasi_uang (id_donasi, nominal) VALUES
(1, 1500000.00),
(2, 2500000.00),
(3, 1000000.00),
(4, 5000000.00),
(9, 7500000.00);

INSERT INTO donasi_barang (id_donasi, keterangan, kuantitas) VALUES
(6, 'Laptop Bekas (5 unit)', 5),
(5, 'Buku Pelajaran dan Alat Tulis', 300),
(7, 'Buku Tulis', 500),
(8, 'Mainan Edukatif', 200),
(10, 'Perlengkapan Mandi & Kebersihan', 100);
