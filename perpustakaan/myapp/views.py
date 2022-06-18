from multiprocessing import connection
from signal import default_int_handler
from traceback import format_list
from django.shortcuts import render, redirect
from myapp.models import *


# Create your views here.

#menu
def dashboard(request):
    jml_buku = Buku.objects.count()
    mahasiswa  = AnggotaMahasiswa.objects.count()
    non_mahasiswa  = AnggotaNonMahasiswa.objects.count()
    jml_anggota = mahasiswa + non_mahasiswa
    konteks = {
         'jml_buku' : jml_buku,
         'jml_anggota' : jml_anggota
    }
    return render(request, 'menu/dashboard.html', konteks)

def registrasi(request):
    return render(request, 'menu/registrasi.html')

def database(request):
    jml_buku = Buku.objects.count()
    mahasiswa  = AnggotaMahasiswa.objects.count()
    non_mahasiswa  = AnggotaNonMahasiswa.objects.count()
    konteks = {
        'jml_buku' : jml_buku,
        'mahasiswa' : mahasiswa,
        'non_mahasiswa' : non_mahasiswa
    }
    return render(request, 'menu/database.html', konteks)

def transaksi(request):
    jml_pinjam_m = PinjamHeaderMahasiswa.objects.count()
    jml_pinjam_n = PinjamHeaderNonMahasiswa.objects.count()
    jml_kembali_m = KembaliMahasiswa.objects.count()
    jml_kembali_n = KembaliNonMahasiswa.objects.count()
    jml_p = jml_pinjam_m + jml_pinjam_n
    jml_k = jml_kembali_m + jml_kembali_n

    konteks = {
        'pinjam' : jml_p,
        'kembali' : jml_k
        
    }
    return render(request, 'menu/transaksi.html', konteks)

def peminjaman(request):
    return render(request, 'menu/peminjaman.html')

def pengembalian(request):
    return render(request, 'menu/pengembalian.html')

def laporan(request):
    jml_buku = Buku.objects.count()
    mahasiswa  = AnggotaMahasiswa.objects.count()
    non_mahasiswa  = AnggotaNonMahasiswa.objects.count()
    pm = PinjamHeaderMahasiswa.objects.count()
    pn = PinjamHeaderNonMahasiswa.objects.count()
    jml_p = pm + pn
    jml_anggota = mahasiswa + non_mahasiswa
    konteks = {
         'jml_buku' : jml_buku,
         'jml_anggota' : jml_anggota,
         'jmlp' : jml_p
    }
    return render(request, 'menu/laporan.html', konteks)

def laporan_anggota(request):
    anggota_m = AnggotaMahasiswa.objects.all()
    anggota_n = AnggotaNonMahasiswa.objects.all()
    konteks = {
        'anggota_m' : anggota_m,
        'anggota_n' : anggota_n
    }
    return render(request, 'buku/laporan-anggota.html', konteks)

def laporan_buku(request):
    buku = Buku.objects.all()
    konteks = {
        'buku' : buku
    }
    return render(request, 'buku/laporan-buku.html', konteks)

def laporan_denda(request):
    denda_m = KembaliMahasiswa.objects.all()
    denda_n = KembaliNonMahasiswa.objects.all()
    konteks = {
        'denda_m' : denda_m,
        'denda_n' : denda_n,
    }
    return render(request, 'buku/laporan-denda.html', konteks)

def laporan_pinjam(request):
    pinjamm = PinjamHeaderMahasiswa.objects.all()
    pinjamn = PinjamHeaderNonMahasiswa.objects.all()
    detailm = PinjamDetailMahasiswa.objects.all()
    detailn = PinjamDetailNonMahasiswa.objects.all()
    buku = Buku.objects.all()
    konteks = {
        
        'pinjamm' : pinjamm,
        'pinjamn' : pinjamn,
        'detailm' : detailm,
        'detailn' : detailn,
        'buku' :buku
    }
    return render(request, 'buku/laporan-peminjaman.html', konteks)

#buku
def buku(request):
    list_buku = Buku.objects.all()
    konteks = {
        'list_buku' : list_buku,
    }
    return render(request, 'buku/buku.html', konteks)
    
def form_b(request):
    formb_list = Buku.objects.all()
    konteks = {
        'formb_list' : formb_list
    }
    return render(request, 'buku/form-buku.html', konteks)

