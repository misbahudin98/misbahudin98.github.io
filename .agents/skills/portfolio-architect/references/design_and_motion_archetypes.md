# Katalog Arketipe Desain & Resep Rekayasa Motion Web
> **Standar Internasional:** Nielsen Norman Group (NN/g), Apple Human Interface Guidelines (HIG), W3C WCAG 2.2 AA/AAA, Google Core Web Vitals, GreenSock Animation Platform (GSAP v3).  
> **Tujuan:** Panduan acuan teknis untuk mengimplementasikan berbagai gaya desain web modern dan animasi interaktif berperforma tinggi tanpa memicu *layout thrashing* atau merusak aksesibilitas.

---

## 1. KATALOG 5 ARKETIPE GAYA DESAIN WEB MODERN

### Arketipe 1: Dark Obsidian / Minimalist Tech (Linear, Vercel, Supabase)
* **Karakter Kunci:** Presisi tinggi, estetika insinyur perangkat lunak, palet gelap pekat dengan aksen neon terkendali.
* **Palet Warna Tailwind:**
  - Kanvas: `bg-[#07090e]` atau `bg-slate-950`
  - Permukaan Kartu: `bg-slate-900/40` atau `bg-[#0c1017]/60`
  - Border Hairline: `border-slate-800/80` atau `border-white/10`
  - Aksen Utama (< 10%): `text-emerald-400`, `bg-emerald-500`, `glow-emerald`
* **Tipografi:** Sans-serif presisi (`Inter`, `Geist Sans`) dipadu dengan Monospace murni (`JetBrains Mono`, `Fira Code`) untuk metrik dan cuplikan arsitektur.
* **Fitur Khas:** Spotlight card hover effect (radial glow), terminal simulated windows, live availability pulses.

---

### Arketipe 2: Bento Grid Layout (Apple VisionOS, Microsoft Fluent, Framer)
* **Karakter Kunci:** Modularitas geometris tingkat tinggi, mengorganisasi berbagai format konten (angka, visual, kutipan) dalam satu matriks harmonis.
* **Struktur Grid Tailwind:**
  ```html
  <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
    <!-- Kartu Lebar 2 Kolom -->
    <div class="md:col-span-2 p-6 rounded-3xl bg-slate-900/50 border border-slate-800 ...">...</div>
    <!-- Kartu Persegi 1 Kolom -->
    <div class="p-6 rounded-3xl bg-slate-900/50 border border-slate-800 ...">...</div>
    <!-- Kartu Tinggi Vertikal (2 Baris) -->
    <div class="md:row-span-2 p-6 rounded-3xl bg-slate-900/50 border border-slate-800 ...">...</div>
  </div>
  ```
* **Radius & Shadow:** `rounded-2xl` s/d `rounded-3xl`, bayangan mikro `shadow-2xs` atau `shadow-sm`.
* **Kelebihan:** Memecah kejenuhan membaca dan sangat ideal untuk etalase fitur produk / kartu studi kasus proyek.

---

### Arketipe 3: Swiss Style / International Typographic (Josef Müller-Brockmann)
* **Karakter Kunci:** Rasionalisme murni, spasi negatif (*white space*) luas, minim ornamen dekoratif, hierarki tipografi tegas.
* **Formula Desain:**
  - Font: Sans-serif netral berskala matematis (`Helvetica Neue`, `Inter`, `Neue Haas Grotesk`).
  - Hierarki: Judul besar tebal (`font-black tracking-tight leading-none`), spasi margin lega, garis pembatas horizontal 1px murni (`border-t border-slate-300 dark:border-slate-800`).
  - Warna: Monokrom 95% (Hitam, Abu-abu, Putih) dengan tepat 1 warna sinyal (Merah Swiss `#e11d48` atau Oranye Internasional).
* **Kelebihan:** Keterbacaan teks tertinggi di industri, bebas dari distorsi visual.

---

