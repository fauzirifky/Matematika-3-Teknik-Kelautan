# Matematika 3 - Teknik Kelautan

Repository bahan perkuliahan **KL25-21001 Matematika 3**, Program Studi Teknik Kelautan, Institut Teknologi Sumatera.

Pengajar: **Rifky Fauzi**  
Kelas RB: Kamis, 14.50-17.30, E302  
Semester: Ganjil 2026/2027

## Struktur

```text
Matematika-3-Teknik-Kelautan/
├── Modul/
├── Slide Perkuliahan/
│   ├── P01_Refresh-Prasyarat/
│   └── P03_Transformasi-Laplace-II/
├── Lembar Kerja Mandiri/
├── Tugas/
│   ├── T01_Pekan-01/
│   ├── T02_Pekan-02-04/
│   ├── T03_Pekan-05-07/
│   ├── T04_Pekan-09/
│   ├── T05_Pekan-10-12/
│   └── T06_Pekan-13-14/
├── assets/
├── tools/
└── .github/workflows/
```

## Pola penamaan file

Semua bahan utama menggunakan pola:

```text
MAT3_<JENIS>_<KODE>_<TOPIK>.<ext>
```

Contoh:

```text
MAT3_SLIDE_P03_Transformasi-Laplace-II.tex
MAT3_SLIDE_P03_Transformasi-Laplace-II.pdf
MAT3_LKM_Bank-Soal.tex
MAT3_LKM_Bank-Soal.pdf
MAT3_TUGAS_T02_Pekan-02-04.tex
MAT3_TUGAS_T02_Pekan-02-04.pdf
```

File Microsoft Word (`.doc`, `.docx`, `.docm`) **tidak disimpan di repository**. Dokumen kerja perkuliahan di repository menggunakan source LaTeX (`.tex`) dan hasil kompilasi (`.pdf`).

## Compile

```bash
bash tools/build.sh
```

Compile ulang seluruh source:

```bash
bash tools/build.sh --force
```

GitHub Actions juga akan mengompilasi source LaTeX saat ada perubahan dan memperbarui PDF hasil kompilasi.