def tambah_buku(request):
    if request.method == 'POST':

        kodebuku = request.POST['kodebuku']
        judul = request.POST['judul']
        penerbit = request.POST['penerbit']
        pengarang = request.POST['pengarang']
        thnterbit = request.POST['thnterbit']
        kotaterbit = request.POST['kotaterbit']
        bahasa = request.POST['bahasa']
        edisi = request.POST['edisi']


        b = Buku()
        b.kodebuku = kodebuku
        b.judul = judul
        b.penerbit = penerbit
        b.pengarang = pengarang
        b.thnterbit = thnterbit
        b.kotaterbit = kotaterbit
        b.bahasa = bahasa
        b.edisi = edisi
        b.save()


    list_buku = Buku.objects.order_by('kodebuku')
    konteks = {
        'list_buku' : list_buku
    }

    return redirect('/buku/', konteks)


def edit_buku(request, kodebukuedit):
    edit_buku = Buku.objects.filter(kodebuku = kodebukuedit)
    template = 'buku/form-edit-buku.html'
    konteks = {
        'edit_buku' : edit_buku,
    }
    if request.method == "POST":
        print("UPDATE HERE")
        return update_buku(request, kodebukuedit = kodebukuedit )
    else:
        return render(request, template, konteks)

def update_buku(request, kodebukuedit="",action="POST"):
    if request.method == 'POST':
      

        kodebuku = request.POST['kodebuku']
        judul = request.POST['judul']
        penerbit = request.POST['penerbit']
        pengarang = request.POST['pengarang']
        thnterbit = request.POST['thnterbit']
        kotaterbit = request.POST['kotaterbit']
        bahasa = request.POST['bahasa']
        edisi = request.POST['edisi']
      

    Buku.objects.filter(kodebuku = kodebukuedit).update(judul=judul, penerbit=penerbit, pengarang=pengarang,thnterbit=thnterbit,
    kotaterbit=kotaterbit, bahasa=bahasa, edisi=edisi)
    return redirect('/buku')

def delete_buku(request, kodebuku=""):
    if request.method == 'GET':
        Buku.objects.filter(kodebuku = kodebuku).delete()
        return redirect('/buku/')
#mahasiswa
def mahasiswa(request):
    list_mahasiswa = AnggotaMahasiswa.objects.all()
    konteks = {
        'list_mahasiswa' : list_mahasiswa,
    }
    return render(request, 'anggota/mahasiswa.html', konteks)

def form_m(request):
    formm_list = AnggotaMahasiswa.objects.all()
    konteks = {
        'formm_list' : formm_list
    }
    return render(request, 'anggota/form-mahasiswa.html', konteks)

def form_pinjam_m(request):
    return render(request, 'anggota/form-pinjam-mahasiswa.html')

def tambah_mahasiswa_pinjam(request):
    if request.method == 'POST':
        nopinjam = request.POST['nopinjam']
        noanggota = request.POST['noanggota']
        tglpjm = request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        kdpetugas = request.POST['kdpetugas']
        


        p = PinjamHeaderMahasiswa()
        p.noanggotam_id = noanggota
        p.nopinjamm = nopinjam
        p.tglkembali = tglkmb
        p.tglpinjam = tglpjm
        p.kodepetugas_id = kdpetugas
        p.save()

    if request.method == 'POST':
        kdbuku = request.POST['kdbuku']
        judul = request.POST['judul']
        pengarang = request.POST['pengarang']
        penerbit = request.POST['penerbit']
        jml = request.POST['jumlah']
 
        d = PinjamDetailMahasiswa()
        d.kodebuku_id = kdbuku
        d.judul = judul
        d.pengarang = pengarang
        d.penerbit = penerbit
        d.jml = jml
        d.save()

    list_pinjam = PinjamHeaderMahasiswa.objects.order_by('noanggotam')
    konteks = {
        'list_pinjam' : list_pinjam
    }

    return redirect('/mahasiswa/pinjam', konteks)

def edit_pinjam_m(request, nopinjammedit):
    edit_pinjam = PinjamHeaderMahasiswa.objects.filter(nopinjamm = nopinjammedit)
    template = 'anggota/form-edit-pinjam-mahasiswa.html'
    konteks = {
        'edit_pinjam' : edit_pinjam,
    }
    if request.method == "POST":
        print("UPDATE HERE")
        return update_pinjam_m(request, nopinjammedit = nopinjammedit  )
    else:
        return render(request, template, konteks)

