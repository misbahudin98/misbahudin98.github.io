# Trigger Tag Protocol: @portfolio & @portfolio-architect
> **Standard:** Antigravity Skill Tag Trigger Protocol

---

## ATURAN REAKTIF TRIGGER TAG

Ketika pengguna menyertakan tag `@portfolio` atau `@portfolio-architect` (atau tag pagar `#portfolio`, `#audit-portfolio`) pada instruksi:

1. **Wajib Mengaktifkan Skill `portfolio-architect`**:
   - Agen WAJIB segera mengaktifkan dan mematuhi tata cara di `.agents/skills/portfolio-architect/SKILL.md`.
   - Agen WAJIB memastikan kepatuhan terhadap `.agents/rules/portfolio_invariants.md`.

2. **Pola Respons Deterministik**:
   - Jika pengguna meminta review, audit, atau pengecekan portofolio:
     - Jalankan skrip auditor `.\.agents\skills\portfolio-architect\scripts\audit-portfolio.ps1`.
     - Sajikan laporan 5 Dimensi Kualitas Internasional (Rubrik 0-100 poin).
     - Berikan perbaikan konkret (*Actionable Refactor/Patch*).
   - Jika pengguna meminta penambahan proyek / studi kasus baru:
     - Gunakan Formula STAR dan Google XYZ dari `references/case_study_template.md`.
     - Injeksi kata kunci relevan untuk algoritma ATS.
   - Jika pengguna meminta penambahan, penyesuaian gaya desain, atau animasi:
     - Gunakan panduan arketipe desain dan resep motion di `references/design_and_motion_archetypes.md`.
     - Terapkan standar GSAP 60fps compositor-only (`transform`/`opacity`) dan proteksi `prefers-reduced-motion`.

3. **Eksekusi Cepat**:
   - Langsung sajikan skor evaluasi, bukti pengujian, dan draf kode siap pasang tanpa bertele-tele.
