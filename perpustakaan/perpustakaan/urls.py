"""perpustakaan URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    #menu
    path('', dashboard, name="dashboard"),
    path('database/', database, name="database"),
    path('registrasi/', registrasi, name="registrasi"),
    path('transaksi/', transaksi, name="transaksi"),
    path('peminjaman/', peminjaman, name="peminjaman"),
    path('pengembalian/', pengembalian, name="pengembalian"),
    path('laporan/', laporan, name="laporan"),
    path('laporan/anggota', laporan_anggota, name="laporan_anggota"),
    path('laporan/buku', laporan_buku, name="laporan_buku"),
    path('laporan/denda', laporan_denda, name="laporan_denda"),
    path('laporan/pinjam', laporan_pinjam, name="laporan_pinjam"),

    #buku
    path('buku/', buku, name="buku"),
    path('buku/form', form_b, name="form_buku"),
    path('buku/create', tambah_buku, name="tambah_buku"),
    path('buku/edit/<str:kodebukuedit>/', edit_buku, name="edit_buku"),
    path('buku/delete/<str:kodebuku>/', delete_buku, name="delete_buku"),
    #mahasiswa
    path('mahasiswa/', mahasiswa, name="mahasiswa"),
    path('mahasiswa/form', form_m, name="form_mahasiswa"),
    path('mahasiswa/pinjam/form', form_pinjam_m, name="form_pinjam_mahasiswa"),
    path('mahasiswa/kembali/form', form_kembali_m, name="form_kembali_mahasiswa"),
    path('mahasiswa/kembali/create', tambah_kembali_m, name="tambah_kembali_mahasiswa"),
    path('mahasiswa/kembali/delete/<str:nopinjamm>/', delete_kembali_m, name="delete_kembali_m"),
    path('mahasiswa/pinjam/create', tambah_mahasiswa_pinjam, name="tambah_mahasiswa_pinjam"),
    path('mahasiswa/pinjam/edit/<str:nopinjammedit>/', edit_pinjam_m, name="edit_pinjam_mmahasiswa"),
    path('mahasiswa/pinjam/delete/<str:nopinjamm>/', delete_pinjam_m, name="delete_pinjam_m"),
    path('mahasiswa/pinjam', mahasiswa_pinjam, name="pinjam_mahasiswa"),
    path('mahasiswa/kembali', mahasiswa_kembali, name="kembali_mahasiswa"),
    path('mahasiswa/create', tambah_mahasiswa, name="tambah_mahasiswa"),
    path('mahasiswa/edit/<str:noanggotamedit>/', edit_mahasiswa, name="edit_mahasiswa"),
    path('mahasiswa/delete/<str:noanggotam>/', delete_mahasiswa, name="delete_mahasiswa"),


    #non-mahasiswa
    path('non-mahasiswa/', non_mahasiswa, name="non_mahasiswa"),
    path('non-mahasiswa/pinjam', non_mahasiswa_pinjam, name="pinjam_non_mahasiswa"),
    path('non-mahasiswa/pinjam/form', form_pinjam_n, name="form_pinjam_non_mahasiswa"),
    path('non-mahasiswa/pinjam/create', tambah_non_mahasiswa_pinjam, name="tambah_non_mahasiswa_pinjam"),
    path('non-mahasiswa/pinjam/edit/<str:nopinjamnedit>/', edit_pinjam_n, name="edit_pinjam_non_mmahasiswa"),
    path('non-mahasiswa/pinjam/delete/<str:nopinjamn>/', delete_pinjam_n, name="delete_pinjam_n"),
    path('non-mahasiswa/form', form_n, name="form_non_mahasiswa"),
    path('non-mahasiswa/create', tambah_non_mahasiswa, name="tambah_non_mahasiswa"),
    path('non-mahasiswa/edit/<str:noanggotanedit>/', edit_non_mahasiswa, name="edit_non_mahasiswa"),
    path('non-mahasiswa/delete/<str:noanggotan>/', delete_non_mahasiswa, name="delete_non_mahasiswa"),
    path('non-mahasiswa/kembali', non_mahasiswa_kembali, name="kembali_non_mahasiswa"), 
    path('non-mahasiswa/kembali/form', form_kembali_n, name="form_kembali_non_mahasiswa"),  
    path('non-mahasiswa/kembali/create', tambah_kembali_n, name="tambah_kembali_non_mahasiswa"),
    path('non-mahasiswa/kembali/delete/<str:nopinjamn>/', delete_kembali_n, name="delete_kembali_n"),
]
