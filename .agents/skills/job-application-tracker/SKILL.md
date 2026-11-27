---
name: job-application-tracker
description: >-
  Records job applications to tracker JSON, drafts distinct humanist messages per platform
  (Email, WhatsApp, Glints, LinkedIn), and bundles CV PDFs with attachments. Triggered by
  '@lamaran' or '@apply'. Excludes web portfolio UI design and general AI prompt auditing.
---

# Job Application Tracker & PDF Bundler

Keahlian (*skill*) ini mengelola siklus lamaran kerja end-to-end berbasis sumber tunggal [`tracker/applications.json`](../../../tracker/applications.json) serta dasbor interaktif [`tracker/index.html`](../../../tracker/index.html).

---

## 1. REFERENSI & SKRIP MODULAR

* **Skema JSON & Gaya Bahasa Per Platform:** [`references/application_schema_and_tones.md`](./references/application_schema_and_tones.md)
* **Skrip Penggabung PDF Otomatis (Python):** [`scripts/merge-application-pdf.py`](./scripts/merge-application-pdf.py)
* **Memori Fakta Kandidat (SSoT):** [`docs/cv_memory_ssot.md`](../../../docs/cv_memory_ssot.md)
* **Aturan Reaktif Tag:** [`.agents/rules/lamaran_trigger.md`](../../rules/lamaran_trigger.md)

---

## 2. WORKFLOW 1: REKAP LOWONGAN BARU & PESAN MULTI-PLATFORM

1. **Ekstrak Detail Lowongan:** Catat perusahaan, posisi, bidang, kisaran gaji, **fasilitas/benefit yang didapatkan (`benefits`)**, **alamat email tujuan (`target_email`)**, **nomor WhatsApp tujuan (`target_whatsapp`)**, syarat utama, daftar berkas wajib, format penamaan file (jika ada), serta tautan portal tujuan.
2. **Kalibrasi Bahasa & Fakta:** Gunakan fakta dari `docs/cv_memory_ssot.md` dengan nada membumi, humanis, bebas klise AI, dan hindari kesan *overqualified* bila targetnya posisi operasional/pendidikan/admin.
3. **Susun Pesan Terpisah Per Platform:**
   - **Email:** Formal-hangat, ada baris subjek presisi, pembuka jelas, ringkasan relevansi 2 paragraf, daftar lampiran, dan penutup sopan.
   - **WhatsApp:** Ringkas, santun, langsung pada inti agar nyaman dibaca di layar ponsel dalam 15 detik.
   - **Glints:** Kasual-profesional, fokus pada kecocokan tugas harian dan kesiapan wawancara.
   - **LinkedIn:** Padat, profesional, menyoroti dampak terukur dan tautan `https://misbahudin98.github.io/`.
   - **Other (JobStreet/Portal/Form):** Adaptif ringkas untuk kolom catatan atau *cover note*.
4. **Simpan ke `tracker/applications.json`:** Berikan ID berurutan berikutnya (`APP-002`, `APP-003`, dst.) lengkap dengan path `merged_pdf` dan status awal.

---

## 3. WORKFLOW 2: MENAMPILKAN FORMAT PESAN BERDASARKAN ID

Ketika pengguna menyebut ID (`APP-001`, dll.) atau nama perusahaan:
1. Baca entri terkait di `tracker/applications.json`.
2. Tampilkan ringkasan status, target pengiriman, format penamaan berkas (jika ada), serta sajikan pesan terpisah untuk **Email**, **WhatsApp**, **Glints**, **LinkedIn**, dan **Lainnya** agar siap salin.

---

## 4. WORKFLOW 3: BUNDLING 1 FILE PDF (+ BERKAS LAMPIRAN DI AKHIR)

1. **Komponen Dokumen:**
   - Wajib ada **CV** yang disesuaikan dengan lowongan.
   - Sertakan **Surat Lamaran** dan/atau **Portofolio** hanya jika diminta eksplisit oleh pengguna atau disyaratkan pada poster lowongan.
   - **Tanda Tangan Khusus Surat Lamaran:** Setiap kali membuat **Surat Lamaran**, wajib menyematkan `assets/ttd_cropped.png` (hasil crop presisi dari `assets/ttd.png`) tepat di atas garis nama `Misbahudin, S.Tr.Kom.` pada blok tanda tangan. Jangan pasang tanda tangan pada CV atau Portofolio.
   - Akhiri **selalu** dengan `assets/cv/berkas - tanpa sensitif.pdf`.
2. **Eksekusi Penggabungan:**
   ```powershell
   python .\.agents\skills\job-application-tracker\scripts\merge-application-pdf.py `
     --surat "assets/cv/Surat_Lamaran_....pdf" `
     --cv "assets/cv/CV_....pdf" `
     --portofolio "assets/cv/Portofolio_....pdf" `
     --output "assets/cv/<NAMA_FILE_SESUAI_ATURAN_LOWONGAN>.pdf"
   ```
3. **Aturan Nama File:** Patuhi pola penamaan file yang diminta lowongan (jika ada). Jika tidak ada ketentuan khusus, gunakan `Lamaran_<Posisi>_<Perusahaan>_Misbahudin.pdf`.

---

## 5. WORKFLOW 4: PEMBARUAN STATUS LAMARAN

Perbarui field `status` (`Draft`, `Siap Kirim`, `Terkirim`, `Proses / Tes`, `Wawancara`, `Diterima`, `Ditolak`, `Arsip`), `applied_at`, atau `notes` pada `tracker/applications.json` (atau arahkan pengguna mengedit langsung dari `tracker/index.html`).
