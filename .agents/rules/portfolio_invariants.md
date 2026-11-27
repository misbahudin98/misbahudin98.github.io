# Portfolio Engineering & Quality Invariants (portfolio_invariants.md)
> **Standard:** International Developer Portfolio Standards v2.1 — Nielsen Norman Group (NN/g 6-Second Scan & Layer-Cake Scanning), Baymard Institute (Focus & Modal Ergonomics), W3C WCAG 2.2 AA/AAA, Google Core Web Vitals (LCP < 2.5s, INP < 200ms, CLS < 0.1), Josef Müller-Brockmann (Swiss Grid), Edward Tufte (High Data-to-Ink Ratio).  
> **Target Scope:** Seluruh modifikasi kode HTML, CSS, JavaScript, dan konten di dalam repositori portofolio ini.

---

## 1. INVARIANT ATS & MACHINE PARSING (TIDAK DAPAT DINEGOSIASIKAN)
1. **Schema.org JSON-LD Wajib:**
   - Tag `<script type="application/ld+json">` dengan tipe `@type: "Person"` dan/atau `"ProfilePage"` wajib dipertahankan di dalam `<head>`.
   - Wajib mencantumkan minimal: `name`, `jobTitle`, `url`, `sameAs` (GitHub & LinkedIn), dan entitas `knowsAbout`.
