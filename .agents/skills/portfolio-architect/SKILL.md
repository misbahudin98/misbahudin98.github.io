---
name: portfolio-architect
description: >-
  Audits, refines, and builds developer portfolios for ATS Schema, HRD 6-second scan, 60fps
  GSAP motion, and WCAG 2.2 accessibility. Triggered by '@portfolio', '@portfolio-architect', or
  portfolio UI/UX and project requests. Excludes general AI prompt crafting or agent governance.
---

# Portfolio Architect: International Engineering & Usability Engine
> **Standar Internasional:** W3C Semantic HTML5 & WCAG 2.2 AA, Nielsen Norman Group (NN/g 6-Second Scan), Google Core Web Vitals (FCP/INP/CLS), GSAP Compositor Performance Standards.

Keahlian (*skill*) ini dirancang khusus untuk memastikan website portofolio pengembang perangkat lunak memenuhi standar kelas dunia: ramah bagi parser mesin (ATS), memikat bagi recruiter manusia (HRD), dan memamerkan kemampuan rekayasa visual yang elegan tanpa mengorbankan performa perangkat.

---

## 1. PANDUAN REFERENSI CEPAT (PROGRESSIVE DISCLOSURE)

Rujuk berkas modular berikut saat mengeksekusi tugas khusus:
* **Rubrik Penilaian Lengkap (0-100 Poin):** [`references/portfolio_rubric.md`](./references/portfolio_rubric.md)
* **Panduan UI/UX Web3, Motion & Responsive:** [`references/web3_motion_responsive_guide.md`](./references/web3_motion_responsive_guide.md)
* **Katalog Desain & Resep Motion:** [`references/design_and_motion_archetypes.md`](./references/design_and_motion_archetypes.md)
* **Formula Executive Summary (Standar Harvard & Google):** [`references/executive_summary_formula.md`](./references/executive_summary_formula.md)
* **Panduan Penulisan Lugas, Humanis & Ramah Awam (ISO 24495-1 + JD Keywords):** [`references/plain_language_writing_guide.md`](./references/plain_language_writing_guide.md)
* **Template Studi Kasus Proyek (STAR / Google XYZ):** [`references/case_study_template.md`](./references/case_study_template.md)
* **Contoh Studi Kasus Emas (Benchmark):** [`examples/portfolio_case_study_example.md`](./examples/portfolio_case_study_example.md)
* **Skrip Auditor Otomatis (PowerShell):** [`scripts/audit-portfolio.ps1`](./scripts/audit-portfolio.ps1)
* **Aturan Invariant Proyek (Wajib Patuh):** [`.agents/rules/portfolio_invariants.md`](../../rules/portfolio_invariants.md)
* **Memori Master CV & Proyek Lokal (SSoT):** [`docs/cv_memory_ssot.md`](../../../docs/cv_memory_ssot.md)

---

## 2. WORKFLOW 1: MENJALANKAN AUDIT & BENCHMARK PORTOFOLIO

Gunakan alur kerja ini ketika pengguna meminta review atau evaluasi portofolio.

### Langkah 1: Jalankan Skrip Auditor Otomatis
Eksekusi skrip audit dari terminal untuk mendapatkan skor awal:
```powershell
.\.agents\skills\portfolio-architect\scripts\audit-portfolio.ps1 -Path "index.html"
```

### Langkah 2: Evaluasi 5 Dimensi Internasional
Lengkapi temuan otomatis dengan analisis kualitatif berdasarkan [`references/portfolio_rubric.md`](./references/portfolio_rubric.md):
1. **ATS Machine Readability (Bobot: 20)**: Kelengkapan Schema.org JSON-LD, keaslian semantic tag, dan selektabilitas teks.
2. **HRD 6-Second Scan UX (Bobot: 25)**: Kekuatan *Above-the-fold*, kejelasan tombol unduh resume/CV, visibilitas kontak, dan ketiadaan blocking intro.
3. **Proof of Work & Case Study (Bobot: 20)**: Keberadaan Live Demo aktif, tautan repositori GitHub, dan metrik dampak numerik.
4. **GSAP Motion & Performance (Bobot: 20)**: Penggunaan GPU compositor (`transform`, `opacity`), ketiadaan *layout thrashing*, dan kelancaran scroll.
5. **Accessibility & Print Support (Bobot: 15)**: Dukungan `prefers-reduced-motion` dan kerapian layout saat dicetak (`@media print`).