def update_pinjam_m(request, nopinjammedit=""):
    if request.method == 'POST':
        nopinjam = request.POST['nopinjam']
        noanggota = request.POST['noanggota']
        tglpjm = request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        kdpetugas = request.POST['kdpetugas']
        
    PinjamHeaderMahasiswa.objects.filter(nopinjamm = nopinjammedit).update(nopinjamm = nopinjam, noanggotam = noanggota, 
    tglpinjam = tglpjm, tglkembali = tglkmb, kodepetugas = kdpetugas)
    return redirect('/mahasiswa/pinjam')

def delete_pinjam_m(request, nopinjamm=""):
    if request.method == 'GET':
        PinjamHeaderMahasiswa.objects.filter(nopinjamm = nopinjamm).delete()
        return redirect('/mahasiswa/pinjam')

def form_kembali_m(request):
    list_kembali = PinjamHeaderMahasiswa.objects.all()
    konteks = {
        'list_kembali' : list_kembali
    }
    return render(request, 'anggota/form-kembali-mahasiswa.html', konteks)

def tambah_kembali_m(request):
    if request.method == 'POST':
        nokembali = request.POST['nokembali']
        nopinjam = request.POST['nopinjam']
        tglpjm= request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        dikmb = request.POST['dikmb']
        denda = request.POST['denda']


        k = KembaliMahasiswa()
        k.nokembalim = nokembali
        k.nopinjamm_id = nopinjam
        k.tglkembali = dikmb
        k.denda = denda
        
        k.save()

    list_kembali = KembaliMahasiswa.objects.order_by('nopinjamm')
    konteks = {
        'list_kembali' : list_kembali
    }

    return redirect('/mahasiswa/kembali', konteks)
    
def delete_kembali_m(request, nopinjamm=""):
    if request.method == 'GET':
        KembaliMahasiswa.objects.filter(nopinjamm = nopinjamm).delete()
        return redirect('/mahasiswa/kembali')

def mahasiswa_pinjam(request):
    list_pinjam = PinjamHeaderMahasiswa.objects.all()
    konteks = {
        'list_pinjam' : list_pinjam
    }
    return render(request, 'anggota/pinjam-mahasiswa.html',konteks )

def mahasiswa_kembali(request):
    list_kembali = KembaliMahasiswa.objects.all()
    konteks = {
        'list_kembali' : list_kembali
    }
    return render(request, 'anggota/kembali-mahasiswa.html', konteks )

def tambah_mahasiswa(request):
    if request.method == 'POST':
       
        noanggota = request.POST['no_anggota']
        nim = request.POST['nim']
        nama = request.POST['nama_lengkap']
        jeniskelamin = request.POST['jenis_kelamin']
        jabatan = request.POST['jurusan']
        tmplahir = request.POST['tmp_lahir']
        tgllahir = request.POST['tgl_lahir']
        alamat = request.POST['alamat']
        notelp = request.POST['no_telp']
        kode_pos = request.POST['Kode_pos']
        tahundaftar = request.POST['tgl_daftar']

        m = AnggotaMahasiswa()
        m.noanggotam = noanggota
        m.nim = nim
        m.namaanggota = nama
        m.jeniskelamin = jeniskelamin
        m.jurusan = jabatan
        m.tempatlahir = tmplahir
        m.tanggallahir = tgllahir
        m.alamat = alamat
        m.notelp = notelp
        m.kodepos = kode_pos
        m.angkatan = tahundaftar
        m.save()

    mahasiswa = AnggotaMahasiswa.objects.order_by('noanggotam')
    konteks = {
        'list_mahasiswa' : mahasiswa
    }
    return redirect('/mahasiswa/', konteks)


def edit_mahasiswa(request, noanggotamedit):
    edit_mahasiswa = AnggotaMahasiswa.objects.filter(noanggotam = noanggotamedit)
    template = 'anggota/form-edit-mahasiawa.html'
    konteks = {
        'edit_mahasiswa' : edit_mahasiswa,
    }
    if request.method == "POST":
        print("UPDATE HERE")
        return update_mahasiswa(request, noanggotamedit = noanggotamedit )
    else:
        return render(request, template, konteks)

def update_mahasiswa(request, noanggotamedit=""):
    if request.method == 'POST':
       
        noanggota = request.POST['no_anggota']
        nim = request.POST['nim']
        nama = request.POST['nama_lengkap']
        jeniskelamin = request.POST['jenis_kelamin']
        jurusan = request.POST['jurusan']
        tmplahir = request.POST['tmp_lahir']
        tgllahir = request.POST['tgl_lahir']
        alamat = request.POST['alamat']
        kode_pos = request.POST['Kode_pos']
        angkatan = request.POST['tgl_daftar']
        notlp = request.POST['no_telp']
      

    AnggotaMahasiswa.objects.filter(noanggotam = noanggotamedit).update(nim=nim,namaanggota=nama,notelp=notlp,jeniskelamin=jeniskelamin,jurusan=jurusan,tempatlahir=tmplahir,tanggallahir=tgllahir,alamat=alamat,kodepos=kode_pos,angkatan=angkatan)
    return redirect('/mahasiswa/')

