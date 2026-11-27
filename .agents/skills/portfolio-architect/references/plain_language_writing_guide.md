# Panduan Penulisan Lugas, Humanis & Ramah Pembaca Awam (Plain Language & JD Tailoring)
> **Referensi Kredibel Internasional:**
> - **ISO 24495-1:2023 (*Plain Language Standard*):** Pembaca wajib dapat menemukan (*find*), memahami (*understand*), dan menggunakan (*use*) informasi pada pembacaan pertama.
> - **GOV.UK Content Design & PlainLanguage.gov:** Kalimat aktif, kata kerja umum yang konkret, hindari *nominalisasi* kaku, dan prioritaskan kejelasan di atas kepintaran kosakata.
> - **Nielsen Norman Group (NN/g) — *Inverted Pyramid* & *Concise Web Writing*:** Taruh kesimpulan/manfaat di kata-kata pertama; pembaca web hanya membaca 20–28% kata di halaman.
> - **Barbara Minto (*The Minto Pyramid Principle*):** Mulai dari jawaban/dampak utama, baru jelaskan detail pendukung.
> - **William Zinsser (*On Writing Well*) & Strunk & White:** *"Omit needless words"* — pangkas kata pengisi tanpa mengorbankan kehangatan manusiawi.
> - **Feynman Technique:** Jika sebuah konsep teknis tidak bisa dijelaskan secara sederhana kepada orang awam, artinya kalimat tersebut masih terlalu rumit untuk portofolio.

---

## 1. LIMA PILAR TULISAN SINGKAT, PADAT, JELAS & HUMANIS

1. **Pola Piramida Terbalik (*Result First, Tech Second*):**
   - Letakkan **apa masalah yang selesai** atau **manfaat bagi tim/pengguna** di awal kalimat, baru sebutkan alat/teknologinya.
   - *Rumus:* `[Manfaat Nyata / Aksi Konkret] + [Angka Bukti] + [Alat / Kata Kunci Lowongan secara natural]`.
2. **Aturan 12–20 Kata & 1 Kalimat = 1 Gagasan:**
   - Jika kalimat melebihi 22 kata atau memakai lebih dari 2 koma penjelas, pecah menjadi dua kalimat atau daftar poin (*bullet*).
   - Batasi paragraf deskripsi maksimal **3 baris** di layar desktop.
3. **Jembatan Awam–Teknis (*Feynman Bridge*):**
   - Pembaca HRD atau pemilik usaha belum tentu memahami *Error 1040*, *3NF*, atau *QoS Simple Queue* secara langsung.
   - Selalu pasangkan istilah teknis dengan arti nyatanya:
     - *Bukan:* `"Mengoptimasi koneksi MySQL Error 1040 dengan tuning session."`
     - *Melainkan:* `"Mencegah aplikasi macet saat dipakai bersamaan di server hemat biaya (mengatasi Error 1040 MySQL)."`
4. **Kata Kerja Manusiawi vs. Bahasa Robot/Brosur:**
   - Gunakan kata kerja nyata sehari-hari: **merapikan, mempercepat, memisahkan, menjaga, memangkas, memandu, memastikan**.
   - **Dilarang Keras (AI/Corporate Slop):** *passionate, hardworking, fast learner, synergy, leverage, cutting-edge, holistic, world-class, revolusioner, mengoptimalkan secara menyeluruh*.
5. **Nada Hangat-Profesional (Humanis Tanpa Bertele-tele):**
   - Tunjukkan dampak kerja bagi orang lain (staf keuangan, guru, santri, klien notaris, atau pengguna akhir), bukan sekadar memamerkan daftar teknologi.

---

## 2. TABEL TRANSFORMASI: JARGON KAKU -> RAMAH AWAM, HUMANIS & LOLOS ATS

| Domain | ❌ Terlalu Teknis / Kaku / Panjang | ✅ Singkat, Padat, Ramah Awam & Tetap ATS-Ready |
| :--- | :--- | :--- |
| **Data & Excel** | *"Melakukan ekstraksi, transformasi, dan normalisasi 12.117 record heterogen dari SQL/Excel ke dalam skema relasional 3NF tanpa anomali."* | *"Merapikan dan memindahkan **12.117 data** lama dari Excel dan SQL ke database baru yang rapi (**MySQL 3NF**) dengan **0% data hilang**."* |
| **Backend & Web** | *"Mengimplementasikan dual-pocket ledger system untuk segregasi akun operasional dan escrow tax NTPN pada kantor Notaris & PPAT."* | *"Membangun sistem kantor Notaris (**Laravel & Svelte**) yang memisahkan uang operasional kantor dari titipan pajak negara (**PPh & BPHTB**) agar siap audit."* |
| **IT Support & Jaringan** | *"Mengonfigurasi router MikroTik hEX RB750Gr3 dengan QoS Simple Queue CIR 3M/2M untuk mitigasi bufferbloat pada 60+ concurrent clients."* | *"Menata pembagian bandwidth internet (**MikroTik QoS**) agar **60+ pengguna** tetap lancar bekerja tanpa putus saat jam sibuk."* |
| **Administrasi & Keuangan** | *"Mengelola rekonsiliasi data multi-entitas portal dinas pendidikan dan akuntabilitas dana BOS/PIP dengan akurasi 100%."* | *"Menjaga data sekolah di portal dinas (**Dapodik & e-Ijazah**) tetap **100% valid**, sekaligus merapikan pembukuan dana **BOS dan PIP**."* |

