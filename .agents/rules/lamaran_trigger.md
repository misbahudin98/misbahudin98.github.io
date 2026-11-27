# Trigger Tag Protocol: @lamaran & @apply (lamaran_trigger.md)
> **Standard:** Antigravity Skill Tag Trigger Protocol & MECE Partitioning

---

## ATURAN REAKTIF & INVARIANT LAMARAN KERJA

Ketika pengguna menyertakan tag `@lamaran` atau `@apply` (atau meminta pencatatan, pesan lamaran multi-platform, maupun penggabungan berkas PDF lamaran untuk ID/lowongan tertentu):

1. **Wajib Mengaktifkan Skill `job-application-tracker`**:
   - Ikuti prosedur di `.agents/skills/job-application-tracker/SKILL.md` dan skema pada `references/application_schema_and_tones.md`.
   - Rujuk profil fakta kandidat dari `docs/cv_memory_ssot.md` (urutan kronologis mundur `1 -> 2 -> 3`, tautan resmi `https://misbahudin98.github.io/`, keterangan `Setara S1`, fakta Virtual Account non-API, bebas NIK/SK).

2. **Perekaman Otomatis ke JSON (`tracker/applications.json`)**:
   - Setiap permintaan lamaran baru wajib direkam ke `tracker/applications.json` dengan ID berurutan (`APP-001`, `APP-002`, ...), termasuk aspek gaji (`salary_range`), **fasilitas/benefit yang didapatkan (`benefits`)**, serta **alamat email (`target_email`) dan nomor WhatsApp (`target_whatsapp`)** tujuan rekrutmen bila tercantum pada lowongan.
   - Simpan data lowongan terpisah per platform komunikasi dengan gaya bahasa humanis yang berbeda dan natural: `email` (`subject` + `body`), `whatsapp`, `glints`, `linkedin`, dan `other`.

3. **Pemanggilan Ulang by ID & Kalibrasi Anti-AI**:
   - Jika pengguna menyebut ID (mis. `APP-001`) atau nama instansi, tampilkan format pesan siap kirim per platform sesuai catatan pada `tracker/applications.json`.
   - Hilangkan pola/klise AI dan sesuaikan nada agar tidak terkesan *overqualified* ketika gaji/level posisi menuntut bahasa membumi.

4. **Bundling 1 Berkas PDF Lamaran**:
   - Buat **CV** khusus lowongan; tambahkan **Surat Lamaran** dan/atau **Portofolio** hanya jika diminta secara eksplisit (atau disyaratkan oleh lowongan).
   - **Tanda Tangan Surat Lamaran (`ttd.png`):** Khusus jika lowongan meminta berkas **Surat Lamaran**, wajib mencantumkan gambar tanda tangan yang sudah di-crop (`assets/ttd_cropped.png` dari sumber `assets/ttd.png`) pada bagian tanda tangan di atas nama `Misbahudin, S.Tr.Kom.` (tinggi proporsional `46–56px`, latar bersih/transparan). Jangan cantumkan tanda tangan pada CV maupun Portofolio.
   - Gabungkan seluruhnya menjadi **1 file PDF** dengan `assets/cv/berkas - tanpa sensitif.pdf` **selalu di bagian paling akhir** menggunakan `merge-application-pdf.py`, mengikuti format nama file yang ditentukan lowongan (jika ada).
