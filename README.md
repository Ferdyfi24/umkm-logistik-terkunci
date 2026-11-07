# Lebih Dekat ke Luar Negeri daripada ke Pulau Sebelah

Final Project Data Analytics, Creative Technology Future Talents (November 2026).
Pengirim: Ferdy Febrian Iskandar.

Pertanyaan yang dijawab project ini: UMKM digital Indonesia sudah berjualan online, jadi kenapa barangnya jarang menyeberang ke pulau lain?

## Temuan utama
1. **Pasar terkunci.**
   - Dari setiap 100 usaha online, minimal sekitar 94 tidak pernah mengirim ke luar pulaunya (Indeks Keterkuncian Pulau nasional 93,67).
   - Di NTT, porsi usaha yang mengirim ke luar negeri (3,87%) lebih besar daripada yang mengirim ke Jawa (2,78%).
2. **Kiriman kecil mahal.**
   - Per kg, kirim satuan ke Kupang dan Jayapura sampai 14× lebih mahal daripada kirim borongan (tarif resmi J&T vs kargo laut).
   - Indonesia juga mencatat bribery incidence 20,3%, dibanding 12,8% rata-rata Asia Timur & Pasifik.
3. **Timur paling terdampak.** Usaha di Maluku & Papua yang menyebut jasa pengiriman sebagai kendala utama mencapai 10,58%, dua kali lipat Jawa (4,97%).
4. **Rekomendasi.**
   - Titik kumpul kiriman antarpulau berbasis AI di level agregator.
   - Dimulai dari 13 provinsi prioritas.
   - Survei rutin biaya tidak resmi.

## Isi repo
| Folder | Isi |
|---|---|
| `data/` | CSV hasil olahan: 38 provinsi, indikator nasional, tarif, World Bank Enterprise Survey, daftar sumber |
| `supabase/seed.sql` | Membuat schema `fpda` + 5 tabel (baca-saja untuk publik) dan mengisi datanya |
| `web/` | Dashboard statis (HTML + JS tanpa framework). Membaca Supabase jika `config.js` diisi, kalau tidak memakai `data.json` |
| `build.py` | Membangun `web/data.json` dan `supabase/seed.sql` dari `data/` |

## Metode
- **Sumber utama:** BPS Statistik E-Commerce 2024, Lampiran 1, 3, 21, 23, 29. PDF-nya berupa gambar, jadi tabel diekstrak dengan OCR lalu dicek balik ke angka resmi BPS:
  - total 4.400.973 usaha;
  - 66,28% di Jawa;
  - metode kirim nasional 48,03 / 43,68 / 7,96;
  - kendala kirim nasional 5,30%.
- **Indeks Keterkuncian Pulau** = 100 − jumlah % usaha yang melayani pulau lain. Nilai ini batas bawah karena satu usaha bisa melayani lebih dari satu wilayah.
- **Rata-rata per wilayah** dibobot jumlah usaha per provinsi.
- **Provinsi prioritas** = provinsi yang keterkuncian dan kendala kirimnya sama-sama di atas median 38 provinsi.
- **Klaim yang dicabut setelah diuji:**
  - "angkutan dari timur pulang kosong" (data bongkar-muat BPS Statistik Transportasi Laut 2024 tidak konsisten);
  - "UMKM rata-rata kirim 1-3 kg" (tidak ada sumber).

## Batasan
- Data wilayah kirim berupa % usaha, bukan volume barang.
- RSE Papua Tengah (27,11%), Papua Pegunungan (32,77%), dan Papua Barat Daya (13,49%) tinggi, jadi angkanya kurang presisi.
- World Bank Enterprise Survey tidak mencakup usaha di bawah 5 karyawan dan pungli di jalan.
- Selisih tarif adalah batas atas, belum termasuk biaya konsolidasi dan antar akhir.
- Rekomendasi adalah usulan berbasis bukti, belum diuji di Indonesia.

## Menjalankan sendiri
```bash
python3 build.py                     # perbarui data.json dan seed.sql dari CSV
cd web && python3 -m http.server     # buka http://localhost:8000
```

### Supabase (opsional)
1. Buat project baru, lalu jalankan isi `supabase/seed.sql` di SQL Editor.
2. Buka Settings > API > Exposed schemas, lalu tambahkan `fpda`.
3. Isi `web/config.js` dengan Project URL dan **publishable/anon key**. Jangan pakai service_role key.

### Deploy ke Cloudflare Pages
1. Hubungkan repo ini ke Cloudflare Pages.
2. Build command dikosongkan.
3. Build output directory diisi `web`.

## Sumber
Lihat `data/sumber.csv`. Jurnal yang dikutip berada di kuartil SJR Q1-Q3 sesuai tahun terbitnya (dicek di scimagojr.com).
