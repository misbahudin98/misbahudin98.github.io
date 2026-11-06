# Rubrik Audit Tata Kelola Skill & Pencegahan Kolisi (skill_governance_rubric.md)
> **Standard:** Anthropic Building Effective Agents (Dec 2024), OpenAI Tool Calling Benchmarks, McKinsey MECE Partitioning, Antigravity Progressive Disclosure Architecture.  
> **Target Scope:** Kerangka kerja peninjauan komprehensif untuk memastikan seluruh keahlian (*skills*) beroperasi dengan performa maksimal, tanpa tabrakan semantik (*zero overlap*), dan hemat token.

---

## 1. SISTEM SKOR 5 DIMENSI KUALITAS TATA KELOLA SKILL (TOTAL: 100 POIN)

```
========================================================================================
DIMENSI 1: TRIGGER TAG & SEMANTIC ORTHOGONALITY                      [Bobot: 20 Poin]
========================================================================================
Kriteria Evaluasi:
- Unik & Terisolasi (8 Poin): Setiap skill memiliki tag pemicu eksplisit (@tag) yang tidak
  dimiliki oleh skill lain.
- Semantic Distance Tinggi (6 Poin): Deskripsi pada frontmatter SKILL.md memiliki jarak semantik
  yang jauh dari skill lain. Kata-kata kunci pembuka tidak ambigu.
- Negative Boundary (6 Poin): Menyebutkan secara eksplisit apa yang ditolak/dikecualikan 
  sehingga model tidak keliru memicu skill untuk tugas yang berdekatan.

Skor Indikator:
[20] Sempurna: Tag pemicu unik, deskripsi tajam, ada negative boundary eksplisit.
[12] Cukup: Tag unik, tetapi deskripsi masih memiliki kata-kata umum yang rawan overlap.
[0]  Gagal: Ditemukan pemicu atau tag yang bentrok dengan skill lain.

========================================================================================
DIMENSI 2: FUNCTIONAL DOMAIN BOUNDARY (SINGLE RESPONSIBILITY)        [Bobot: 20 Poin]
========================================================================================
Kriteria Evaluasi:
- Prinsip Single Responsibility (8 Poin): 1 skill berfokus pada 1 domain fungsional spesifik.
- Anti "Omni-Skill" (6 Poin): Skill tidak mencoba menjadi serba bisa (misal: merangkap audit 
  kode, rekayasa prompt, dan commit git dalam 1 runbook).
- Clean Orchestration Boundary (6 Poin): Jika berinteraksi dengan domain lain, dilakukan lewat
  antarmuka/aturan terpisah tanpa mencaplok tanggung jawab domain lain.

Skor Indikator:
[20] Sempurna: Domain fungsional terisolasi 100%, batasan peran sangat tegas.
[10] Cukup: Domain utama jelas, tetapi ada 1-2 fitur sampingan yang tidak relevan.
[0]  Gagal: Terjadi penumpukan berbagai domain (omni-skill).

========================================================================================
DIMENSI 3: RULE VS. SKILL ARCHITECTURAL CLEANLINESS (SSoT)           [Bobot: 20 Poin]
========================================================================================
Kriteria Evaluasi:
- Single Source of Truth (8 Poin): Tidak ada duplikasi teks invarian antara .agents/rules/
  dan .agents/skills/. Skill hanya memuat tautan relatif ke berkas rules.
- Penempatan Tepat (6 Poin): Aturan wajib (Always-on/Dir-bound) berada di .agents/rules/, 
  sedangkan tata cara/runbook berada di .agents/skills/.
- Non-Conflicting Directives (6 Poin): Instruksi di SKILL.md tidak pernah bertentangan dengan
  invarian yang didefinisikan di .agents/rules/*.md.

Skor Indikator:
[20] Sempurna: Arsitektur 100% patuh SSoT, pemisahan rules dan skill sangat presisi.
[10] Cukup: Ada sedikit redundansi teks antara rules dan skill.
[0]  Gagal: Skill mengabaikan rules atau menduplikasi puluhan baris invarian rules.

========================================================================================
DIMENSI 4: PROGRESSIVE DISCLOSURE & TOKEN BUDGETING                  [Bobot: 20 Poin]
========================================================================================
Kriteria Evaluasi:
- Frontmatter Lean & Compact (8 Poin): Panjang description pada YAML frontmatter <= 50 kata
  (atau <= 400 karakter). Tidak memboroskan token pada saat indexing awal agent.
- Modularitas References (6 Poin): Penjelasan tebal, studi kasus, dan rubrik dipecah ke 
  dalam folder references/ atau examples/ secara modular.
- Budget Compliance (6 Poin): Berkas SKILL.md utama tidak melebihi 200 baris. Berkas rules
  tidak melebihi batas 24 KB per file.

Skor Indikator:
[20] Sempurna: Frontmatter padat, arsitektur modular progresif, hemat token 100%.
[10] Cukup: SKILL.md agak panjang (> 200 baris) tapi referensi sudah terpisah sebagian.
[0]  Gagal: Frontmatter sangat panjang (> 100 kata), seluruh dokumentasi menumpuk di 1 berkas.

========================================================================================
DIMENSI 5: DETERMINISTIC VERIFICATION & TOOL SUPPORT                 [Bobot: 20 Poin]
========================================================================================
Kriteria Evaluasi:
- Dukungan Script Otomatis (8 Poin): Tersedia script pendukung (misal: scripts/*.ps1) untuk 
  menjalankan audit atau kompilasi secara deterministik.
- Verifiable Pass/Fail Criteria (6 Poin): Menyediakan kriteria terukur yang dapat diuji mesin
  (exit code 0, regex check, build test).
- Actionable Diagnostic (6 Poin): Menghasilkan rekomendasi konkret jika pengujian gagal.

Skor Indikator:
[20] Sempurna: Memiliki skrip audit otomatis yang siap dijalankan dan kriteria lolos terukur.
[10] Cukup: Memiliki instruksi pengujian manual tanpa skrip otomasi.
[0]  Gagal: Tidak ada metode verifikasi; hasil kerja tidak dapat dibuktikan.
========================================================================================
```