### Langkah 3: Sajikan Laporan Terstruktur
Sajikan hasil audit dalam bentuk:
* Tabel skor per dimensi (Total 100).
* Predikat Tier (Tier 1 s/d Tier 4).
* Daftar Quick Wins (Perbaikan Cepat) dan Strategic Enhancements.

---

## 3. WORKFLOW 2: SINTESIS STUDI KASUS PROYEK BARU

Gunakan alur kerja ini ketika pengguna ingin menambahkan proyek baru ke dalam portofolio.

1. **Gunakan Formula STAR & Google XYZ:**
   Tuliskan deskripsi proyek mengikuti panduan di [`references/case_study_template.md`](./references/case_study_template.md).
   - *Formula:* "Mencapai [Hasil Terukur X] dengan menerapkan [Arsitektur/Tech Stack Y] untuk menyelesaikan [Tantangan Bisnis Z]".
2. **Terapkan Bahasa Lugas, Ramah Awam & Humanis:**
   Ikuti [`references/plain_language_writing_guide.md`](./references/plain_language_writing_guide.md) (ISO 24495-1): kalimat aktif 12–20 kata, jelaskan manfaat teknis dalam bahasa sehari-hari (*Feynman Bridge*), dan hindari klise robotik.
3. **Kelompokkan & Sisipkan Tag Taksonomi ATS / Kata Kunci Lowongan:**
   Sertakan kata kunci teknis yang dicari bot ATS serta sesuaikan secara organik dengan 5–10 kata kunci lowongan kerja (*JD alignment*) tanpa *keyword stuffing*.
4. **Sediakan Tautan Ganda Kredibel:**
   - Wajib ada tautan **Live Demo** atau interaktif preview.
   - Wajib ada tautan **GitHub Repository** dengan keterangan lisensi atau status repositori.

---

## 4. WORKFLOW 3: OPTIMASI GSAP MOTION & ACCESSIBILITY (HARDENING)

Gunakan alur kerja ini saat memoles atau mengimplementasikan animasi interaktif.

1. **Terapkan Invariant GPU Compositor:**
   Pastikan setiap baris animasi GSAP dan efek kursor hanya menyentuh `transform` (`x`, `y`, `scale`, `rotation`, `translate3d`) dan `opacity`. Ganti animasi `width/height` menjadi `scaleX/scaleY`, serta hindari `top`/`left` CSS variables pada spotlight hover.
2. **Wajib Dukung `prefers-reduced-motion`:**
   ```javascript
   const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
   if (!prefersReducedMotion) {
     // Jalankan efek stagger, rolling counters, dan ScrollTrigger
   } else {
     // Lewatkan animasi, set status akhir instan
   }
   ```
3. **Higienitas Fokus & Pembersihan ScrollTrigger (WCAG 2.2):**
   Pastikan tautan *Skip-to-Content* (`#main-content`), gaya `:focus-visible`, pengembalian fokus modal lightbox saat ditutup, serta manajemen `ScrollTrigger` tanpa double-registration listener tetap terjaga.

---

## 5. WORKFLOW 4: SINTESIS EXECUTIVE & HERO SUMMARY (STANDAR HARVARD & GOOGLE)

Gunakan alur kerja ini ketika pengguna ingin merumuskan atau memperbarui ringkasan profil karirnya.

1. **Kompilasi Agregat Karir:**
   Kumpulkan seluruh riwayat pekerjaan, proyek, dan pencapaian ke dalam lembar kerja di [`references/executive_summary_formula.md`](./references/executive_summary_formula.md).
