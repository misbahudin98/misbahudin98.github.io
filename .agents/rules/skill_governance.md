# Agent Skill Governance & Anti-Collision Protocol (skill_governance.md)
> **Standard:** Anthropic Building Effective Agents (Dec 2024), OpenAI Tool Demarcation, McKinsey MECE Principle, Antigravity Progressive Disclosure Architecture.  
> **Target Scope:** Seluruh penambahan, modifikasi, dan evaluasi berkas aturan (*rules*) dan keahlian (*skills*) di dalam repositori ini.

---

## 1. PRINSIP MECE (MUTUALLY EXCLUSIVE, COLLECTIVELY EXHAUSTIVE)

Untuk mencegah degradasi performa model (*attention degradation*), kebingungan *routing* (*tool hallucination*), dan pemborosan jendela konteks (*token bloat*), seluruh *skill* wajib tunduk pada 5 Invarian Tata Kelola:

### Invarian 1: Ortogonalitas Trigger & Namespacing Ketat (Mutually Exclusive)
1. Setiap *skill* wajib memiliki tag pemicu utama yang unik dan terisolasi:
   - `@portfolio` / `@portfolio-architect` -> Khusus rekayasa & audit web portofolio.
   - `@prompt` / `@pa` / `@prompt-architect` -> Khusus rekayasa & audit prompt AI / evaluasi sistem agen.
2. Dilarang keras membuat dua *skill* atau aturan pemicu yang merespons kata kunci pemicu yang sama tanpa hierarki yang jelas.
3. Deskripsi pemicu pada *frontmatter* `SKILL.md` wajib mendefinisikan apa yang ditangani **DAN** membatasi apa yang tidak ditangani (*negative boundary*).

### Invarian 2: Isolasi Batas Domain & Single Responsibility Principle (SRP)
1. **Satu Skill = Satu Domain Spesifik:**
   - Dilarang membuat "omni-skill" yang menggabungkan banyak domain berbeda ke dalam satu runbook raksasa.
2. **Larangan Saling Campur (Zero Domain Bleed):**
   - Skill Portofolio DILARANG merancang format prompt AI umum.
   - Skill Prompt Architect DILARANG mendikte pilihan styling CSS/HTML portofolio di luar pengujian struktural prompt.
3. Jika sebuah tugas membutuhkan kolaborasi multi-domain, orkestrasi wajib dilakukan secara sekuensial (Contoh: `@prompt` menyusun prompt studi kasus -> `@portfolio` mengevaluasi pemasangan komponen DOM).

### Invarian 3: Pemisahan Hierarki Aturan vs. Skill (SSoT)
Untuk mematuhi arsitektur Antigravity:
1. **Aturan (`.agents/rules/`):**
   - Tempat tinggal **INVARIAN MUTLAK**, batasan keras (*Negative Constraints*), dan protokol routing tag.
   - Bersifat *Always-On* atau terikat direktori.
   - Wajib ringkas dan mematuhi kuota 24 KB per file dan total alokasi `defaultRulesBudget` (20.000 token).
2. **Skill (`.agents/skills/`):**
   - Tempat tinggal **PROSEDUR OPERASIONAL**, *runbook*, *checklist* mendalam, rubrik penilaian, dan skrip eksekusi.
   - Bersifat *Lazy-Loaded* (hanya aktif jika dipanggil).
3. **Anti-Duplikasi (SSoT):**
   - `SKILL.md` DILARANG menduplikasi isi teks aturan. `SKILL.md` hanya boleh merujuk ke aturan terkait melalui tautan file (`.agents/rules/*.md`).

### Invarian 4: Progressive Disclosure & Budget Konteks
1. **Frontmatter Super-Ringkas:**
   - Deskripsi pada `SKILL.md` dibaca oleh model saat indexing metadata awal.
   - Panjang deskripsi wajib padat (< 50 kata / < 400 karakter), menyebutkan domain dan tag pemicu eksplisit.
2. **Modularitas Berkas `references/`:**
   - Seluruh dokumentasi tebal, contoh studi kasus, dan rubrik wajib dipisah ke dalam folder `references/` atau `examples/`.
   - Agen hanya membaca berkas referensi saat dibutuhkan secara dinamis.

### Invarian 5: Verifikasi Deterministik & Validasi Mesin
1. Setiap *skill* wajib menyediakan atau didukung oleh skrip otomasi (PowerShell di folder `scripts/`) untuk pembuktian hasil.
2. Sebelum merilis *skill* baru, wajib menjalankan skrip auditor:
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".agents/skills/prompt-architect/scripts/audit-skills.ps1"
   ```
   Status wajib lulus dengan nilai minimal **90/100 (Tier 1 Gold Governance)** tanpa peringatan kolisi.

---

## 2. MATRIKS PARTISI DOMAIN REPOSITORI (SSoT)

| Domain | Skill Penanggung Jawab | Tag Pemicu | Berkas Invarian Utama |
| :--- | :--- | :--- | :--- |
| **Portofolio Developer** | `portfolio-architect` | `@portfolio`, `@portfolio-architect` | `.agents/rules/portfolio_invariants.md` |
| **Rekayasa Prompt & Tata Kelola Agen** | `prompt-architect` | `@prompt`, `@pa`, `@prompt-architect` | `.agents/rules/skill_governance.md` |

Jika Anda hendak menambahkan *skill* baru di masa mendatang (misal: `seo-architect`, `performance-architect`), wajib mendaftarkannya terlebih dahulu pada tabel matriks di atas dan memastikan tag pemicunya tidak bertabrakan.
