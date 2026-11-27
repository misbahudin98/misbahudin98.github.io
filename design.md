# Master Visual Design System & Editorial Motion Specification (design.md)
> **Target:** International Developer Portfolio ([https://misbahudin98.github.io/](https://misbahudin98.github.io/))  
> **Standard:** International Developer Portfolio Standards v2.1 — Nielsen Norman Group (NN/g 6-Second Scan & Layer-Cake Scanning), Baymard Institute (Focus & Modal Ergonomics), W3C WCAG 2.2 AA/AAA, Google Core Web Vitals (`LCP < 2.5s`, `INP < 200ms`, `CLS < 0.1`), Dieter Rams, Josef Müller-Brockmann, Edward Tufte, Apple HIG Motion.  
> **Status:** Single Source of Truth (SSoT) untuk Desain Visual, Arsitektur 6 Babak Editorial, dan Koreografi Animasi GSAP pada [`index.html`](index.html).

---

## 1. FILOSOFI DESAIN & REFERENSI KREDIBEL INTERNASIONAL

Portofolio ini mengusung arketipe **Warm Swiss Architectural Blueprint** — memadukan ketegasan grid editorial klasik di atas kanvas kertas hangat (`#F6F4EF`) untuk kenyamanan baca HRD, dengan presisi kanvas gelap (`#0B1320`) khusus pada babak studi kasus data/spreadsheet (`Chapter 03`).

### Lima Referensi Kredibel Utama:
1. **Nielsen Norman Group (NN/g) — 6-Second Cognitive Scan & Layer-Cake Scanning:**
   - Recruiter hanya membutuhkan < 6 detik di area *above-the-fold* untuk memverifikasi identitas, status *Available for Hire*, tombol unduh CV PDF, kontak langsung, dan 4 metrik dampak utama.
   - Penomoran babak konsisten (`01`–`06`), sub-heading tegas, dan *bold keywords* memfasilitasi pola pemindaian *layer-cake* tanpa kelelahan membaca.
2. **Josef Müller-Brockmann (*Zürich*) — Sistem Grid Swiss 12 Kolom:**
   - Asimetri terukur (`7 cols` narasi : `5 cols` potret pada Hero; `8 cols` : `4 cols` pada Timeline Karier), garis pembatas `1px` (*hairline rules*), dan perataan kiri yang disiplin.
3. **Dieter Rams (*Braun*) — "Weniger, aber besser":**
   - Menghilangkan *splash screen*, modal pemblokir, maupun dekorasi gradien neon yang tidak fungsional. Ruang negatif berfungsi memberi ketenangan kognitif.
4. **Edward Tufte (*Yale*) — High Data-to-Ink Ratio & Tabular Numerals:**
   - Visualisasi data pada *KPI Strip* dan *Dashboard Excel* menghindari *chartjunk*, menggunakan grid tipis dan `font-variant-numeric: tabular-nums` agar seluruh angka sejajar secara vertikal.
5. **Baymard Institute & W3C WCAG 2.2 AA/AAA — Ergonomi Fokus & Aksesibilitas:**
   - Tautan *Skip-to-Content* (`#main-content`), cincin fokus `:focus-visible` berkontras tinggi, pemindahan dan pengembalian fokus pada modal Lightbox, target sentuh ramah mobile, serta proteksi penuh `prefers-reduced-motion`.

---

## 2. ARSITEKTUR NARATIF: 6 BABAK EDITORIAL (`01`–`06`)

| Babak | Anchor DOM | Tema Visual | Fokus Kognitif HRD / Recruiter |
| :---: | :--- | :--- | :--- |
| **01** | `#profil` | Light (`#F6F4EF`) | Identitas, spesialisasi, status siap kerja, CTA CV PDF + kontak, potret editorial, & 4 metrik kunci (`tabular-nums`). |
| **02** | `#pengalaman` | Light (`#F6F4EF`) | Linimasa karier kronologis mundur (Terbaru ke Terdahulu) dengan garis progres *scrubbed* & pratinjau dokumentasi. |
| **03** | `#studi-kasus-excel` | Dark (`#0B1320`) | Studi kasus interaktif *Pipeline ETL & Dashboard KPI Excel* 4 tahap (Desktop Scrollytelling + Mobile Snap Carousel + Chart.js). |
| **04** | `#proyek` | Light (`#F6F4EF`) | Galeri 2×3 proyek produksi & open-source (`SIM Notaris`, `SIM-PQTM`, `PPDB/HRIS`, `Excel ETL`, `Twinnie Group`, `Job Tracker`) dengan *spotlight 3D tilt* & Lightbox. |
| **05** | `#keahlian` | Light (`#F6F4EF`) | Matriks kompetensi 4 pilar (Data/Excel, Backend/Web, IT Ops/Jaringan, Administrasi/Keuangan) & latar pendidikan ATS-clear. |
| **06** | `#kontak` | Surface (`#FFFFFF`) | Footer editorial dengan CTA CV PDF, WhatsApp, tombol salin instan (*Clipboard API*), serta tautan LinkedIn & GitHub utuh. |

---

## 3. SISTEM TOKEN WARNA & TIPOGRAFI (SSoT CSS)

```css
:root {
  --paper: #F6F4EF;       /* Kanvas Editorial Hangat (60% dominan) */
  --surface: #FFFFFF;     /* Permukaan Kartu & Footer */
  --ink: #0F172A;         /* Teks Utama Kontras Tinggi */
  --navy: #1B365D;        /* Warna Primer Otoritas & CTA */
  --slate: #475569;       /* Teks Sekunder & Deskripsi */
  --copper: #B45309;      /* Aksen Sinyal Penomoran & Fokus (<10%) */
  --hairline: #DCD9D0;    /* Garis Pemisah Struktural 1px */
  --dark-canvas: #0B1320; /* Kanvas Studi Kasus Data/Spreadsheet */
}
```

### Pasangan 2 Font Internasional:
1. **`Plus Jakarta Sans` (`font-sans`):** Judul display (`H1`–`H3`), narasi studi kasus, dan navigasi utama.
2. **`JetBrains Mono` (`font-mono` + `.tabular-nums`):** Penomoran babak (`01`–`06`), label teknis, formula Excel, stempel waktu, dan strip metrik kuantitatif.

---

## 4. KOREOGRAFI MOTION GSAP 3.12 & COMPOSITOR SAFETY

Seluruh animasi dikelola oleh `initStoryMotion()` menggunakan `GSAP 3.12.5` + `ScrollTrigger` + `Flip` dengan prinsip **GPU Compositor-Only** (`transform`, `opacity`, `clip-path`):

1. **Masked Headline Reveal (`.masked-title`):**
   - Slide-up halus dari dalam `.mask-wrap` (`yPercent: 105 -> 0`, `0.75s`, `power3.out`, `clearProps: 'transform'`).
2. **Hairline Rule Drawing (`.hairline-rule`):**
   - Garis pembatas 1px tumbuh dari kiri (`scaleX: 0 -> 1`, `origin-left`, `0.75s`, `power2.out`).
3. **Curtain Image Reveal & Inner-Image Editorial Parallax (`.curtain-frame`, `.parallax-media`):**
   - Penyingkapan frame gambar dengan `clipPath: inset(12% 0% 0% 0%) -> inset(0% 0% 0% 0%)` (`0.8s`, `power3.out`), dipadukan dengan *Inner-Image Parallax* (`scale: 1.09`, `yPercent: -5 -> 5`, `scrub: 0.45`) pada viewport desktop tanpa menggeser bingkai (`CLS = 0`).
4. **Scrubbed Career Timeline Spine & Active-Node Pulse (`#timeline-progress-line`, `.timeline-node`):**
   - Garis vertikal `scaleY: 0 -> 1` tersinkronisasi alami dengan scroll (`scrub: 0.35`), disertai efek *Active-Node Pulse* (cincin tembaga berdenyut dan highlight border kartu pengalaman) saat setiap milestone berada di zona baca aktif.
5. **Scrollytelling, GSAP `Flip` Tab Indicator, Formula Live Decode & Row Stagger (Chapter 03):**
   - Desktop (`>= 1024px`): `ScrollTrigger` menukar tab workbook Excel (`raw` → `master` → `etl` → `dashboard`) dengan indikator garis aktif **GSAP `Flip`** yang meluncur antar-tab, *micro-stagger* baris/KPI (`0.025s`), dan *Formula Bar Live Decode* (`clipPath` wipe kiri-ke-kanan + sorot kolom tabel).
   - Mobile (`< 1024px`): *CSS Scroll Snap Carousel* dengan indikator titik dan tombol navigasi sentuh.
6. **GPU `translate3d` Spotlight Cards, Micro 3D Tilt (`gsap.quickTo`) & Magnetic CTAs:**
   - `.spotlight-card` memadukan cahaya radial `translate3d` dengan kemiringan perspektif 3D halus maksimal **`±3°`** via `gsap.quickTo` (`transformPerspective: 900`, desktop hover-only).
   - `.magnetic-btn` memberi tarikan elastis mikro hanya pada perangkat desktop non-reduced-motion.
7. **Auto-Reactivating `1.0s` Rolling Telemetry Counters (`runHeroCounters`, `setupHeroCounterAutoObserver`, `.metric-bar`):**
   - Menggunakan mesin `requestAnimationFrame` murni (`duration: 1000ms`, stagger `70ms`, `easeOutCubic`) yang berjalan tepat setelah `window.load` (`+180ms`) dan otomatis me-reset angka ke `0` saat strip keluar viewport lalu menghitung naik kembali `0 -> target` beserta progress bar `.metric-bar` (`scaleX: 0 -> 1`) setiap kali pengguna scroll kembali ke Hero via **`IntersectionObserver`** (tanpa memerlukan tombol manual).
8. **Project Card Boundaries (`.project-card`, `.project-media-well`), Lightbox Reveal & Tactile Buttons (`.btn-tactile`):**
   - Setiap kartu proyek di `#proyek` memiliki border tegas `#C8C3B8`, elevation shadow, dan media well `#ECE8DF` untuk pemisahan visual antar-proyek yang jelas, dilengkapi poster tipografi Swiss bersih untuk Proyek 04 & 06.
   - Modal Lightbox dibuka/ditutup dengan transisi GSAP `clipPath` + `scale` halus dengan restorasi fokus penuh.
   - `.copy-btn` bermorfosis sementara menjadi ikon centang hijau `"Tersalin!"` dengan pegas `back.out(2.2)` selama `1.8s` serta menampilkan toast konfirmasi.
   - Seluruh tombol aksi primer, sekunder, dan pratinjau kartu menggunakan `.btn-tactile` dengan border, bayangan taktil, elevasi hover `-1px`, dan efek tekan `scale(0.98)`.

---

## 5. AKSESIBILITAS, CETAK CV & QUALITY GATES

- **Keyboard & Screen Reader (WCAG 2.2):** Tautan *Skip-to-Content* (`#main-content`), `:focus-visible` outline copper `2px`, serta manajemen fokus Lightbox (fokus berpindah ke tombol tutup saat dibuka dan kembali ke pemicu saat ditutup).
- **Print Stylesheet (`@media print`):** Menyembunyikan navbar, chapter rail, modal, dan tombol interaktif (`.no-print`), mengonversi tema gelap Chapter 03 ke hitam-putih hemat tinta, serta menjaga kartu utuh dengan `break-inside: avoid`.
- **Quality Gate Otomatis:**
  - `.\.agents\skills\portfolio-architect\scripts\audit-portfolio.ps1 -Path "index.html"` → **100 / 100 (TIER 1)**
  - `.\.agents\skills\prompt-architect\scripts\audit-skills.ps1` → **100 / 100 (Tier 1 Gold Governance)**