def delete_mahasiswa(request, noanggotam=""):
    if request.method == 'GET':
        AnggotaMahasiswa.objects.filter(noanggotam = noanggotam).delete()
        return redirect('/mahasiswa/')


#non-mahasiswa
def non_mahasiswa(request):
    list_non_mahasiswa = AnggotaNonMahasiswa.objects.all()
    konteks = {
        'list_non_mahasiswa' : list_non_mahasiswa,
    }
    return render(request, 'anggota/non-mahasiswa.html', konteks)
    
def form_n(request):
    formn_list = AnggotaNonMahasiswa.objects.all()
    konteks = {
        'formn_list' : formn_list
    }
    return render(request, 'anggota/form-non-mahasiswa.html', konteks)

def tambah_non_mahasiswa(request):
    if request.method == 'POST':
        noanggota = request.POST['no_anggota']
        nip = request.POST['nip']
        nama = request.POST['nama_lengkap']
        jeniskelamin = request.POST['jenis_kelamin']
        jabatan = request.POST['jabatan']
        tmplahir = request.POST['tmp_lahir']
        tgllahir = request.POST['tgl_lahir']
        alamat = request.POST['alamat']
        kode_pos = request.POST['Kode_pos']
        tahundaftar = request.POST['tgl_daftar']
        notlp = request.POST['no_telp']
     

        n = AnggotaNonMahasiswa()
        n.noanggotan = noanggota
        n.nip = nip
        n.namaanggota = nama
        n.jeniskelamin = jeniskelamin
        n.jabatan = jabatan
        n.tempatlahir = tmplahir
        n.tanggallahir = tgllahir
        n.alamat = alamat
        n.kodepos = kode_pos
        n.tgldaftar = tahundaftar
        n.notelp = notlp
        n.save()

    non_mahasiswa = AnggotaNonMahasiswa.objects.order_by('noanggotan')
    konteks = {
        'list_non_mahasiswa' : non_mahasiswa
    }

    return redirect('/non-mahasiswa/', konteks)

def edit_non_mahasiswa(request, noanggotanedit):
    edit_non_mahasiswa = AnggotaNonMahasiswa.objects.filter(noanggotan = noanggotanedit)
    template = 'anggota/form-edit-non-mahasiswa.html'
    konteks = {
        'edit_non_mahasiswa' : edit_non_mahasiswa,
    }
    if request.method == "POST":
        print("UPDATE HERE")
        return update_non_mahasiswa(request, noanggotanedit = noanggotanedit )
    else:
        return render(request, template, konteks)


def update_non_mahasiswa(request, noanggotanedit="",action="POST"):
    if request.method == 'POST':
        noanggota = request.POST['no_anggota']
        nim = request.POST['nim']
        nama = request.POST['nama_lengkap']
        jeniskelamin = request.POST['jenis_kelamin']
        jurusan = request.POST['jurusan']
        tmplahir = request.POST['tmp_lahir']
        tgllahir = request.POST['tgl_lahir']
        alamat = request.POST['alamat']
        kode_pos = request.POST['Kode_pos']
        angkatan = request.POST['tgl_daftar']
        notlp = request.POST['no_telp']

    AnggotaNonMahasiswa.objects.filter(noanggotan = noanggotanedit).update(nip=nim,namaanggota=nama,jeniskelamin=jeniskelamin,notelp=notlp,jabatan=jurusan,tempatlahir=tmplahir,tanggallahir=tgllahir,alamat=alamat,kodepos=kode_pos,tgldaftar=angkatan)
    return redirect('/non-mahasiswa/')

def delete_non_mahasiswa(request, noanggotan=""):
    if request.method == 'GET':
        AnggotaNonMahasiswa.objects.filter(noanggotan = noanggotan).delete()
        return redirect('/non-mahasiswa/')

def form_pinjam_n(request):
    form_list = PinjamHeaderNonMahasiswa.objects.all()
    konteks = {
        'form_list' : form_list
    }
    return render(request, 'anggota/form-pinjam-non-mahasiswa.html', konteks)

