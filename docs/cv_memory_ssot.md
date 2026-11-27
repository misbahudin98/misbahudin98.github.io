# CV Master Memory — Single Source of Truth (Repo-Local SSoT)
> **Pemilik Profil:** Misbahudin, S.Tr.Kom.  
> **Portofolio Resmi:** [https://misbahudin98.github.io/](https://misbahudin98.github.io/)  
> **Catatan Privasi Repo Publik:** Dokumen ini disimpan di dalam repositori portofolio Git agar portabel dan versi-terkontrol. Data sensitif pribadi (NIK, nomor/rincian SK, dan tanggal lahir) **sengaja dikecualikan** demi keamanan publik.

---

## 1. ATURAN MUTLAK PENYUSUNAN CV & LAMARAN (PRE-FLIGHT CHECKLIST)

1. **Urutan Pengalaman Kerja Wajib Kronologis Mundur (1 → 2 → 3):**
   - **Urutan 1 (Terbaru):** Full Stack Developer & Systems Engineer (Freelance) — Remote / Malang (**September 2026 – Sekarang**)
   - **Urutan 2 (Kedua):** TU & Bendahara (IT Support & Operasional Sekolah) — SMKS Taruna Bhakti Malang (**Juli 2025 – Juli 2026**)
   - **Urutan 3 (Terakhir):** Back End Developer & Technical Project Manager — Ar-Rohmah Putri Islamic Boarding School (**Juni 2021 – Januari 2025**)
   - *Larangan:* Jangan pernah membalik urutan ini meskipun lowongan lebih cocok dengan pengalaman #2 atau #3; cukup sesuaikan penekanan kata kunci pada ringkasan dan poin pencapaian.
2. **Zero Truncation (Anti-Pemotongan Kontak & URL):**
   - Setiap tautan wajib tampil utuh (`Label: Nilai`) dengan `white-space: nowrap` pada HTML/PDF, tanpa ellipsis (`...`) atau titik di akhir URL.
3. **Akurasi Fakta Virtual Account (Non-API):**
   - Pada Ar-Rohmah Putri IBS, tekankan **sistem otomatisasi format penomoran Virtual Account (VA)** yang selaras dengan nomor VA riil manual pada sistem bank/keuangan (bukan integrasi API bank atau Payment Gateway API).
4. **Tautan Resmi, Setara S1 & Gaya Bahasa Lugas:**
   - Selalu gunakan `https://misbahudin98.github.io/` dan cantumkan `D4 / Sarjana Terapan (Setara S1) – Teknik Informatika (S.Tr.Kom.)`.
   - Patuhi standar penulisan lugas, ramah pembaca awam/HRD, dan humanis pada [`.agents/skills/portfolio-architect/references/plain_language_writing_guide.md`](../.agents/skills/portfolio-architect/references/plain_language_writing_guide.md) (ISO 24495-1).

---

## 2. IDENTITAS & KONTAK RESMI (UTUH)

- **Nama Lengkap & Gelar:** Misbahudin, S.Tr.Kom.
- **Domisili:** Kab. Malang, Jawa Timur, 65162
- **WhatsApp:** +62 822-3282-8065
- **Email:** misbah.udin@outlook.co.id
- **Portofolio:** https://misbahudin98.github.io/
- **LinkedIn:** https://www.linkedin.com/in/misbahudin98
- **GitHub:** https://github.com/misbahudin98

---

## 3. RINGKASAN KARIER (EXECUTIVE SUMMARY — SSoT)

Full Stack Developer & Systems Engineer dengan pengalaman **3,5+ tahun** membangun sistem web **Laravel 13** & **Svelte 5**, basis data **MySQL (3NF)**, pengolahan data **Microsoft Excel**, administrasi operasional, serta infrastruktur jaringan (**MikroTik QoS & LAN Printer Sharing**). Terbukti mengeksekusi migrasi **12.117 data dengan 0% data loss**, melayani **>10.000 pengguna aktif**, menjaga validitas data portal dinas & keuangan **100%**, menstabilkan koneksi **300–400 Mbps** untuk 60+ pengguna, serta menjamin keandalan aplikasi melalui **250+ pengujian otomatis PHPUnit** (termasuk **121 tests / 1.148 assertions** pada SIM Notaris & PPAT).

---

## 4. KEAHLIAN TEKNIS UTAMA

- **Data, Database & Microsoft Excel:** MySQL (Normalisasi 3NF, Query Optimization, Mitigasi Error 1040), ETL & Pembersihan Data (12.117+ rekaman, 0% data loss), Rekonsiliasi Data Lintas Sumber, Microsoft Excel Lanjutan (`VLOOKUP`, `SUMIFS`, `COUNTIFS`, `COUNTIF`, `PROPER/TRIM`, `Pivot Table`, `Chart`, `Data Validation`, `Conditional Formatting`), Otomasi Format Penomoran Virtual Account.
- **Backend & Pengembangan Web:** PHP (termasuk PHP 8.3/8.4), Laravel 13 (Sanctum, Passport OAuth 2.0, Blade), RESTful API, Granular RBAC, Svelte 5 (Runes), Tailwind CSS v4, JavaScript (ES6+), GSAP 3.12 (ScrollTrigger), HTML5/CSS3.
- **Pengujian & Workflow AI:** PHPUnit (**121 passed / 1.148 assertions** pada SIM Notaris & PPAT; **250+ automated tests** lintas proyek), TDD / AAA Pattern, Prompt Engineering Terstruktur (XML/SSoT), AI Pair-Programming (Antigravity CLI), `llms.txt`, Git/GitHub, Vite, Composer.
- **IT Operations, Jaringan & Administrasi:** Optimasi Shared Hosting (`SESSION_DRIVER=file` NVMe lokal, Inode GC, Little's Law `L <= 0.16` pada kuota 25 koneksi MySQL), MikroTik hEX RB750Gr3 (QoS Simple Queue), Perawatan PC spek rendah (Intel Celeron RAM 4GB), LAN Printer Sharing Terpusat, Backup & Recovery, Pembukuan Dana BOS/PIP/Prasejahtera, serta Sinkronisasi Dapodik, Datadik & e-Ijazah.

---

## 5. RIWAYAT PENGALAMAN KERJA (KRONOLOGIS MUNDUR)

### 1. Full Stack Developer & Systems Engineer (Freelance) | Remote / Malang *(September 2026 – Sekarang)*
- **SIM Notaris & PPAT — Enterprise Vault (`v6.31.0`):** Membangun sistem operasional kantor Notaris & PPAT terpadu berbasis **Laravel 13 Sanctum** dan **Svelte 5 Runes**, mencakup:
  - **6 Peran Hak Akses (RBAC Yuridis):** Pemisahan wewenang `admin_notaris`, `admin_ppat`, `admin_keuangan`, `staf_notaris`, `staf_ppat`, dan `user` (pemohon/klien), serta keamanan sesi maks. 3 perangkat aktif.
  - **Buku Register Berkas Terpadu & Master Layanan:** Katalog tarif dan tahapan dengan *Snapshot Deep-Copy* (penyesuaian khusus berkas tidak merusak master), penomoran otomatis `NOT-YYYY-XXXX` / `PPAT-YYYY-XXXX`, papan kerja **Kanban & pelacakan progres 0–100%**, otorisasi penyelesaian berkas khusus Pejabat, **pelacakan lokasi arsip fisik** (Map, Box, Rak, Baris), serta **upload & pratinjau langsung dokumen** hingga 15MB (Salinan Minuta, Persyaratan Warkah, Berkas Tambahan).
  - **Keuangan Dual-Pocket & Escrow Pajak/PNBP:** Memisahkan mutlak rekening **Honorarium Kantor** dari **Escrow Titipan Pajak & PNBP** (BPHTB, PPh Final, PNBP BPN, PNBP AHU, Fidusia, PPh/PPN Jasa) dengan pelindung saldo *underflow*, sinkronisasi status piutang otomatis (`Belum Bayar → Termin → Lunas`), pencatatan setor pajak ber-**NTPN / Bapenda**, **cetak Kuitansi & Invoice A4 resmi** ber-terbilang otomatis (`KWT/BKK-YYYY-XXXX`), serta **ekspor CSV in-memory** aman CWE-1236.
- **SIM-PQTM — Modul LTQ & Agenda Hafalan (Yayasan Pendidikan Qur'an Thaifah Manshurah / PQTM):** Mengembangkan sistem manajemen hafalan Al-Qur'an berbasis **Laravel 13 Sanctum** dan **Svelte 5** yang berfokus pada modul LTQ: pengelolaan halaqah & Rumah Tahfidz (validasi anti-konflik anggota per tahun ajaran + fitur **ustadzah badal**/pengganti), buku **jurnal setoran harian tahfidz** (4 sesi: *Ziyadah, Muraja'ah, Talaqqi*) & **tahsin** lengkap dengan input massal atomik, **ujian tasmi' 1–30 juz** dengan bobot nilai dinamis & approval penerbitan nomor syahadah, serta **portal pantau wali santri** real-time dan proteksi akses per halaqah (*BOLA defense*, tervalidasi 6 test suite LTQ).
- **Optimasi Server & Kualitas Kode:** Mencegah error koneksi macet (*Error 1040 / Too Many Connections*) pada shared hosting kuota 25 koneksi MySQL (`L <= 0.16`, `SESSION_DRIVER=file` NVMe lokal, Inode GC atomik, latensi rata-rata `~65ms`), serta memverifikasi kualitas dengan **121 automated tests (1.148 assertions)** pada SIM Notaris & PPAT (**250+ automated tests** lintas proyek).

### 2. TU & Bendahara (IT Support & Operasional Sekolah) | SMKS Taruna Bhakti Malang *(Juli 2025 – Juli 2026)*
- **Jaringan MikroTik:** Mengoptimalkan internet **300–400 Mbps** untuk **60+ pengguna** via MikroTik hEX RB750Gr3 (QoS Simple Queue, CIR 3M Up / 2M Down) agar koneksi stabil tanpa macet saat jam sibuk.
- **Perawatan PC & LAN Printer Sharing:** Merawat PC spesifikasi rendah (Intel Celeron, RAM 4GB), backup berkala, serta membangun **LAN printer sharing terpusat** yang memangkas biaya pengadaan printer **100%**.
- **Keuangan, Portal Dinas & Transisi:** Mengelola pembukuan dana **BOS, PIP, dan Prasejahtera**, menjaga **100% validitas data** di portal dinas (**Dapodik, Datadik, e-Ijazah**, ANBK, Sulinjar, TKA, KSP, Siredi, IJOP), dan menuntaskan 100% administrasi masa transisi tanpa dokumen serah terima.

### 3. Back End Developer & Technical Project Manager | Ar-Rohmah Putri IBS *(Juni 2021 – Januari 2025)*
- **Migrasi 12.117 Data (0% Data Loss):** Membersihkan dan memigrasikan **12.117 data** (800 calon santri, 9.312 santri lama, 2.005 pegawai) dari SQL dan Excel lama ke MySQL baru, menuntaskan selisih pencatatan Humas dan Keuangan.
- **Ekosistem SIM, PPDB & HRIS 3 Kampus:** Membangun backend **Laravel Passport (OAuth 2.0)** dan **MySQL (3NF)** untuk **>10.000 pengguna**, menyatukan 3 kampus (Baby School – SMA), serta memasang notifikasi WhatsApp & Email Gateway.
- **Otomasi Format Penomoran Virtual Account & Digitalisasi HRIS:** Merancang otomatisasi format penomoran Virtual Account pada PPDB yang selaras dengan nomor VA riil manual di bank/keuangan, memimpin penyelesaian proyek (PPDB 3+2 bulan, Santri/Pegawai 6 bulan), dan mendigitalkan formulir cuti, izin belajar, kontrak, hingga PHK.

---

## 6. STUDI KASUS UNGGULAN: PIPELINE ETL & DASHBOARD KPI EXCEL

- **Pipeline Data & Dashboard KPI Microsoft Excel** (interaktif & tersedia unduh `.xlsx` di `https://misbahudin98.github.io/`):
  - **Workbook 5 Tab (100% Formula Standar tanpa Mengubah Data Mentah):** `1_Raw_Data_Mentah` → `2_Master_Referensi` (3NF / Star Schema) → `3_Data_Bersih_ETL` (`PROPER`, `TRIM`, `VLOOKUP`, `COUNTIF`, format VA, Data Validation, Conditional Formatting) → `4_Dashboard_Visual` (`SUMIFS`, `COUNTIFS`, grafik tren bulanan & unit).
  - **Hasil:** Memproses **60 log transaksi** → **55 data valid (91,7%)**, mengisolasi **5 anomali** (3 duplikat & 2 kode unit salah `UNT-99`), dan merekonsiliasi **Realisasi Rp 742.600.000** serta **Piutang Aktif Rp 51.600.000**.

---

## 7. PENDIDIKAN

- **Politeknik Negeri Malang (2016 – 2020):** D4 / Sarjana Terapan (Setara S1) – Teknik Informatika (`S.Tr.Kom.`), **IPK 3.32 / 4.00** (153 SKS, Sangat Memuaskan, Terakreditasi A BAN-PT & ASIC-UK). PKL di **PT. DELIV TEHNOLOGI INDORAYA (Nilai A)**.
- **SMKN 2 Singosari (2013 – 2016):** Teknik Komputer dan Jaringan (TKJ).
