-- Dibangkitkan otomatis oleh build.py. Jalankan di SQL Editor Supabase (akun pribadi).
create schema if not exists fpda;

drop table if exists fpda.provinsi;
create table fpda.provinsi (
  id_baris bigint generated always as identity primary key,
  "provinsi" text,
  "pulau" text,
  "pct_usaha_ecommerce" numeric,
  "jumlah_usaha_ecommerce" bigint,
  "rse_pct" numeric,
  "kirim_sendiri_pct" numeric,
  "ambil_di_toko_pct" numeric,
  "jasa_kurir_pct" numeric,
  "download_pct" numeric,
  "ekspor_pct" numeric,
  "tujuan_sumatera" numeric,
  "tujuan_jawa" numeric,
  "tujuan_balinusra" numeric,
  "tujuan_kalimantan" numeric,
  "tujuan_sulawesi" numeric,
  "tujuan_malukupapua" numeric,
  "tujuan_luarnegeri" numeric,
  "kendala_kirim" numeric,
  "keluar_pulau_maks" numeric,
  "keluar_pulau_min" numeric,
  "indeks_keterkuncian" numeric,
  "prioritas" boolean
);
alter table fpda.provinsi enable row level security;
create policy "baca publik provinsi" on fpda.provinsi for select to anon, authenticated using (true);
grant usage on schema fpda to anon, authenticated;
grant select on fpda.provinsi to anon, authenticated;
insert into fpda.provinsi ("provinsi", "pulau", "pct_usaha_ecommerce", "jumlah_usaha_ecommerce", "rse_pct", "kirim_sendiri_pct", "ambil_di_toko_pct", "jasa_kurir_pct", "download_pct", "ekspor_pct", "tujuan_sumatera", "tujuan_jawa", "tujuan_balinusra", "tujuan_kalimantan", "tujuan_sulawesi", "tujuan_malukupapua", "tujuan_luarnegeri", "kendala_kirim", "keluar_pulau_maks", "keluar_pulau_min", "indeks_keterkuncian", "prioritas") values
('Aceh', 'Sumatera', 37.65, 77754, 4.98, 54.87, 3.99, 40.76, 0.37, 0.88, 100.0, 2.1, 0.32, 0.43, 0.37, 0.39, 0.88, 3.63, 3.61, 2.1, 96.39, false),
('Sumatera Utara', 'Sumatera', 35.38, 150183, 5.2, 58.02, 3.97, 37.91, 0.1, 0.4, 99.97, 0.92, 0.27, 0.28, 0.21, 0.06, 0.4, 8.8, 1.74, 0.92, 98.26, true),
('Sumatera Barat', 'Sumatera', 28.75, 76445, 4.47, 49.01, 9.54, 41.24, 0.21, 0.74, 100.0, 4.17, 0.53, 0.58, 0.46, 0.19, 0.74, 5.39, 5.93, 4.17, 94.07, false),
('Riau', 'Sumatera', 36.93, 62718, 4.72, 48.35, 7.31, 44.34, 0.0, 0.57, 100.0, 1.03, 0.44, 0.42, 0.49, 0.32, 0.57, 5.68, 2.7, 1.03, 97.3, false),
('Jambi', 'Sumatera', 33.9, 51727, 5.88, 48.01, 3.16, 48.78, 0.05, 0.04, 100.0, 1.58, 0.09, 0.23, 0.05, 0.0, 0.04, 5.46, 1.95, 1.58, 98.05, false),
('Sumatera Selatan', 'Sumatera', 37.84, 60385, 7.21, 53.5, 3.3, 43.15, 0.06, 0.35, 99.87, 1.85, 0.48, 0.33, 0.18, 0.03, 0.35, 6.18, 2.87, 1.85, 97.13, true),
('Bengkulu', 'Sumatera', 39.86, 71699, 8.44, 43.89, 2.38, 53.36, 0.37, 0.57, 99.66, 2.13, 0.16, 0.43, 0.13, 0.32, 0.57, 7.62, 3.17, 2.13, 96.83, true),
('Lampung', 'Sumatera', 52.17, 117382, 8.63, 47.05, 4.79, 47.58, 0.58, 0.57, 99.94, 3.57, 0.48, 0.72, 0.23, 0.12, 0.57, 3.16, 5.12, 3.57, 94.88, false),
('Kep. Bangka Belitung', 'Sumatera', 42.93, 42575, 5.47, 55.67, 1.52, 42.81, 0.0, 0.6, 99.91, 2.47, 0.09, 0.05, 0.23, 0.13, 0.6, 4.29, 2.97, 2.47, 97.03, false),
('Kepulauan Riau', 'Sumatera', 44.22, 53829, 7.27, 54.74, 7.23, 37.98, 0.05, 1.98, 99.98, 1.61, 0.15, 1.01, 0.08, 0.19, 1.98, 3.98, 3.04, 1.61, 96.96, false),
('DKI Jakarta', 'Jawa', 63.54, 462782, 4.32, 44.41, 13.38, 42.06, 0.15, 0.58, 3.1, 99.92, 1.2, 1.34, 0.92, 0.72, 0.58, 5.94, 7.28, 3.1, 92.72, false),
('Jawa Barat', 'Jawa', 43.38, 709851, 3.75, 48.49, 9.33, 41.58, 0.6, 1.12, 2.72, 99.86, 1.47, 1.32, 0.49, 0.85, 1.12, 5.39, 6.85, 2.72, 93.15, false),
('Jawa Tengah', 'Jawa', 45.18, 625695, 4.94, 50.66, 7.9, 41.04, 0.4, 1.26, 3.16, 99.97, 1.91, 2.37, 0.9, 0.96, 1.24, 4.79, 9.3, 3.16, 90.7, false),
('D.I. Yogyakarta', 'Jawa', 56.72, 269398, 5.21, 28.92, 7.39, 62.91, 0.78, 0.99, 3.21, 99.76, 2.45, 1.91, 0.74, 1.26, 0.93, 4.38, 9.57, 3.21, 90.43, false),
('Jawa Timur', 'Jawa', 37.54, 690542, 4.19, 48.72, 7.93, 43.12, 0.23, 0.93, 1.84, 99.87, 3.18, 1.9, 0.66, 0.86, 0.93, 4.07, 8.44, 3.18, 91.56, false),
('Banten', 'Jawa', 40.1, 158639, 4.34, 53.8, 11.3, 34.87, 0.03, 0.24, 0.91, 100.0, 0.06, 0.13, 0.0, 0.0, 0.24, 5.87, 1.1, 0.91, 98.9, true),
('Bali', 'Bali & Nusa Tenggara', 51.37, 134990, 6.9, 47.48, 5.94, 46.43, 0.15, 2.29, 0.32, 2.94, 99.55, 0.25, 0.2, 0.15, 2.29, 5.69, 3.86, 2.94, 96.14, false),
('Nusa Tenggara Barat', 'Bali & Nusa Tenggara', 29.83, 49256, 5.59, 53.42, 2.55, 43.71, 0.31, 5.0, 0.39, 2.63, 99.64, 0.2, 0.18, 0.06, 4.54, 4.36, 3.46, 2.63, 96.54, false),
('Nusa Tenggara Timur', 'Bali & Nusa Tenggara', 14.19, 23239, 3.65, 47.57, 3.67, 48.04, 0.72, 3.87, 0.56, 2.78, 100.0, 0.51, 0.59, 0.64, 3.87, 6.19, 5.08, 2.78, 94.92, false),
('Kalimantan Barat', 'Kalimantan', 40.02, 40379, 5.73, 48.62, 6.85, 44.15, 0.39, 0.66, 0.78, 1.88, 0.28, 99.95, 0.4, 0.17, 0.66, 8.83, 3.51, 1.88, 96.49, false),
('Kalimantan Tengah', 'Kalimantan', 35.01, 30937, 5.99, 43.76, 4.77, 51.09, 0.39, 0.07, 0.1, 0.53, 0.15, 100.0, 0.0, 0.06, 0.07, 10.96, 0.84, 0.53, 99.16, true),
('Kalimantan Selatan', 'Kalimantan', 43.43, 67637, 7.34, 47.72, 7.28, 44.49, 0.52, 0.13, 0.7, 1.63, 0.97, 99.78, 0.54, 0.38, 0.13, 8.18, 4.22, 1.63, 95.78, false),
('Kalimantan Timur', 'Kalimantan', 50.61, 89411, 4.76, 58.01, 6.79, 34.97, 0.23, 0.1, 0.51, 1.38, 0.14, 99.89, 1.24, 0.14, 0.1, 4.04, 3.41, 1.38, 96.59, false),
('Kalimantan Utara', 'Kalimantan', 39.03, 18265, 4.36, 53.54, 3.28, 43.09, 0.09, 1.31, 0.46, 1.77, 0.0, 99.86, 1.54, 0.0, 1.31, 2.92, 3.77, 1.77, 96.23, false),
('Sulawesi Utara', 'Sulawesi', 34.38, 32448, 7.77, 56.52, 6.21, 37.27, 0.0, 0.36, 0.33, 1.14, 0.23, 0.15, 100.0, 1.05, 0.36, 9.2, 2.9, 1.14, 97.1, true),
('Sulawesi Tengah', 'Sulawesi', 30.12, 25340, 5.3, 46.24, 6.79, 46.78, 0.19, 0.16, 0.23, 1.31, 0.0, 1.95, 99.52, 0.84, 0.16, 5.65, 4.33, 1.95, 95.67, false),
('Sulawesi Selatan', 'Sulawesi', 38.66, 108675, 5.54, 42.16, 7.67, 50.06, 0.1, 0.39, 0.41, 1.33, 0.37, 1.83, 99.78, 1.1, 0.39, 4.76, 5.04, 1.83, 94.96, false),
('Sulawesi Tenggara', 'Sulawesi', 27.63, 19911, 4.77, 49.98, 7.19, 42.7, 0.13, 0.47, 0.31, 0.97, 0.06, 0.54, 100.0, 0.7, 0.47, 4.43, 2.58, 0.97, 97.42, false),
('Gorontalo', 'Sulawesi', 21.37, 11013, 3.81, 50.14, 5.25, 44.45, 0.17, 0.37, 0.1, 0.96, 0.0, 0.31, 100.0, 0.12, 0.37, 9.02, 1.49, 0.96, 98.51, true),
('Sulawesi Barat', 'Sulawesi', 28.26, 28184, 4.93, 41.16, 7.1, 51.22, 0.52, 0.0, 0.73, 1.1, 0.41, 0.91, 99.93, 0.19, 0.0, 5.46, 3.34, 1.1, 96.66, false),
('Maluku', 'Maluku & Papua', 31.3, 15769, 5.62, 45.33, 3.37, 51.13, 0.18, 0.14, 0.35, 1.76, 0.4, 0.3, 0.74, 99.86, 0.14, 9.58, 3.55, 1.76, 96.45, false),
('Maluku Utara', 'Maluku & Papua', 21.93, 3201, 4.22, 63.3, 4.43, 32.13, 0.15, 0.04, 0.55, 1.72, 0.0, 0.0, 0.54, 99.96, 0.04, 9.73, 2.81, 1.72, 97.19, true),
('Papua Barat', 'Maluku & Papua', 16.09, 1791, 8.77, 51.56, 2.88, 45.35, 0.21, 0.2, 0.0, 0.74, 0.0, 0.21, 0.64, 100.0, 0.2, 7.34, 1.59, 0.74, 98.41, true),
('Papua Barat Daya', 'Maluku & Papua', 24.68, 4389, 13.49, 66.84, 2.13, 30.94, 0.09, 1.12, 0.0, 1.94, 0.0, 0.0, 0.22, 100.0, 1.12, 6.06, 2.16, 1.94, 97.84, true),
('Papua', 'Maluku & Papua', 23.29, 4826, 5.34, 51.65, 6.71, 41.59, 0.04, 0.95, 1.51, 1.42, 0.64, 0.29, 0.45, 100.0, 0.76, 8.49, 4.31, 1.51, 95.69, false),
('Papua Selatan', 'Maluku & Papua', 28.98, 3040, 4.15, 46.02, 5.87, 46.66, 1.45, 0.0, 0.0, 1.68, 0.0, 0.0, 0.41, 100.0, 0.0, 6.08, 2.09, 1.68, 97.91, true),
('Papua Tengah', 'Maluku & Papua', 28.78, 6284, 27.11, 67.66, 3.02, 29.31, 0.0, 0.0, 0.57, 0.86, 0.0, 0.07, 0.69, 100.0, 0.0, 21.2, 2.19, 0.86, 97.81, true),
('Papua Pegunungan', 'Maluku & Papua', 2.7, 384, 32.77, 57.6, 0.74, 41.65, 0.0, 0.74, 0.0, 2.23, 0.0, 0.0, 0.0, 98.51, 0.74, 13.97, 2.23, 2.23, 97.77, true);

