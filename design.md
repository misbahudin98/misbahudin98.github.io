# Master Visual Design System & Kinetic Story Motion Specification (design.md)
> **Target:** International Developer Portfolio (`misbahudin98.github.io`)  
> **Standard:** International Developer Portfolio Standards v2.0 (ATS Machine-Readable, HRD Cognitive 6-Second Scan, GSAP 60fps Motion Engineering, WCAG 2.2 AAA, APCA Contrast Lc ≥ 75).  
> **Status:** Single Source of Truth (SSoT) untuk Desain Visual, Arsitektur Antarmuka, dan Koreografi Animasi.

---

## 1. PREAMBULE & FILOSOFI DESAIN INTERNASIONAL

Portofolio ini dibangun di atas filosofi **Cyber-Tactical Minimalism & Kinetic Story Motion**, mengawinkan ketelitian rekayasa sistem (*systems engineering*) dengan estetika visual kelas dunia. Portofolio ini menolak keras segala bentuk **AI Visual Slop** (seperti gradien neon ungu-pink murahan, blob blur mengambang tanpa fungsi, dan efek kaca buram yang merusak keterbacaan) untuk menghadirkan aura **Quiet Luxury & Human-Crafted Authenticity**.

### Empat Pilar Filosofis Maestro Dunia:
1. **Dieter Rams (*Braun*) — "Weniger, aber besser" (Kurang, tapi lebih baik):**
   - Menghapus seluruh ornamen dekoratif yang tidak fungsional.
   - Ruang negatif (*negative space*) bukan ruang kosong yang terbuang, melainkan instrumen visual utama yang memberikan ketenangan kognitif kepada recruiter.
2. **Bauhaus (*Weimar & Dessau*) — "Form Follows Function":**
   - Setiap elemen memiliki tujuan eksplisit: tombol bertindak sebagai pemicu aksi taktil, kartu membingkai bukti dampak riil, dan terminal mensimulasikan keandalan CLI.
3. **Josef Müller-Brockmann (*Zürich*) — Sistem Grid Swiss:**
   - Kedisiplinan struktur kisi-kisi modular, perataan kiri (*flush-left*) yang tegas, dan asimetri dinamis berbobot optis seimbang (*Visual Weight Equilibrium*).
4. **Edward Tufte (*Yale*) — Rasio Data-ke-Tinta Tinggi (*High Data-to-Ink Ratio*):**
   - Memaksimalkan penyampaian informasi kuantitatif dengan meminimalkan polusi visual (*chartjunk*).
   - Memanfaatkan garis pembatas *hairline* 1px (`border-slate-200/80` / `border-slate-800/80`) dan sudut reticle taktis presisi.

---

## 2. ARSITEKTUR NARATIF: "THE ENGINEER'S ODYSSEY" (5-ACT GAME LOOP)

Alih-alih menyajikan portofolio statis yang menjemukan, situs disusun dalam alur babak taktis interaktif (*campaign chapters*):

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ ALUR BABAK CERITA INTERAKTIF (5-ACT GAME LOOP)                                   │
├───────────────┬──────────────────────────────────┬───────────────────────────────┤
│ Babak         │ Nama Babak                       │ Konten Rekayasa               │
├───────────────┼──────────────────────────────────┼───────────────────────────────┤
│ ACT 00: SPAWN │ Character Initialization & HUD   │ Hero, Player Vitals, Stack    │
│ ACT 01: RAIDS │ Major Campaigns & Boss Fights    │ Notaris & SIM-PQTM Projects   │
│ ACT 02: TREES │ Interactive RPG Talent Tree      │ 3 Pillars & Playable CLI Deck │
│ ACT 03: LOGS  │ Career Chronicles & War Room     │ Timeline Pengalaman Kerja     │
│ ACT 04: CODEX │ Scholarly Research & Academics   │ Riset Ilmiah 360 Feedback     │
│ ACT 05: CO-OP │ Extraction Zone & Direct Connect │ Kontak Cepat & Unduh CV PDF   │
└───────────────┴──────────────────────────────────┴───────────────────────────────┘
```

---

## 3. ENGINE DUAL-PERSONA (DUAL-MODE SWITCHER)

Situs mengimplementasikan mekanisme **Dual-Persona Interface Engine** yang dapat diakses langsung pada bilah navigasi atas:

1. **Mode [ 🎮 DEV QUEST ] (Default):**
   - Ditujukan untuk: *Tech Leads, Engineering Managers, CTO, dan Senior Engineers*.
   - Fitur: Sudut reticle taktis (`.tactical-reticle`), indikator babak HUD dengan phosphor glow, terminal CLI interaktif yang dapat dimainkan, dan animasi *story motion*.
2. **Mode [ 📄 EXECUTIVE ATS ]:**
   - Ditujukan untuk: *Corporate HRD, Headhunters, dan Executive Recruiters*.
   - Fitur: Menyembunyikan aksen reticle dan estetika game secara instan, mengubah antarmuka menjadi format dokumen korporat yang super bersih, formal, dan siap cetak (*zero friction*).
   - Terintegrasi penuh dengan `localStorage` untuk persistensi preferensi pengunjung.

---

## 4. SISTEM TOKEN WARNA (SAINS WARNA 60-30-10 & APCA CONTRAST)

Portofolio mengadopsi standar ruang warna terukur untuk kenyamanan mata dan aksesibilitas maksimal:

```css
/* 60% KANVAS DOMINAN */
--canvas-light: #f8fafc; /* Slate-50 / Platinum Mist */
--canvas-dark:  #070a0f; /* Deep Obsidian (Bebas OLED smearing) */

