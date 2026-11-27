# Skema JSON Tracker & Standar Gaya Bahasa Multi-Platform

## 1. Skema Data `tracker/applications.json`

```json
{
  "schema_version": "1.0",
  "updated_at": "2026-11-27T12:20:00+07:00",
  "applications": [
    {
      "id": "APP-001",
      "created_at": "2026-11-27",
      "applied_at": "",
      "company": "Nama Perusahaan / Lembaga",
      "position": "Nama Posisi",
      "location": "Kota",
      "salary_range": "Rp X - Rp Y",
      "benefits": ["Fasilitas 1 (mis. BPJS/Makan)", "Fasilitas 2 (mis. Pelatihan/WFH)"],
      "primary_channel": "Email | WhatsApp | Glints | LinkedIn | Lainnya",
      "target_email": "hrd_rekrutmen[at]perusahaan.co.id",
      "target_whatsapp": "+62 812-3456-7890",
      "target_contact": "Link portal / catatan kontak tambahan",
      "status": "Draft | Siap Kirim | Terkirim | Proses / Tes | Wawancara | Diterima | Ditolak | Arsip",
      "required_docs": ["Surat Lamaran", "CV", "Ijazah & Transkrip", "Portofolio"],
      "filename_rule": "Aturan penamaan file dari poster (atau 'Bebas / Standar')",
      "keywords": ["Kata kunci 1", "Kata kunci 2"],
      "merged_pdf": "../assets/cv/Nama_File_Gabungan.pdf",
      "notes": "Catatan kalibrasi nada / anti-overqualified",
      "messages": {
        "email": { "subject": "...", "body": "..." },
        "whatsapp": "...",
        "glints": "...",
        "linkedin": "...",
        "other": "..."
      }
    }
  ]
}
```

---

## 2. Perbedaan Gaya Bahasa Antar Platform (Humanis & Anti-AI)

1. **Email (Formal-Hangat):**
   - Ada `Subjek` sesuai aturan lowongan.
   - Struktur: Salam pembuka sopan → perkenalan singkat (domisili & Setara S1) → 2 paragraf pengalaman paling relevan → daftar berkas terlampir & link `https://misbahudin98.github.io/` → penutup wajar.
2. **WhatsApp (Singkat & Santun):**
   - Awali permohonan maaf mengganggu waktu, maks. 3 paragraf pendek agar terbaca nyaman di layar HP tanpa menggulir panjang.
   - Cantumkan tautan `https://misbahudin98.github.io/` secara utuh.
3. **Glints (Kasual-Profesional):**
   - Langsung ke kecocokan posisi dan pekerjaan harian yang dicari; ringkas, ramah, dan ajak lanjut ke tahap wawancara.
4. **LinkedIn (Padat & Berbasis Dampak):**
   - Menonjolkan pencapaian terukur yang relevan dengan peran + tautan `https://misbahudin98.github.io/`.
5. **Other (JobStreet / Portal Web):**
   - Paragraf ringkas siap tempel di kolom *Additional Info / Cover Note*.

### Larangan Gaya AI (Wajib Dihindari)
* Jangan pakai pembuka klise seperti *"Dengan penuh antusiasme dan semangat yang membara..."* atau *"Saya adalah individu yang dinamis, berdedikasi tinggi, dan pembelajar cepat..."*.
* Gunakan kalimat sederhana yang biasa diucapkan profesional Indonesia saat berbicara langsung.

---

## 3. STANDAR TANDA TANGAN SURAT LAMARAN (`ttd.png`)

Khusus apabila lowongan atau pengguna meminta pembuatan **Surat Lamaran**:
* Gunakan berkas tanda tangan hasil crop transparan [`assets/ttd_cropped.png`](../../../../assets/ttd_cropped.png) (berasal dari `assets/ttd.png`).
* Letakkan tepat di atas nama `Misbahudin, S.Tr.Kom.` pada blok penutup sebelah kanan, tanpa membesar-besarkan ukuran atau menabrak teks di sekitarnya:

```html
<div class="signature-space">
  <img src="file:///D:/laragon/www/misbahudin-portfolio/assets/ttd_cropped.png" alt="Tanda tangan Misbahudin" style="height: 50px; width: auto; object-fit: contain; display: block; mix-blend-mode: multiply;" />
</div>
```

* Dilarang keras menaruh tanda tangan di halaman **CV** maupun **Portofolio**.