2. **Terapkan Struktur 4 Pilar:**
   - *Pilar 1 (Anchor):* Identitas profesional + jam terbang spesifik.
   - *Pilar 2 (Stack):* Tanda tangan arsitektur teknis dan ekosistem spesialisasi.
   - *Pilar 3 (Impact):* Metrik skala kumulatif karir terbesar (data/users/uptime).
   - *Pilar 4 (Trajectory):* Arah masalah bisnis & performa yang siap dituntaskan.
3. **Audit Anti-Slop & Uji Baca Awam (Harvard + ISO 24495-1):**
   - Pastikan tidak ada kata ganti orang pertama (*saya, aku, I, me, my*) pada ringkasan eksekutif formal.
   - Pastikan tidak ada kata sifat tanpa data (*passionate, hardworking, fast learner, synergy*).
   - Terapkan [`references/plain_language_writing_guide.md`](./references/plain_language_writing_guide.md): kalimat singkat (12–20 kata), istilah teknis terjembatani manfaatnya bagi pembaca awam/HRD, nada humanis, dan sisipkan kata kunci spesifik lowongan kerja (*JD*) jika tersedia.
4. **Verifikasi Sinkronisasi Tri-Level (SSoT):**
   Sinkronkan hasil rumusan ke:
   - `<section id="hero">` teks visual (DOM).
   - `<meta name="description">` dan `<meta property="og:description">`.
   - Schema.org JSON-LD properti `"description"`.

---

## 6. WORKFLOW 5: PENGAYAAN ESTETIKA & RESEP MOTION (DESIGN & MOTION ENGINEERING)

Gunakan alur kerja ini ketika pengguna ingin mengubah gaya visual, menyusun ulang kartu dengan tata letak baru, atau menambahkan efek interaksi animasi.

1. **Pemilihan Arketipe Desain:**
   Pilih salah satu arketipe dari [`references/design_and_motion_archetypes.md`](./references/design_and_motion_archetypes.md) sesuai target audiens:
   - *Warm Swiss Architectural Blueprint (Standar Produksi Aktif):* Kanvas kertas hangat `#F6F4EF`, Navy `#1B365D`, Copper `#B45309`, `tabular-nums`, dan grid editorial 12 kolom.
   - *Dark Obsidian / Linear-Vercel Tech:* Untuk software engineer, devtools, dan B2B enterprise.
   - *Bento Grid Layout:* Untuk visualisasi fitur modular dan kartu proyek kaya dimensi.
   - *Swiss Typographic Style:* Untuk keterbacaan teks murni, arsitektur sistem, dan dokumentasi.
   - *Neo-Brutalism:* Untuk kesan independen, berani, dan berkarakter kuat.
   - *Warm Editorial:* Untuk portofolio riset komputasi, tulisan teknis, dan institusi akademik.
2. **Implementasi Resep Motion (Compositor-Safe):**
   Gunakan resep baku yang terbukti aman terhadap Core Web Vitals:
   - *Spotlight Cards (`translate3d`)* dengan proteksi `(hover: hover)` + `requestAnimationFrame`.
   - *Magnetic Buttons* dengan fisika GSAP elastis.
   - *Staggered Entrance* dengan durasi 0.3s - 0.5s dan jeda stagger 0.05s - 0.08s.
   - *Animated Counters (`tabular-nums`)* dengan bypass instan saat `prefers-reduced-motion` aktif.
3. **Pengujian Kepatuhan Invariant:**
   - Pastikan hanya menggunakan `transform` dan `opacity` (bebas reflow layout, nol `top`/`left` dinamis).
   - Pastikan penanganan `window.matchMedia('(prefers-reduced-motion: reduce)')`, Skip-to-Content, `:focus-visible`, dan sinkronisasi `design.md` aktif.
   - Jalankan `audit-portfolio.ps1` untuk memastikan skor tetap Tier 1 (100/100).