### Arketipe 4: Neo-Brutalism / Tactile Raw Tech (Gumroad, Figma Community, Pitch)
* **Karakter Kunci:** Kontras tinggi, tegas, playful namun berwibawa, terasa fisik seperti memencet tombol nyata.
* **Styling Tokens:**
  - Border: Hitam pekat tebal `border-2 border-black dark:border-white`
  - Shadow: Kaku tanpa blur `shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]`
  - Warna Aksen: Pastel cerah kontras tinggi (Kuning `#fef08a`, Cyan `#a5f3fc`, Lavender `#e9d5ff`)
  - Interaksi Tombol: Saat ditekan (*active state*), elemen bergeser `translate-x-[2px] translate-y-[2px]` dan shadow mengecil menjadi `shadow-[2px_2px_0px_0px_rgba(0,0,0,1)]`.

---

### Arketipe 5: Warm Editorial / Modern Monastic (Stripe Press, Kinfolk, Substack)
* **Karakter Kunci:** Hangat, intelektual, prestisius, cocok untuk publikasi riset mendalam atau portofolio pemikir teknologi.
* **Styling Tokens:**
  - Kanvas Latar: Krem hangat atau oatmeal `bg-[#faf8f5]` / dark mode `bg-[#141210]`
  - Tipografi Judul: Serif berkarakter anggun (`Playfair Display`, `Newsreader`, `Merriweather`)
  - Tipografi Body: Sans-serif santai dengan line height longgar (`leading-relaxed` / `leading-loose`)
  - Aksen: Cokelat tembaga, amber matang, atau hijau zaitun tua.

---

## 2. STANDAR FISIKA MOTION & DURASI INTERAKSI (DISNEY UI LAWS)

1. **Durasi Mikro-Interaksi (150ms – 250ms):**
   - Transisi hover tombol, scale pill, perubahan warna border. Wajib terasa instan dan tidak menahan pengguna.
2. **Durasi Makro-Koreografi (300ms – 500ms):**
   - Masuknya kartu proyek saat di-scroll, pembukaan modal dialog, pergeseran drawer.
3. **Aturan Kurva Akselerasi (Natural Easing):**
   - Masuk ke layar: `ease-out` atau `cubic-bezier(0.16, 1, 0.3, 1)` (cepat di awal, perlahan di akhir).
   - Keluar dari layar: `ease-in` atau `cubic-bezier(0.7, 0, 0.84, 0)` (perlahan di awal, melesat di akhir).
   - Dilarang menggunakan `linear` untuk transisi antarmuka manusia.
4. **Stagger Jarak Mikro (0.02s – 0.08s):**
   - Jeda kemunculan antar elemen berseri untuk menciptakan aliran gerak organik seperti tetesan air.

---

## 3. RESEP KODE MOTION BERPERFORMA TINGGI (COMPOSITOR-SAFE)

### Resep 1: Spotlight Hover Card (Linear/Vercel Effect)
Efek radial glow yang mengikuti kursor mouse tanpa memicu reflow DOM:

```css
/* CSS */
.spotlight-card {
  position: relative;
  overflow: hidden;
}
.spotlight-card::before {
  content: '';
  position: absolute;
  top: var(--mouse-y, -1000px);
  left: var(--mouse-x, -1000px);
  width: 400px;
  height: 400px;
  background: radial-gradient(circle, rgba(16, 185, 129, 0.15) 0%, transparent 70%);
  transform: translate(-50%, -50%);
  pointer-events: none;
  opacity: 0;
  transition: opacity 0.3s ease;
  z-index: 1;
}
.spotlight-card:hover::before {
  opacity: 1;
}
```

```javascript
// JavaScript Listener
function initSpotlightCards() {
  document.querySelectorAll('.spotlight-card').forEach(card => {
    card.addEventListener('mousemove', e => {
      const rect = card.getBoundingClientRect();
      card.style.setProperty('--mouse-x', `${e.clientX - rect.left}px`);
      card.style.setProperty('--mouse-y', `${e.clientY - rect.top}px`);
    });
  });
}
```

---

### Resep 2: Magnetic CTA Button Physics
Tombol yang sedikit tertarik mengikuti kursor mouse saat didekati:

```javascript
function initMagneticButtons() {
  document.querySelectorAll('.magnetic-btn').forEach(btn => {
    btn.addEventListener('mousemove', e => {
      const rect = btn.getBoundingClientRect();
      const x = (e.clientX - rect.left - rect.width / 2) * 0.25;
      const y = (e.clientY - rect.top - rect.height / 2) * 0.25;
      gsap.to(btn, { x, y, duration: 0.3, ease: 'power2.out' });
    });
    btn.addEventListener('mouseleave', () => {
      gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: 'elastic.out(1, 0.4)' });
    });
  });
}
```