---

## 3. PROTOKOL PENYISIPAN KATA KUNCI LOWONGAN KERJA (*JD KEYWORD TAILORING*)

Ketika pengguna memberikan deskripsi lowongan kerja (*Job Description / JD*) untuk menyesuaikan teks portofolio atau ringkasan profil:

### Langkah 1: Ekstrak 3 Lapisan Kata Kunci dari Lowongan
1. **Lapisan Alat & Teknis (*Hard Skills*):** Misal `Microsoft Excel (VLOOKUP, Pivot Table)`, `MySQL`, `Laravel`, `MikroTik`, `Troubleshooting`.
2. **Lapisan Proses Kerja (*Workflow/Domain*):** Misal `Data Entry`, `Rekonsiliasi Laporan`, `Dokumentasi SOP`, `Ticketing / IT Support`, `Administrasi Kantor`.
3. **Lapisan Hasil Bisnis (*Outcome*):** Misal `Akurasi Data`, `Efisiensi Waktu`, `Kepatuhan Audit`, `Kestabilan Operasional`.

### Langkah 2: Sisipkan di 3 Zona Prioritas (Organik, Bukan Daftar Kosong)
* **Zona 1 — Sub-judul & Ringkasan Hero:** Masukkan 2–3 kata kunci jabatan & keahlian utama dari lowongan.
* **Zona 2 — Poin Pengalaman Kerja:** Ganti atau perjelas 1–2 frasa agar memakai istilah persis yang dicari perusahaan (contoh: ubah *"input massal"* menjadi *"entri dan verifikasi data massal"* jika JD mencari **Data Entry & Verifikasi**).
* **Zona 3 — Tag Stack Proyek:** Sesuaikan urutan pil teknologi agar yang paling relevan dengan lowongan berada di posisi paling kiri.

### Langkah 3: Aturan Anti-*Keyword Stuffing*
* Maksimal **2 istilah teknis/kata kunci** per kalimat.
* Setiap kata kunci wajib menempel pada **kata kerja aksi + hasil nyata** — jangan hanya menuliskan deretan kata benda tanpa konteks.

### Contoh Adaptasi Satu Pengalaman untuk 3 Lowongan Berbeda:
* **Target Lowongan A — IT Support / IT Operations:**
  *"Menjaga koneksi internet **MikroTik** untuk **60+ pengguna** tetap stabil, merawat PC spesifikasi rendah, serta membangun sistem **printer sharing jaringan** yang menghemat **100%** biaya beli printer baru."*
* **Target Lowongan B — Data Entry / Admin Keuangan & Excel:**
  *"Membersihkan, memvalidasi, dan mencocokkan **12.117 data** lintas unit menggunakan **Microsoft Excel (VLOOKUP, SUMIFS, Pivot Table)** hingga akurasi laporan keuangan dan administrasi mencapai **100%**."*
* **Target Lowongan C — Full Stack / Backend Developer:**
  *"Membangun aplikasi web **Laravel & MySQL (3NF)** dengan autentikasi **OAuth 2.0**, sistem **Virtual Account** otomatis, dan **250+ pengujian otomatis PHPUnit** untuk melayani **10.000+ pengguna**."*

---

## 4. CHECKLIST UJI BACA 5 DETIK (LAYMAN & HRD COMPREHENSION GATE)

Sebelum menyimpan atau memublikasikan tulisan portofolio/CV, pastikan seluruh butir berikut terpenuhi:
- [ ] **Paham Sekali Baca:** Orang di luar bidang IT (HRD, admin, atau manajer non-teknis) langsung mengerti apa yang dikerjakan dan hasilnya dalam 5 detik.
- [ ] **Pendek & Bernapas:** Kalimat rata-rata 12–20 kata; tidak ada paragraf padat > 3–4 baris.
- [ ] **Istilah Teknis Terjembatani:** Setiap istilah teknis/akronim memiliki konteks manfaat yang jelas.
- [ ] **Humanis & Bebas Klise:** Terasa ditulis oleh profesional nyata; nol kata klise (*passionate, synergy, dynamic, cutting-edge*).
- [ ] **Selaras Lowongan (Jika Ada JD):** 5–10 kata kunci inti dari lowongan masuk secara natural ke kalimat bukti kerja tanpa merusak kelancaran baca.