def tambah_non_mahasiswa_pinjam(request):
    if request.method == 'POST':
        nopinjam = request.POST['nopinjam']
        noanggota = request.POST['noanggota']
        tglpjm = request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        kdpetugas = request.POST['kdpetugas']
    
        p = PinjamHeaderNonMahasiswa()
        p.noanggotan_id = noanggota
        p.nopinjamn = nopinjam
        p.tglkembali = tglkmb
        p.tglpinjam = tglpjm
        p.kodepetugas_id = kdpetugas
        p.save()

    if request.method == 'POST':
        kdbuku = request.POST['kdbuku']
        judul = request.POST['judul']
        pengarang = request.POST['pengarang']
        penerbit = request.POST['penerbit']
        jml = request.POST['jumlah']
 
        d = PinjamDetailNonMahasiswa()
        d.kodebuku_id = kdbuku
        d.judul = judul
        d.pengarang = pengarang
        d.penerbit = penerbit
        d.jml = jml
        d.save()

    list_pinjam = PinjamHeaderNonMahasiswa.objects.order_by('noanggotan')
    list_detail = PinjamDetailNonMahasiswa.objects.all()
    konteks = {
        'list_pinjam' : list_pinjam,
        'list_detail' : list_detail
    }

    return redirect('/non-mahasiswa/pinjam', konteks)

def edit_pinjam_n(request, nopinjamnedit):
    edit_pinjam = PinjamHeaderNonMahasiswa.objects.filter(nopinjamn = nopinjamnedit)
    template = 'anggota/form-edit-pinjam-non-mahasiswa.html'
    konteks = {
        'edit_pinjam' : edit_pinjam,
    }
    if request.method == "POST":
        print("UPDATE HERE")
        return update_pinjam_n(request, nopinjamnedit = nopinjamnedit  )
    else:
        return render(request, template, konteks)

def update_pinjam_n(request, nopinjamnedit=""):
    if request.method == 'POST':
        nopinjam = request.POST['nopinjam']
        noanggota = request.POST['noanggota']
        tglpjm = request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        kdpetugas = request.POST['kdpetugas']
        
    PinjamHeaderNonMahasiswa.objects.filter(nopinjamn = nopinjamnedit).update(nopinjamn = nopinjam, noanggotan = noanggota, 
    tglpinjam = tglpjm, tglkembali = tglkmb, kodepetugas = kdpetugas)
    return redirect('/non-mahasiswa/pinjam')

def delete_pinjam_n(request, nopinjamn=""):
    if request.method == 'GET':
        PinjamHeaderNonMahasiswa.objects.filter(nopinjamn = nopinjamn).delete()
        return redirect('/non-mahasiswa/pinjam')

def non_mahasiswa_pinjam(request):
    list_pinjam = PinjamHeaderNonMahasiswa.objects.all()
    konteks = {
        'list_pinjam' : list_pinjam
    }
    return render(request, 'anggota/pinjam-non-mahasiswa.html',konteks )

def non_mahasiswa_kembali(request):
    list_kembali = KembaliNonMahasiswa.objects.all()
    konteks = {
        'list_kembali' : list_kembali
    }
    return render(request, 'anggota/kembali-non-mahasiswa.html', konteks )

def form_kembali_n(request):
    list_kembali = PinjamHeaderNonMahasiswa.objects.all()
    konteks = {
        'list_kembali' : list_kembali
    }
    return render(request, 'anggota/form-kembali-non-mahasiswa.html',konteks)

def tambah_kembali_n(request):
    if request.method == 'POST':
        nokembali = request.POST['nokembali']
        nopinjam = request.POST['nopinjam']
        tglpjm= request.POST['tglpjm']
        tglkmb = request.POST['tglkmb']
        dikmb = request.POST['dikmb']
        denda = request.POST['denda']


        k = KembaliNonMahasiswa()
        k.nokembalin = nokembali
        k.nopinjamn_id = nopinjam
        k.tglkembali = dikmb
        k.denda = denda
        
        k.save()

    list_kembali = KembaliNonMahasiswa.objects.order_by('nopinjamn')
    konteks = {
        'list_kembali' : list_kembali
    }

    return redirect('/non-mahasiswa/kembali', konteks)

def delete_kembali_n(request, nopinjamn=""):
    if request.method == 'GET':
        KembaliNonMahasiswa.objects.filter(nopinjamn = nopinjamn).delete()
        return redirect('/non-mahasiswa/kembali')

