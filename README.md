# Matematika 3 - Teknik Kelautan ITERA

Repositori bahan perkuliahan **KL25-21001 Matematika 3** untuk Program Studi Teknik Kelautan, Institut Teknologi Sumatera.

- Kelas: RB
- Pengajar: Rifky Fauzi
- Jadwal: Kamis, 14.50-17.30, E302
- Semester: Ganjil 2026/2027

## Struktur

```text
Matematika 3 Teknik Kelautan/
├── Modul/
├── Slide Perkuliahan/
│   ├── Pertemuan_01/
│   └── Pertemuan_03/
├── Lembar Kerja Mandiri/
├── assets/
├── tools/
└── .github/workflows/
```

## Berkas utama saat ini

- `Slide Perkuliahan/Pertemuan_03/slides_P03.tex` - slide Pertemuan 3, Transformasi Laplace II.
- `Slide Perkuliahan/Pertemuan_03/slides_P03.pdf` - hasil kompilasi slide.
- `Lembar Kerja Mandiri/lembar_kerja_matematika3.tex` - bank soal mandiri dari refresh, Laplace, Fourier, PDP/BVP, hingga mock UTS dan UAS.
- `Lembar Kerja Mandiri/lembar_kerja_matematika3.pdf` - hasil kompilasi lembar kerja.

## Kompilasi

Jalankan:

```bash
bash tools/build.sh
```

`build.sh` hanya mengompilasi `.tex` yang PDF-nya belum ada atau lebih lama dari source/aset. Untuk memaksa kompilasi semua:

```bash
bash tools/build.sh --force
```

GitHub Actions juga akan mengompilasi ulang LaTeX setiap kali source `.tex`, aset, atau script build berubah, lalu menyimpan PDF terbaru kembali ke branch `main`.

## Sinkronisasi cepat

```bash
bash tools/status.sh
bash tools/pull.sh
bash tools/push.sh "pesan commit"
# atau pull + build + push sekaligus:
bash tools/sync.sh "pesan commit"
```