drop table if exists fpda.indikator_nasional;
create table fpda.indikator_nasional (
  id_baris bigint generated always as identity primary key,
  "indikator" text,
  "nilai" numeric,
  "satuan" text,
  "lokasi_di_publikasi" text
);
alter table fpda.indikator_nasional enable row level security;
create policy "baca publik indikator_nasional" on fpda.indikator_nasional for select to anon, authenticated using (true);
grant usage on schema fpda to anon, authenticated;
grant select on fpda.indikator_nasional to anon, authenticated;
insert into fpda.indikator_nasional ("indikator", "nilai", "satuan", "lokasi_di_publikasi") values
('usaha_ecommerce_total', 4.4, 'juta usaha', 'Ringkasan eksekutif'),
('pertumbuhan_usaha_2024_vs_2023', 15.3, '%', 'Ringkasan eksekutif'),
('usaha_jualan_online', 42.02, '% dari seluruh usaha', 'Ringkasan eksekutif'),
('usaha_mikro_kecil', 97.38, '% usaha e-commerce', 'Ringkasan eksekutif'),
('media_pesan_instan', 94.76, '%', 'Ringkasan eksekutif'),
('media_sosial', 29.66, '%', 'Ringkasan eksekutif'),
('media_marketplace', 17.23, '%', 'Ringkasan eksekutif'),
('kirim_sendiri_oleh_penjual', 48.03, '%', 'Gambar 12, hal. 20'),
('kirim_via_jasa_kurir', 43.68, '%', 'Gambar 12, hal. 20'),
('ambil_di_toko_titik_jemput', 7.96, '%', 'Gambar 12, hal. 20'),
('download', 0.33, '%', 'Gambar 12, hal. 20'),
('pasar_dalam_negeri', 99.07, '%', 'Ringkasan eksekutif'),
('wilayah_kirim_jawa', 66.87, '% usaha', 'Gambar 14, hal. 22'),
('wilayah_kirim_sumatera', 19.17, '% usaha', 'Gambar 14, hal. 22'),
('wilayah_kirim_kalimantan', 6.87, '% usaha', 'Gambar 14, hal. 22'),
('wilayah_kirim_balinusra', 6.08, '% usaha', 'Gambar 14, hal. 22'),
('wilayah_kirim_sulawesi', 5.67, '% usaha', 'Gambar 14, hal. 22'),
('wilayah_kirim_malukupapua', 1.55, '% usaha', 'Gambar 14, hal. 22'),
('kendala_permodalan', 36.41, '% usaha', 'Gambar 22, hal. 37'),
('kendala_pemasaran_produk', 20.52, '% usaha', 'Gambar 22, hal. 37'),
('kendala_tenaga_kerja_terampil', 16.03, '% usaha', 'Gambar 22, hal. 37'),
('kendala_jasa_pengiriman', 5.3, '% usaha', 'Gambar 22, hal. 37'),
('kendala_kecurangan_jual_beli', 3.62, '% usaha', 'Gambar 22, hal. 37'),
('kendala_akses_internet', 3.11, '% usaha', 'Gambar 22, hal. 37'),
('kendala_lainnya', 15.01, '% usaha', 'Gambar 22, hal. 37');

