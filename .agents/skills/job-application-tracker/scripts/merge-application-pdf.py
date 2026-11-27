#!/usr/bin/env python3
"""
Merge job application documents into a single PDF with berkas - tanpa sensitif.pdf appended last.
Order: [Surat Lamaran (optional)] -> [CV (required)] -> [Portofolio (optional)] -> [Berkas Lampiran (last)]
"""

import argparse
from pathlib import Path
import sys
from pypdf import PdfReader, PdfWriter


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Bundle CV, optional Surat Lamaran & Portofolio, and berkas - tanpa sensitif.pdf into 1 PDF."
    )
    parser.add_argument("--cv", required=True, help="Path to tailored CV PDF (required)")
    parser.add_argument("--surat", default="", help="Path to Surat Lamaran PDF (optional)")
    parser.add_argument("--portofolio", default="", help="Path to Portofolio PDF (optional)")
    parser.add_argument(
        "--berkas",
        default="assets/cv/berkas - tanpa sensitif.pdf",
        help="Path to base attachment PDF appended at the end",
    )
    parser.add_argument("--output", required=True, help="Output merged PDF file path")
    args = parser.parse_args()

    ordered_inputs: list[tuple[str, Path]] = []
    if args.surat:
        ordered_inputs.append(("Surat Lamaran", Path(args.surat)))
    ordered_inputs.append(("CV", Path(args.cv)))
    if args.portofolio:
        ordered_inputs.append(("Portofolio", Path(args.portofolio)))
    if args.berkas:
        ordered_inputs.append(("Berkas Pendukung", Path(args.berkas)))

    writer = PdfWriter()
    total_pages = 0

    for label, pdf_path in ordered_inputs:
        if not pdf_path.exists():
            print(f"[ERROR] {label} tidak ditemukan: {pdf_path}", file=sys.stderr)
            return 1
        reader = PdfReader(str(pdf_path))
        page_count = len(reader.pages)
        for page in reader.pages:
            writer.add_page(page)
        total_pages += page_count
        print(f" + {label}: {pdf_path.name} ({page_count} halaman)")

    out_path = Path(args.output)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("wb") as f:
        writer.write(f)

    size_kb = out_path.stat().st_size / 1024
    print(f"[OK] Selesai digabung: {out_path} ({total_pages} halaman, {size_kb:.1f} KB)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
