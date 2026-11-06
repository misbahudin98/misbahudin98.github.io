---
name: portfolio-architect
description: >-
  Audits, evaluates, refines, and synthesizes international-grade developer portfolio websites
  that balance ATS-friendliness (Schema.org, Semantic HTML, Clean Print PDF), HRD 6-second scan
  usability (Above-the-fold clarity, STAR proof of work), and 60fps GSAP motion performance
  (compositor-only transforms, prefers-reduced-motion, zero layout thrashing).
  Triggered by tags '@portfolio', '@portfolio-architect', or whenever the user asks to review,
  audit, benchmark, or add projects to their portfolio.
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
* **Template Studi Kasus Proyek (STAR / Google XYZ):** [`references/case_study_template.md`](./references/case_study_template.md)
* **Contoh Studi Kasus Emas (Benchmark):** [`examples/portfolio_case_study_example.md`](./examples/portfolio_case_study_example.md)
* **Skrip Auditor Otomatis (PowerShell):** [`scripts/audit-portfolio.ps1`](./scripts/audit-portfolio.ps1)
* **Aturan Invariant Proyek (Wajib Patuh):** [`.agents/rules/portfolio_invariants.md`](../../rules/portfolio_invariants.md)

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
2. **Kelompokkan Tag Taksonomi ATS:**
   Sertakan kata kunci teknis yang dicari oleh bot pencari kerja (misal: *OAuth 2.0, ETL Pipelines, RESTful API, Tailwnd CSS, MySQL Normalization*).
3. **Sediakan Tautan Ganda Kredibel:**
   - Wajib ada tautan **Live Demo** atau interaktif preview.
   - Wajib ada tautan **GitHub Repository** dengan keterangan lisensi atau status repositori.

---

## 4. WORKFLOW 3: OPTIMASI GSAP MOTION & ACCESSIBILITY (HARDENING)

Gunakan alur kerja ini saat memoles atau mengimplementasikan animasi interaktif.

1. **Terapkan Invariant GPU Compositor:**
   Pastikan setiap baris animasi GSAP hanya menyentuh `transform` (`x`, `y`, `scale`, `rotation`) dan `opacity`. Ganti animasi `width/height` menjadi `scaleX/scaleY`.
2. **Wajib Dukung `prefers-reduced-motion`:**
   ```javascript
   const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
   if (!prefersReducedMotion) {
     // Jalankan efek stagger dan ScrollTrigger
   } else {
     // Lewatkan animasi, set status akhir instan
   }
   ```
3. **Pembersihan ScrollTrigger:**
   Pastikan tidak ada double-registration listener saat navigasi berpindah halaman atau resize dinamis.

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
3. **Audit Anti-Slop (Harvard Checklist):**
   - Pastikan tidak ada kata ganti orang pertama (*saya, aku, I, me, my*).
   - Pastikan tidak ada kata sifat tanpa data (*passionate, hardworking, fast learner*).
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
   - *Dark Obsidian / Linear-Vercel Tech:* Untuk software engineer, devtools, dan B2B enterprise.
   - *Bento Grid Layout:* Untuk visualisasi fitur modular dan kartu proyek kaya dimensi.
   - *Swiss Typographic Style:* Untuk keterbacaan teks murni, arsitektur sistem, dan dokumentasi.
   - *Neo-Brutalism:* Untuk kesan independen, berani, dan berkarakter kuat.
   - *Warm Editorial:* Untuk portofolio riset komputasi, tulisan teknis, dan institusi akademik.
2. **Implementasi Resep Motion (Compositor-Safe):**
   Gunakan resep baku yang terbukti aman terhadap Core Web Vitals:
   - *Spotlight Cards* untuk efek hover interaktif.
   - *Magnetic Buttons* dengan fisika GSAP elastis.
   - *Staggered Entrance* dengan durasi 0.3s - 0.5s dan jeda stagger 0.05s - 0.08s.
   - *Animated Counters* untuk pembuktian metrik skala numerik.
3. **Pengujian Kepatuhan Invariant:**
   - Pastikan hanya menggunakan `transform` dan `opacity` (bebas reflow layout).
   - Pastikan penanganan `window.matchMedia('(prefers-reduced-motion: reduce)')` aktif.
   - Jalankan `audit-portfolio.ps1` untuk memastikan skor tetap Tier 1 (100/100).