drop table if exists fpda.tarif;
create table fpda.tarif (
  id_baris bigint generated always as identity primary key,
  "rute" text,
  "jenis" text,
  "layanan" text,
  "tarif_rp_per_kg" bigint,
  "minimal_kg" bigint,
  "sumber" text,
  "tanggal_cek" text,
  "catatan" text
);
alter table fpda.tarif enable row level security;
create policy "baca publik tarif" on fpda.tarif for select to anon, authenticated using (true);
grant usage on schema fpda to anon, authenticated;
grant select on fpda.tarif to anon, authenticated;
insert into fpda.tarif ("rute", "jenis", "layanan", "tarif_rp_per_kg", "minimal_kg", "sumber", "tanggal_cek", "catatan") values
('Jakarta-Kupang (Oebobo)', 'paket satuan', 'J&T EZ (reguler)', 78000, 1, 'jet.co.id (resmi)', '2026-11-05', null),
('Jakarta-Kupang (Oebobo)', 'paket satuan', 'J&T ECO (ekonomi)', 39000, 1, 'jet.co.id (resmi)', '2026-11-05', null),
('Jakarta-Kupang', 'kargo laut', 'LSJ Express', 5700, 50, 'lsjexpress.com (forwarder)', '2026-11-05', 'tarif publik forwarder'),
('Jakarta-Jayapura (Jayapura Utara)', 'paket satuan', 'J&T EZ (reguler)', 100000, 1, 'jet.co.id (resmi)', '2026-11-05', 'ECO tidak tersedia'),
('Jakarta-Jayapura', 'kargo laut', 'LOPExpress', 7200, 50, 'lopexpress.id (forwarder)', '2026-11-05', 'tarif terendah; forwarder lain s.d. Rp14.000'),
('Jakarta-Kupang (Semau Selatan)', 'paket satuan', 'J&T EZ', 77000, 1, 'jet.co.id (dicek Ferdy)', '2026-11-05', 'Pulau Semau'),
('Kupang (Amfoang Barat Daya)-Jakarta', 'paket satuan', 'J&T EZ', 32000, 1, 'jet.co.id (dicek Ferdy)', '2026-11-05', 'arah balik');

