# Rubrik Kualitas Portofolio Pengembang Web Internasional
> **Skala Penilaian:** 0 - 100 Poin (5 Dimensi Utama)  
> **Standar:** W3C Semantic & WCAG 2.2 AA, Google Core Web Vitals, Nielsen Norman Group (NN/g 6s Scan), GSAP 60fps Motion Engineering.

---

## TINGKAT KELAYAKAN (TIERING STANDARD)
* **Tier 1 — Elite World-Class (88 - 100 Poin):** Lolos parsing ATS dengan skor sempurna, navigasi HRD tanpa friksi dalam 6 detik, animasi GSAP sehalus sutra 60fps di GPU compositor, ramah disabilitas (reduced-motion), dan siap cetak PDF.
* **Tier 2 — Solid Professional (75 - 87 Poin):** Konten kuat dan ATS-compliant, namun memiliki animasi minor yang belum ramah reduced-motion atau struktur print preview kurang optimal.
* **Tier 3 — Candidate At Risk (60 - 74 Poin):** Memiliki masalah pada pemuatan awal, tidak ada data terstruktur JSON-LD, atau animasi menyebabkan layout thrashing.
* **Tier 4 — Unusable / Slop (< 60 Poin):** Animasi memblokir konten, teks tersembunyi di canvas/grafik, tanpa tautan kode nyata, atau crash saat diekspor.

---

## 5 DIMENSI EVALUASI PORTOFOLIO

### 1. DIMENSI 1: ATS MACHINE READABILITY & STRUCTURED DATA (Bobot: 20 Poin)
| Skor | Kriteria Evaluasi |
| :---: | :--- |
| **18-20** | Memiliki Schema.org JSON-LD lengkap (`Person`, `jobTitle`, `knowsAbout`, `sameAs`), HTML5 semantic murni (`header`, `main`, `section`, `article`, `footer`), hierarki heading teratur (`h1` tunggal, `h2`, `h3`), dan seluruh teks dapat di-parse mesin tanpa ketergantungan JavaScript. |
| **14-17** | Semantic HTML5 lengkap dan teratur, namun JSON-LD belum lengkap atau masih kekurangan properti relasi `sameAs`/`knowsAbout`. |
| **9-13** | Didominasi oleh `<div>` soup tanpa semantic tag yang tepat, atau teks penting disematkan di dalam gambar/SVG tanpa `alt` dan `aria-label`. |
| **0-8** | Teks inti dirender di dalam Canvas atau dimuat secara terenkripsi; parser ATS mendeteksi dokumen sebagai halaman kosong. |

---

### 2. DIMENSI 2: HRD COGNITIVE 6-SECOND SCAN & ABOVE-THE-FOLD (Bobot: 25 Poin)
| Skor | Kriteria Evaluasi |
| :---: | :--- |
| **23-25** | Dalam 6 detik pertama tanpa scroll, HRD langsung melihat: Nama, Spesialisasi utama, status *Available for Hire*, tombol unduh resume/PDF, dan metrik dampak utama. Zero intro loader (FCP < 1.0s). Tipografi hirarkis dengan pemformatan scannable (bold keywords, bullets). |
| **18-22** | Informasi esensial hadir di atas lipatan layar, namun tombol unduh resume atau status ketersediaan kurang menonjol (*low visual hierarchy*). |
| **11-17** | Terlalu banyak teks bertele-tele di area hero, tidak ada metrik dampak terukur, atau membutuhkan scroll panjang sebelum recruiter mengerti spesialisasi pelamar. |
| **0-10** | Terdapat splash screen/intro animation yang mengunci layar lebih dari 1 detik; tidak ada tautan kontak atau resume yang langsung terlihat. |

---

### 3. DIMENSI 3: PROOF OF WORK & CASE STUDY DEPTH (Bobot: 20 Poin)
| Skor | Kriteria Evaluasi |
| :---: | :--- |
| **18-20** | Setiap proyek memuat: Judul & masalah nyata yang diselesaikan, teknologi kunci (*tech stack tags*), metrik hasil terukur (metode STAR / Google XYZ), tautan aktif ke **Live Demo** dan **Source Code (GitHub)** dengan badge status repositori yang jujur. |
| **14-17** | Proyek menampilkan screenshot dan tech stack yang rapi, namun kurang penjelasan dampak numerik (*quantifiable impact*) atau hanya menyertakan salah satu tautan (hanya demo tanpa repo). |
| **8-13** | Proyek hanya berupa portofolio tutorial (Todo App murni, kalkulator biasa) tanpa sentuhan arsitektur nyata atau kasus dunia nyata. |
| **0-7** | Tautan demo atau repo rusak (404), proyek tidak dapat diakses, atau hanya berupa gambar statis tanpa penjelasan teknis. |

---

### 4. DIMENSI 4: GSAP MOTION & COMPOSITOR PERFORMANCE (Bobot: 20 Poin)
| Skor | Kriteria Evaluasi |
| :---: | :--- |
| **18-20** | Seluruh animasi GSAP berjalan di compositor thread (`transform: translate3d/scale/rotate`, `opacity`). Zero layout thrashing (tidak menganimasikan `top/left/width/height`). ScrollTrigger menggunakan scrub/stagger alami tanpa scroll-jacking. Scrollbar dan scrolling terasa native dan responsif (60-120fps). |
| **14-17** | Animasi halus dan estetis, namun terdapat sedikit kalkulasi layout berulang pada resize atau durasi animasi hover sedikit terlalu lambat (> 0.4s). |
| **8-13** | Terdapat scroll-jacking buatan yang memperlambat laju mouse wheel recruiter, atau animasi sedikit patah-patah di perangkat mobile. |
| **0-7** | Animasi memicu lonjakan CPU/GPU ekstrem, terjadi reflow brutal, atau animasi macet saat scroll cepat. |

---

### 5. DIMENSI 5: ACCESSIBILITY (WCAG 2.2) & PRINT STYLESHEET (Bobot: 15 Poin)
| Skor | Kriteria Evaluasi |
| :---: | :--- |
| **14-15** | Mendukung penuh `prefers-reduced-motion` (animasi non-esensial dinonaktifkan otomatis). Kontras warna teks memenuhi WCAG AA (≥ 4.5:1). Navigasi keyboard memiliki focus ring jelas. Memiliki `@media print` sempurna yang mengubah halaman menjadi CV PDF 1-2 lembar bersih tanpa background/animasi. |
| **10-13** | Kontras warna bagus dan print stylesheet ada, namun belum mengimplementasikan deteksi `prefers-reduced-motion` di JavaScript. |
| **5-9** | Tidak ada print stylesheet (hasil cetak/PDF berantakan dengan tombol navbar dan background gelap bertumpuk), kontras teks redup sulit dibaca. |
| **0-4** | Navigasi keyboard terperangkap (*focus trap*), warna teks tidak kontras, dan menyebabkan motion sickness bagi pengguna sensitif. |