---

## 2. TINGKAT KEMATANGAN TATA KELOLA SKILL (GOVERNANCE MATURITY TIERS)

| Tier | Rentang Skor | Klasifikasi | Keterangan & Tindakan |
| :---: | :---: | :--- | :--- |
| **Tier 1** | **90 - 100** | **Gold Standard (Production Ready)** | Bebas kolisi, sangat hemat token, batasan peran sangat tegas, diverifikasi oleh skrip otomasi. Siap digunakan dalam siklus kerja harian. |
| **Tier 2** | **75 - 89** | **Enterprise Compliant** | Aman digunakan, tetapi memiliki sedikit redundansi deskripsi atau dokumen utama yang agak panjang. Perlu perapian modularitas. |
| **Tier 3** | **60 - 74** | **Fragile / Sub-Optimal** | Rentan salah pemicu (*trigger misrouting*). Terdapat tumpang tindih kata kunci yang berisiko membuat LLM bingung memilih. |
| **Tier 4** | **< 60** | **Slop / High Collision Risk** | DILARANG DIGUNAKAN. Mengandung benturan tag eksplisit, menyerap token berlebihan, atau mengabaikan prinsip MECE. Wajib di-refactor. |

---

## 3. KATALOG ANTI-PATTERN & TEKNIK REFACTORING

### A. Anti-Pattern: *Ambiguous Affordances* (Deskripsi Bersinggungan)
* **Gejala:** Dua skill memiliki kata kunci umum seperti *"Membantu optimasi kode dan reviu dokumen"*.
* **Solusi Refactoring:** Tambahkan klausul eksklusi eksplisit pada frontmatter:
  ```yaml
  # SEBELUM (Rawan Bentrok):
  description: Mengaudit kode dan dokumen sistem.
  
  # SESUDAH (Ortogonal & Presisi):
  description: >-
    Mengaudit kepatuhan arsitektur portofolio developer (ATS, GSAP, semantic HTML).
    Dilarang digunakan untuk rekayasa prompt AI (gunakan @prompt untuk itu).
  ```

### B. Anti-Pattern: *The Omni-Skill Monolith*
* **Gejala:** Satu skill memiliki 10 langkah kerja yang mencakup pengujian database, penataan tampilan UI, pembuatan prompt, dan deployment server.
* **Solusi Refactoring:** Terapkan *Interface Segregation Principle*. Pecah menjadi skill mikro atau delegasikan tugas infrastruktur ke *rule* atau *tool* terpisah.

### C. Anti-Pattern: *Token Invariant Inversion*
* **Gejala:** Menuliskan aturan larangan (misal: larangan `// TODO`) di dalam `SKILL.md` padahal aturan tersebut bersifat universal di seluruh proyek.
* **Solusi Refactoring:** Pindahkan aturan universal ke `.agents/rules/` agar selalu aktif, dan biarkan `SKILL.md` hanya berisi langkah eksekusi runbook.