drop table if exists fpda.wbes;
create table fpda.wbes (
  id_baris bigint generated always as identity primary key,
  "indikator" text,
  "kelompok" text,
  "indonesia" numeric,
  "asia_timur_pasifik" numeric,
  "dunia" numeric,
  "sumber" text
);
alter table fpda.wbes enable row level security;
create policy "baca publik wbes" on fpda.wbes for select to anon, authenticated using (true);
grant usage on schema fpda to anon, authenticated;
grant select on fpda.wbes to anon, authenticated;
insert into fpda.wbes ("indikator", "kelompok", "indonesia", "asia_timur_pasifik", "dunia", "sumber") values
('bribery_incidence', 'semua', 20.3, 12.8, 11.0, 'World Bank Enterprise Survey Indonesia 2023'),
('bribery_incidence', 'kecil (5-19)', 15.5, 12.1, 10.8, 'World Bank Enterprise Survey Indonesia 2023'),
('bribery_incidence', 'menengah (20-99)', 23.9, 14.2, 11.1, 'World Bank Enterprise Survey Indonesia 2023'),
('bribery_incidence', 'besar (100+)', 35.4, 14.4, 10.0, 'World Bank Enterprise Survey Indonesia 2023'),
('bribery_depth', 'semua', 14.7, 10.5, 8.7, 'World Bank Enterprise Survey Indonesia 2023'),
('hadiah_ke_pejabat', 'semua', 29.5, 11.5, 10.8, 'World Bank Enterprise Survey Indonesia 2023'),
('korupsi_hambatan_besar', 'semua', 23.6, 10.5, 22.5, 'World Bank Enterprise Survey Indonesia 2023'),
('transportasi_hambatan_besar', 'semua', 10.0, 10.7, 17.3, 'World Bank Enterprise Survey Indonesia 2023');