/* 30% STRUKTUR KARTU & BORDER */
--surface-light: #ffffff; /* White Solid */
--surface-dark:  #0f172a; /* Slate-900 Semi-Solid */
--border-hairline-light: rgba(226, 232, 240, 0.8); /* Slate-200/80 */
--border-hairline-dark:  rgba(30, 41, 59, 0.8);   /* Slate-800/80 */

/* 10% AKSEN FUNGSIONAL PEMANTIK AKSI */
--accent-phosphor: #10b981; /* Emerald-500 (Status Aktif, Integritas Data) */
--accent-tactical: #f59e0b; /* Amber-500 (Warning, Work in Progress) */
--accent-pulse:    #06b6d4; /* Cyan-500 (Sinyal REPL, Telemetri) */
--accent-mana:     #a855f7; /* Purple-500 (Node Keahlian & TDD) */
```

### Kepatuhan Kontras:
- **Teks Utama (`text-slate-900` / `text-white`):** Memenuhi rasio kontras WCAG AAA **≥ 14:1** dan APCA $L_c \ge 75$.
- **Teks Sekunder (`text-slate-600` / `text-slate-400`):** Memenuhi rasio kontras WCAG AA **≥ 5.5:1** dan APCA $L_c \ge 60$.
- **Border & Reticles:** Memenuhi WCAG SC 1.4.11 **≥ 3:1**.

---

## 5. SISTEM TIPOGRAFI 2-FONT STANDAR INTERNASIONAL

1. **Display & Heading Font (`Plus Jakarta Sans` / `Geist Sans`):**
   - Digunakan untuk: Judul babak (`H1`–`H3`), kartu proyek, dan metrik dampak kuantitatif.
   - Karakter: Tegas, modern, geometris dengan proporsi humanist.
2. **Body, Interface & Tabular Font (`Inter` & `JetBrains Mono`):**
   - Digunakan untuk: Paragraf deskripsi studi kasus, label teknis, stempel waktu, dan output terminal CLI.
   - Data numerik dan metrik wajib menggunakan `font-mono` untuk menjamin kerapian pemindaian vertikal (*vertical scanning alignment*).

---

## 6. KOREOGRAFI MOTION GSAP & ATURAN COMPOSITOR SAFETY

1. **Hanya Mengubah Properti Terakselerasi GPU:**
   - Animasi transisi dan ScrollTrigger **HANYA** diperbolehkan memanipulasi `transform: translate3d/scale/rotate` dan `opacity`.
   - Dilarang keras menganimasikan geometri layout (`top`, `left`, `width`, `height`, `margin`, `padding`) demi menjaga stabilitas frame rate **60 FPS**.
2. **Plafon Durasi & Stagger Alami:**
   - Mikro-interaksi tombol: `150ms – 250ms` (cubic-bezier cepat).
   - Makro-transisi kartu: `300ms – 500ms` (durasi total $\le 600\text{ms}$).
   - Stagger kemunculan elemen: `0.04s – 0.08s`.
3. **Vestibular Safety (Aksesibilitas Universal):**
   - Seluruh animasi wajib menghormati `@media (prefers-reduced-motion: reduce)`. Jika aktif, animasi dinonaktifkan seketika dan elemen langsung ditampilkan dalam kondisi akhir (*state opacity 1*).
4. **Preservasi Scroll Alami (Anti Scroll-Jacking):**
   - Dilarang membajak scrolling alami peramban. Animasi bertindak sebagai pengamat (*passive observer*), bukan pencegat event roda tetikus.

---

## 7. PROTOKOL KOGNITIF HRD (6-SECOND RECRUITER SCAN) & ATS COMPLIANCE

1. **Above-the-Fold Essential Quad:**
   - Dalam 6 detik pertama tanpa menggulir layar, recruiter wajib menemukan:
     1. Identitas & Spesialisasi Resmi (*Full Stack Developer & Systems Architect*).
     2. Status Ketersediaan Nyata (*Available for Hire* badge).
     3. Tombol Aksi Instan (Download CV PDF & Kontak Langsung).
     4. Statistik Karakter Kunci (*Player Vitals Strip*).
2. **Schema.org JSON-LD Terverifikasi:**
   - Menyertakan data terstruktur `@type: "Person"` dengan entitas `jobTitle`, `knowsAbout`, `sameAs` (GitHub & LinkedIn), dan URL resmi.
3. **Cetak Resume Bersih (`@media print`):**
   - Menyediakan stylesheet khusus cetak yang menyembunyikan tombol interaktif, efek audio, dan navigasi melayang, menghasilkan PDF CV resmi yang hemat kertas dan rapi.

---

## 8. MATRIKS VERIFIKASI & QUALITY GATES

Setiap perubahan visual pada repositori portofolio wajib memenuhi:
- [x] Lulus uji script verifikasi otonom: `audit-portfolio.ps1` **100 / 100 TIER 1**.
- [x] Nol error console pada peramban desktop dan ponsel.
- [x] Lolos uji kontras WCAG 2.2 AAA pada Daylight dan Dark Obsidian mode.
- [x] zero claim palsu (*evidence-based claims only*).