---

### Resep 3: GSAP ScrollTrigger Entrance Stagger
Memunculkan kartu proyek secara berjenjang saat digulir ke viewport:

```javascript
gsap.from('.stagger-card', {
  scrollTrigger: {
    trigger: '.card-container',
    start: 'top 80%',
    once: true
  },
  y: 24,
  opacity: 0,
  duration: 0.45,
  stagger: 0.08,
  ease: 'power2.out'
});
```

---

### Resep 4: Smooth Number Counter Up
Menghitung angka dampak bisnis saat terlihat di layar:

```javascript
function initCounter(elId, targetVal, isFloat = false) {
  const obj = { val: 0 };
  gsap.to(obj, {
    val: targetVal,
    duration: 1.6,
    ease: 'power2.out',
    scrollTrigger: { trigger: `#${elId}`, start: 'top 85%', once: true },
    onUpdate: () => {
      const el = document.getElementById(elId);
      if (el) {
        el.textContent = isFloat ? obj.val.toFixed(1) : Math.floor(obj.val).toLocaleString('id-ID');
      }
    }
  });
}
```

---

### Resep 5: Decorative Compositor Parallax (GSAP & Native CSS)
Menggerakkan lapisan aksen visual latar belakang secara halus (*subtle depth*) tanpa mengaburkan keterbacaan teks atau membebani thread browser:

#### Opsi A: GSAP ScrollTrigger Scrub (Universal Cross-Browser)
```javascript
function initDecorativeParallax() {
  // WCAG 2.3.3 & Mobile Protection: Matikan jika reduce motion atau viewport < 768px
  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (prefersReduced || window.innerWidth < 768) return;

  gsap.utils.toArray('[data-parallax-depth]').forEach(layer => {
    const depth = parseFloat(layer.getAttribute('data-parallax-depth')) || 0.15;
    gsap.to(layer, {
      y: () => -1 * (ScrollTrigger.maxScroll(window) * depth * 0.1),
      ease: 'none',
      scrollTrigger: {
        trigger: document.body,
        start: 'top top',
        end: 'bottom bottom',
        scrub: 0.4,
        invalidateOnRefresh: true
      }
    });
  });
}
```

```html
<!-- Markup: Wajib aria-hidden="true" dan pointer-events-none -->
<div 
  data-parallax-depth="0.2" 
  class="pointer-events-none absolute -top-12 -right-12 h-80 w-80 rounded-full bg-emerald-500/10 blur-3xl will-change-transform"
  aria-hidden="true">
</div>
```

#### Opsi B: W3C CSS Scroll-Driven Animations (Zero Main-Thread Overhead)
```css
@supports (animation-timeline: view()) {
  @media (prefers-reduced-motion: no-preference) and (min-width: 768px) {
    .parallax-layer {
      animation: parallaxDrift linear both;
      animation-timeline: view();
      animation-range: entry 0% exit 100%;
      will-change: transform;
    }
    @keyframes parallaxDrift {
      from { transform: translateY(-24px); }
      to   { transform: translateY(24px); }
    }
  }
}
```

---

## 4. INVARIANT MUTLAK PERFORMA & AKSESIBILITAS (A11Y)

1. **Wajib Dukung `prefers-reduced-motion`:**
   Setiap fungsi inisialisasi animasi wajib dibungkus pengaman preferensi sistem:
   ```javascript
   const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
   if (prefersReducedMotion) return; // Langsung tampilkan kondisi akhir tanpa animasi
   ```
2. **GPU Compositor Only (No Layout Thrashing):**
   - ✅ HANYA animasikan: `transform: translate3d / scale / rotate` dan `opacity`.
   - ❌ DILARANG keras menganimasikan: `width`, `height`, `top`, `left`, `margin`, `padding`.
3. **Anti Scroll-Jacking:**
   - Dilarang membajak event scroll mouse wheel browser yang mengunci kecepatan gerak pengguna. Animasi harus bereaksi terhadap scroll alami, bukan memaksakan scroll buatan yang memperlambat recruiter.