drop table if exists fpda.sumber;
create table fpda.sumber (
  id_baris bigint generated always as identity primary key,
  "id" bigint,
  "judul" text,
  "penerbit" text,
  "tahun" bigint,
  "tipe" text,
  "kuartil_sjr" text,
  "url" text
);
alter table fpda.sumber enable row level security;
create policy "baca publik sumber" on fpda.sumber for select to anon, authenticated using (true);
grant usage on schema fpda to anon, authenticated;
grant select on fpda.sumber to anon, authenticated;
insert into fpda.sumber ("id", "judul", "penerbit", "tahun", "tipe", "kuartil_sjr", "url") values
(1, 'Statistik E-Commerce 2024', 'BPS', 2025, 'pemerintah', null, 'https://www.bps.go.id/id/publication/2025/11/28/647323224ecc656c2933571b/statistik-e-commerce-2024.html'),
(2, 'Statistik Transportasi Laut 2024', 'BPS', 2025, 'pemerintah', null, 'https://www.bps.go.id/id/publication/2025/12/01/fdc6de7c2b34aa9b109edcad/statistik-transportasi-laut-2024.html'),
(3, 'Enterprise Survey Indonesia 2023', 'World Bank', 2025, 'survei', null, 'https://www.enterprisesurveys.org/en/data/exploreeconomies/2023/indonesia'),
(4, 'Logistics Performance Index 2023', 'World Bank', 2023, 'survei', null, 'https://lpi.worldbank.org/international/global'),
(5, 'Pungli truk Rp100-150 juta per tahun (Menko AHY)', 'ANTARA', 2025, 'media', null, 'https://en.antaranews.com/news/367177/illegal-levies-on-trucks-raise-indonesias-logistics-costs-minister'),
(6, 'Cek tarif J&T', 'J&T Express', 2026, 'operator', null, 'https://jet.co.id/rates'),
(7, 'Kilay, Simamora & Putra. The Influence of E-Payment and E-Commerce Services on Supply Chain Performance (JOItmc 8(3):119)', 'MDPI', 2022, 'jurnal', 'Q1', 'https://doi.org/10.3390/joitmc8030119'),
(8, 'Bening dkk. E-Commerce technologies adoption strategy selection in Indonesian SMEs (Sustainability 15(12):9361)', 'MDPI', 2023, 'jurnal', 'Q1', null),
(9, 'Amin dkk. Impact of maritime logistics on archipelagic economic development in eastern Indonesia (AJSL 37(2):157-164)', 'Elsevier', 2021, 'jurnal', 'Q2', 'https://doi.org/10.1016/j.ajsl.2021.01.004'),
(10, 'Sunitiyoso dkk. Port performance factors and their interactions (AJSL 38(2):107-123)', 'Elsevier', 2022, 'jurnal', 'Q2', 'https://doi.org/10.1016/j.ajsl.2022.04.001'),
(11, 'Surjandari, Rindrasari & Dhini. Evaluation of Efficiency in Logistics Company: Last-Mile Delivery (EVERGREEN 10(2):649-657)', 'Kyushu University', 2023, 'jurnal', 'Q3', null),
(12, 'Obstacles and Drivers of Sustainable Horizontal Logistics Collaboration (Sustainability 17(15):7001)', 'MDPI', 2025, 'jurnal', 'Q1', 'https://www.mdpi.com/2071-1050/17/15/7001');

-- Setelah dijalankan: Settings > API > Exposed schemas, tambahkan 'fpda'.