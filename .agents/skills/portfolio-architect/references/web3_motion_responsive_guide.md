# Panduan Desain UI/UX Web3, Motion, & Responsive (web3_motion_responsive_guide.md)
> **Standard:** Ethereum 7 Heuristics for Web3 Interface Design, Consensys Diligence UX Guidelines, Nielsen Norman Group (NN/g), Google Core Web Vitals (LCP/INP/CLS), W3C WCAG 2.2 AA.  
> **Target Scope:** Rekayasa antarmuka portofolio yang memadukan teknologi desentralisasi (Web3), animasi mikro berkinerja tinggi (GSAP/Motion), dan tata letak responsif adaptif.

---

## 1. PENDAHULUAN: MENAKLUKKAN "THE FATAL TRINITY"

Menggabungkan Web3, Motion interaktif, dan Responsive Mobile-First dalam satu situs portofolio menghadirkan tiga risiko destruktif utama jika tidak dikendalikan:
1. **LCP & FCP Ambruk:** Pustaka Web3 (`viem`, `wagmi`, `ethers.js`) dan pustaka 3D (`three.js`) memperbesar berkas JavaScript hingga melebihi 1.5MB pada *initial bundle*.
2. **INP & Baterai Ponsel Jebol:** Background polling simpul RPC beradu dengan loop `requestAnimationFrame`, membekukan *main thread* dan membuat tombol macet (*INP > 200ms*).
3. **ATS & Recruiter Blindspot:** Teks yang dirender di dalam WebGL `<canvas>` atau disembunyikan di balik *wallet connection* tidak dapat dibaca oleh bot ATS rekrutmen.

---

## 2. STANDAR INTERNASIONAL & HEURISTIK WEB3 UX

### A. Ethereum Foundation: 7 Heuristics for Web3 Interface Design
1. **Feedback Follows Action:** Setiap interaksi on-chain wajib menyertakan indikator status instan (Pending -> Submitted -> Confirmed) tanpa mengunci seluruh layar.
2. **Security and Trust Are Baked In:** Tampilkan tautan verifikasi penjelajah blok (Etherscan/Solscan) yang jelas untuk setiap bukti proyek atau transaksi.
3. **The Most Important Info Is Obvious:** Angka penting (hash proyek, jaringan aktif, status verifikasi) wajib scannable dalam 1 detik.
4. **Understandable Terminology:** Terjemahkan istilah teknis menjadi istilah profesional (contoh: gunakan *"Verified on Ethereum"* alih-alih *"Tx Confirmed at Block 19827361 with 12 Gwei"*).
5. **Actions Are as Short as Possible:** Hindari *approval fatigue*; jangan meminta tanda tangan (*sign*) hanya untuk melihat studi kasus.
6. **Network Connections Are Visible & Flexible:** Tampilkan indikator jaringan (Mainnet/Testnet) yang jelas tanpa memaksa pengguna mengkonfigurasi dompet mereka secara manual.
7. **Control from the App, Not the Wallet:** Jangan memindahkan kendali ke jendela ekstensi browser; tampilkan status koneksi langsung pada antarmuka web.

### B. Consensys & Nielsen Norman Group (NN/g) Guidelines
* **Read-Only by Default (Zero-Friction Access):** 100% informasi portofolio (biodata, riwayat kerja, studi kasus) WAJIB dapat diakses tanpa menghubungkan dompet kripto (*wallet*).
* **Recognition Rather than Recall:** Jangan biarkan pengguna mengingat alamat dompet panjang `0x71C...`. Selalu pasangkan dengan ENS domain, avatar visual (Blockies/Jazzicons), dan tombol salin instan (*One-Click Copy*).
* **Graceful Fallback & Error Prevention:** Jika koneksi RPC pihak ketiga lambat atau gagal, antarmuka wajib menampilkan data statis tersimpan (*cached fallback*) alih-alih layar kosong putih (*White Screen of Death*).

---

## 3. RESEP REKAYASA KINERJA & MOTION DEFENSIVE

### A. Aturan Emas Pemuatan Bundle (LCP & FCP Protection)
Pustaka Web3 dan 3D **DILARANG KERAS** dimuat pada pemuatan awal (*Initial Page Load*). Terapkan pola *Dynamic Import on User Interaction*:

```javascript
// CONTOH: Lazy Load Web3 Connector Hanya Saat Tombol Ditekan
const connectBtn = document.getElementById('connect-web3-btn');

connectBtn.addEventListener('click', async () => {
  // Tampilkan loading skeleton mikro
  connectBtn.setAttribute('aria-busy', 'true');
  
  try {
    // Dynamic import: mengisolasi ukuran bundle dari initial payload
    const { createPublicClient, http } = await import('https://esm.sh/viem');
    
    // Inisialisasi client Web3 secara on-demand
    const client = createPublicClient({
      transport: http('https://eth.public-rpc.com')
    });
    
    // Eksekusi pembacaan data on-chain publik
    console.log("Web3 Client Loaded On-Demand");
  } catch (err) {
    console.warn("Gagal memuat modul Web3, beralih ke fallback lokal:", err);
  } finally {
    connectBtn.removeAttribute('aria-busy');
  }
});
```

### B. GSAP Compositor Performance & Mobile Battery Throttling
1. **Compositor-Only Rule:** Hanya gunakan `transform` (`x`, `y`, `scale`) dan `opacity`.
2. **Matikan Animasi Off-Screen:** Gunakan `IntersectionObserver` atau `ScrollTrigger.batch` agar loop WebGL dan animasi GSAP berhenti saat elemen berada di luar layar:
```javascript
// Menghentikan Animasi Canvas Saat Tidak Terlihat (INP & Battery Saver)
const canvasObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      startCanvasLoop(); // Lanjutkan loop render 3D
    } else {
      stopCanvasLoop();  // Hentikan requestAnimationFrame untuk hemat CPU/GPU
    }
  });
}, { threshold: 0.1 });

const bgCanvas = document.getElementById('web3-bg-canvas');
if (bgCanvas) canvasObserver.observe(bgCanvas);
```

3. **Ceiling 30 FPS untuk Mobile:**
   Jika lebar layar `< 768px`, batasi laju frame canvas 3D ke 30fps untuk mencegah ponsel mengalami pemanasan (*thermal throttling*).

---

## 4. FORMULA RESPONSIVE DESIGN & PROTEKSI CLS

### A. Pencegahan Cumulative Layout Shift (CLS < 0.1)
Data blockchain sering kali tiba secara asinkron dengan jeda 500ms - 2000ms. Agar tata letak tidak bergeser saat data tiba:
1. Berikan kontainer data Web3 dimensi tetap (*fixed min-height*) atau *aspect-ratio*.
2. Tampilkan skeleton berkedip (*shimmer placeholder*) yang persis seukuran data yang akan tiba:

```html
<!-- Kontainer Proof of Work On-Chain yang Kebal CLS -->
<div class="min-h-[48px] w-full max-w-sm rounded-lg border border-slate-700 bg-slate-900/50 p-3">
  <!-- Status 1: Skeleton (Aktif saat memuat) -->
  <div id="web3-skeleton" class="flex animate-pulse items-center space-x-3">
    <div class="h-6 w-6 rounded-full bg-slate-700"></div>
    <div class="h-4 w-3/4 rounded bg-slate-700"></div>
  </div>
  
  <!-- Status 2: Data Riil (Terisi instan tanpa merusak layout) -->
  <div id="web3-data" class="hidden items-center justify-between">
    <span class="text-sm font-medium text-slate-200">Ethereum Mainnet</span>
    <span class="text-xs font-mono text-emerald-400">Verified On-Chain</span>
  </div>
</div>
```

### B. Touch Target & Navigasi Mobile (Apple HIG & W3C)
1. **Minimum Touch Area:** Seluruh tombol interaksi (tombol salin ENS, tombol tautan blok explorer, tombol ganti tema) wajib memiliki luas tap minimal **`44 x 44 px`**.
2. **Bottom Sheet / Safe Area:** Pada layar smartphone (`< 640px`), modal atau menu interaktif wajib muncul dari bawah (*bottom drawer*) agar dapat dijangkau oleh jempol satu tangan tanpa menutup heading lipatan pertama (*above-the-fold*).

---

## 5. SCORECARD AUDIT WEB3 & MOTION QUALITY (CHECKLIST 5-POINT)

| No | Kriteria Pengujian | Target Standar | Status Lolos |
| :---: | :--- | :--- | :---: |
| 1 | **Initial Bundle Footprint** | Pustaka Web3 & 3D tidak ada di file HTML/JS utama. Dimuat via dynamic import. | [ ] |
| 2 | **Read-Only Accessibility** | 100% konten profil dapat dibaca tanpa dompet kripto / tanpa pop-up. | [ ] |
| 3 | **ATS Plain-DOM Guarantee** | Tidak ada teks profil yang tertanam eksklusif di dalam `<canvas>`. | [ ] |
| 4 | **Core Web Vitals Threshold** | LCP < 2.5s, INP < 200ms, CLS < 0.1 pada emulasi mobile 4G. | [ ] |
| 5 | **Accessibility Fallback** | Mendukung penuh `@media (prefers-reduced-motion: reduce)`. | [ ] |