2. **Semantic DOM Hierarchy:**
   - Struktur dokumen wajib menggunakan semantic HTML5 (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`).
   - Hirarki heading wajib bertingkat logis: tepat satu `<h1>` utama di atas lipatan layar (*above-the-fold*), diikuti `<h2>` untuk setiap seksi, dan `<h3>` untuk sub-komponen kartu proyek.
3. **No Hidden Text in Canvas/SVG:**
   - Dilarang keras merender teks esensial (riwayat kerja, keahlian teknis, biodata, ringkasan kontak) hanya di dalam elemen `<canvas>`, SVG text path kompleks, atau string JavaScript terenkripsi. Teks wajib hadir sebagai plain DOM text yang dapat diseleksi dan dibaca parser.
4. **Dedicated Print Stylesheet (`@media print`):**
   - Wajib mempertahankan CSS `@media print` yang mengoptimalkan halaman saat diekspor menjadi PDF atau dicetak:
     - Elemen interaktif non-esensial (`.no-print`, navbar, audio, tombol interaktif, animasi latar belakang) wajib disembunyikan (`display: none !important`).
     - Teks wajib berkontras tinggi (hitam di atas putih bersih).
     - Kartu proyek dan pengalaman wajib memiliki `break-inside: avoid` untuk mencegah pemotongan halaman yang canggung.

---

## 2. INVARIANT HRD & RECRUITER COGNITIVE SCAN (6-SECOND SCAN RULE)
1. **Above-the-Fold Essential Quad:**
   Dalam satu layar pertama (resolusi desktop maupun mobile) tanpa perlu scroll, wajib langsung terlihat jelas:
   - **Identitas & Spesialisasi:** Siapa Anda dan role spesifik Anda (contoh: *Full Stack Developer & Data Systems Engineer*).
   - **Status Ketersediaan:** Indikator visual ketersediaan kerja (contoh: *Available for Hire / Open to Work*).
   - **Primary Action (CTA):** Tombol aksi instan untuk mengunduh resume/CV (PDF/Print) dan membuka kontak langsung.
   - **Key Value Metric:** Ringkasan metrik dampak tinggi (contoh: *12.000+ data migrated, 3.5+ years experience*).
2. **Invariant Executive Summary (Standar Harvard & Google):**
   - **Struktur Wajib 4 Pilar:** Ringkasan profesional wajib merangkum seluruh karir dalam 3-4 kalimat padat:
     1. *Anchor & Hook:* Jabatan profesional spesifik + akumulasi tahun pengalaman terbukti.
     2. *Signature Stack:* Tanda tangan arsitektur teknis dan ekosistem spesialisasi utama.
     3. *Aggregate Impact:* Metrik skala karir terbesar yang terbukti (skala data, pengguna, stabilitas).
     4. *Value Trajectory:* Fokus masalah bisnis/performa nyata yang siap diselesaikan.
   - **Anti-Slop & Third-Person Implied:** Dilarang keras menggunakan kata ganti orang pertama (*"I", "me", "my", "saya"*), dan dilarang menyematkan kata sifat subjektif tanpa bukti (*"passionate", "hardworking", "fast learner", "detail-oriented"*).
   - **Sinkronisasi Tri-Level (SSoT):** Ringkasan wajib sinkron antara tampilan teks Hero (DOM), `<meta name="description">`, dan properti `"description"` pada Schema.org JSON-LD.
3. **Zero Splash Screen / No Blocking Intro:**
   - Dilarang keras menahan layar dengan *loading screen* / *intro splash animation* berdurasi lebih dari 0.3 detik. Konten teks wajib tampil instan (*First Contentful Paint < 1.0s*).
4. **Struktur Pembuktian Proyek (Evidence-Based Cards):**
   Setiap kartu proyek (*Project Card*) wajib menyertakan:
   - Judul proyek yang jelas dan deskripsi ringkas berbasis dampak (apa masalahnya, apa solusinya).
   - *Tech stack pills* (teknologi kunci yang relevan dengan kata kunci ATS/HRD).
   - Tautan langsung yang berfungsi (*clickable*): **Live Demo** dan **Source Code (GitHub)**. Jika repo bersifat privat, cantumkan badge/label penjelas yang kredibel.
5. **Scannable Micro-Typography:**
   - Gunakan format bullet poin dan kata kunci tebal (*bold keywords*) pada pencapaian penting. Hindari blok paragraf padat melebihi 4 baris.
6. **Tabular Numerals & Scannable Metrics:**
   - Wajib menerapkan `font-variant-numeric: tabular-nums` (`tabular-nums`) pada strip KPI, penghitung metrik (*rolling counters*), dan tabel keuangan/data agar angka sejajar secara vertikal saat dipindai mata HRD.

---

## 3. INVARIANT GSAP & MOTION ENGINEERING (PERFORMANCE & COMPOSITOR)
1. **Compositor-Only Transforms:**
   - Animasi GSAP dan CSS transition **HANYA** diperbolehkan mengubah properti GPU-accelerated: `transform` (`x`, `y`, `scale`, `rotation`) dan `opacity`.
   - **Dilarang keras** menganimasikan: `top`, `left`, `right`, `bottom`, `width`, `height`, `margin`, `padding`, `border-width` secara berulang karena menyebabkan *layout thrashing* dan membebani CPU.
2. **Lifecycle & Memory Management:**
   - Setiap inisialisasi `ScrollTrigger` atau GSAP Timeline wajib dapat di-refresh atau di-revert dengan aman. Hindari memory leak dari listeners yang tidak pernah dibersihkan.
3. **Natural Scroll Preservation (Anti Scroll-Jacking):**
   - Dilarang membajak (*hijack*) native wheel scrolling browser yang memperlambat laju navigasi recruiter. Animasi harus bersifat *observer/trigger*, bukan pencegat event scroll alami.
4. **Subtle & Purposeful Motion:**
   - Motion bertujuan memperjelas hierarki visual dan memberikan umpan balik taktil (*delight*), bukan pamer efek visual yang mengaburkan konten. Durasi transisi mikro harus berada di rentang `0.15s - 0.4s`.
5. **Parallax Scoping & Restraints (NN/g & WCAG 2.3.3):**
   - Efek parallax scroll **HANYA** boleh diterapkan pada lapisan grafis atau dekoratif latar belakang (`aria-hidden="true"`).
   - **Dilarang keras** menerapkan kecepatan scroll berbeda pada teks esensial (heading, paragraf, daftar keahlian, link kontak) karena merusak keterbacaan *NN/g 6-Second Cognitive Scan*.
   - Parallax wajib dinonaktifkan secara otomatis (`transform: none !important`) saat preferensi `prefers-reduced-motion: reduce` aktif atau pada layar mobile (`< 768px`) untuk mencegah disorientasi vestibular dan lag sentuh.
6. **Compositor-Safe Pointer Effects:**
   - Efek spotlight/hover pelacak kursor **WAJIB** menggunakan `transform: translate3d(...)`, **DILARANG** memanipulasi properti layout `top`/`left` melalui variabel CSS dinamis.
   - Listener pointer wajib dilindungi media query `(hover: hover)`, `prefers-reduced-motion`, dan dibatasi dengan `requestAnimationFrame`.

---

## 4. INVARIANT WCAG 2.2 AA & ACCESSIBILITY (A11Y)
1. **Respect Prefers-Reduced-Motion:**
   - Wajib menyertakan penanganan `window.matchMedia('(prefers-reduced-motion: reduce)')` di JavaScript atau `@media (prefers-reduced-motion: reduce)` di CSS:
     - Jika pengguna mengaktifkan preferensi kurangi gerak, matikan animasi stagger, parallax, dan looping effect, lalu tampilkan konten langsung pada kondisi akhir (`opacity: 1`, `transform: none`).
2. **Preservasi Aksesibilitas Teks:**
   - Jika menggunakan teknik pemecahan teks (*SplitText*) untuk animasi huruf, elemen induk **wajib** memiliki atribut `aria-label="Teks Lengkap Tanpa Potong"` agar pembaca layar tidak mengeja teks huruf-per-huruf.
3. **Color Contrast & Focus State:**
   - Rasio kontras teks terhadap latar belakang wajib minimal `4.5:1` untuk teks normal dan `3:1` untuk teks besar (WCAG AA).
   - Seluruh elemen interaktif (`<a>`, `<button>`, `<input>`) wajib memiliki visual focus ring yang jelas saat dinavigasi via tombol `Tab`.
4. **Keyboard Bypass & Modal Focus Hygiene (Baymard & WCAG 2.2):**
   - Wajib menyediakan tautan *Skip-to-Content* (`href="#main-content"`) di awal `<body>` untuk akses langsung pembaca layar dan navigasi keyboard.
   - Wajib mendefinisikan gaya `:focus-visible` yang konsisten dan berkontras tinggi, menjaga target sentuh ≥ 44px, serta memindahkan fokus masuk saat modal/lightbox dibuka dan mengembalikannya ke pemicu saat ditutup.

---

## 5. INVARIANT VERIFIKASI & AUDIT
Setiap perubahan kode portofolio harus lolos uji:
1. `audit-portfolio.ps1` menghasilkan skor **Tier 1 (≥ 85/100)**.
2. Print preview (`Ctrl + P`) menampilkan tata letak resume yang rapi, bersih, dan hemat kertas.
3. Tidak ada error di console browser saat transisi ScrollTrigger berlangsung.
4. **SSoT Documentation Sync:** `design.md`, `README.md`, dan `llms.txt` wajib selalu sinkron dengan arsitektur visual aktual pada `index.html` serta URL kanonikal `https://misbahudin98.github.io/`.

---

## 6. INVARIANT WEB3, MOTION & RESPONSIVE DEFENSIVE (PERFORMANCE & ZERO-FRICTION)
1. **Read-Only by Default (Zero-Wallet Friction):**
   - 100% konten portofolio (biodata, riwayat kerja, studi kasus, tombol resume/kontak) WAJIB dapat diakses tanpa menghubungkan dompet kripto (*wallet*).
   - Dilarang memunculkan popup atau modal koneksi dompet otomatis (*forced wallet modal*) saat halaman pertama kali dibuka.
2. **Lazy-Loaded Web3 & Heavy 3D Bundles (LCP Protection):**
   - Modul Web3 (`viem`, `ethers`, `wagmi`) dan pustaka 3D (`three.js`) DILARANG diimpor pada *critical rendering path*.
   - Wajib dimuat secara dinamis (*dynamic import / defer*) hanya ketika pengguna secara eksplisit mengklik tombol interaksi terkait. LCP wajib tetap `< 2.5s`.
3. **Semantic Plain-DOM Anchor for WebGL/Canvas:**
   - Elemen `<canvas>` WebGL hanya diperbolehkan sebagai lapisan latar belakang visual dekoratif (*background layer*).
   - Dilarang keras merender teks esensial (nama, tech stack, metrik capaian) hanya di dalam buffer GPU/Canvas. Seluruh teks wajib hadir di plain HTML5 DOM yang dapat diseleksi mesin ATS dan bot pencari.
4. **Mobile Layout Stability & Zero CLS (Cumulative Layout Shift):**
   - Kontainer data on-chain wajib memiliki dimensi tetap (*reserved min-height / aspect-ratio*) dengan status pemuatan (*skeleton loading*) agar tidak menggeser tata letak saat respons blockchain tiba (CLS `< 0.1`).
5. **GPU Thermal Throttling & Offscreen Suspension (Mobile Battery & INP):**
   - Animasi canvas 3D/particle wajib dipotong ke 30fps pada layar mobile (`< 768px`).
   - Loop animasi (`requestAnimationFrame`) wajib dihentikan saat elemen berada di luar viewport (menggunakan `IntersectionObserver` / GSAP ticker pause) untuk menjaga INP `< 200ms`.
6. **Graceful Fallback & Offline State:**
   - Jika simpul RPC blockchain lambat, mengalami rate-limit, atau pengguna membatalkan tanda tangan dompet, antarmuka wajib menampilkan data statis tersimpan (*cached fallback*) tanpa menyebabkan *White Screen of Death*.

---

## 7. INVARIANT PENULISAN LUGAS, HUMANIS & RAMAH AWAM (PLAIN LANGUAGE & JD KEYWORD ALIGNMENT)
> **Acuan Kredibel:** ISO 24495-1:2023 (*Plain Language Standard*), GOV.UK Content Design / PlainLanguage.gov, NN/g *Inverted Pyramid*, William Zinsser (*On Writing Well*), dan *Feynman Technique*.

1. **Singkat & 1 Kalimat = 1 Gagasan (*Micro-Clarity*):**
   - Target panjang **12–20 kata per kalimat** dengan struktur aktif (*Subjek/Aksi + Dampak Nyata*).
   - Terapkan pola **Inverted Pyramid**: sebutkan hasil atau manfaat paling penting di awal kalimat, baru diikuti cara kerja atau teknologinya.
2. **Jembatan Awam–Teknis (*Feynman Rule*):**
   - Dilarang menumpuk akronim atau jargon teknis tanpa konteks manfaat.
   - Setiap istilah teknis wajib dijelaskan dampaknya dengan bahasa sehari-hari agar HRD dan pembaca awam non-IT langsung paham dalam sekali baca.
3. **Nada Humanis & Anti-Robot (*Zero Corporate/AI Slop*):**
   - Gunakan bahasa yang alami, hangat-profesional, jujur, dan spesifik pada masalah nyata yang diselesaikan untuk manusia/tim.
   - Dilarang keras memakai frasa brosur kosong atau klise AI (*"passionate", "synergy", "leverage", "cutting-edge", "dynamic", "visionary", "revolusioner"*).
4. **Injeksi Kata Kunci Lowongan Kerja (*Contextual JD Alignment*):**
   - Saat menyesuaikan teks portofolio/CV dengan suatu lowongan kerja (*Job Description*), wajib mengekstrak **5–10 kata kunci inti** dari lowongan (keahlian teknis, proses kerja, dan target bisnis) lalu menyisipkannya secara organik ke dalam kalimat bukti kerja.
   - Batasi maksimal **2 istilah teknis per kalimat**; dilarang melakukan *keyword stuffing* (menjejalkan kata kunci hingga kalimat kaku atau tidak masuk akal).
5. **Uji Baca Pembaca Awam (*5-Second Comprehension Gate*):**
   - Jika pembaca non-IT harus membaca ulang sebuah kalimat dua kali untuk menangkap inti maknanya, kalimat tersebut wajib dipecah atau disederhanakan.
