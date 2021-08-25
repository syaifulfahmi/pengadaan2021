<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});
*/

Route::get('/','Home@index');
//route registrasi
Route::get('/registrasi','Registrasi@index');

//route simpan data registrasi
Route::post('/regis','Registrasi@regis');

//route login halaman supplier
Route::get('/login','Supplier@login');

//route login supplier
Route::get('/login','Supplier@login');
Route::post('/masukSupplier','Supplier@masukSupplier');

//route logout halaman supplier
Route::get('/supplierKeluar','Supplier@supplierKeluar');

//route login admin
Route::get('/masukAdmin','Admin@index');

//route login admin
Route::post('/loginAdmin','Admin@loginAdmin');

Route::get('/pengajuan','Pengajuan@pengajuan');

Route::get('/keluarAdmin','Admin@keluarAdmin');

Route::get('/listAdmin','Admin@listAdmin');

Route::post('/tambahAdmin','Admin@tambahAdmin');

Route::post('/ubahAdmin','Admin@ubahAdmin');

Route::get('/hapusAdmin/{id}','Admin@hapusAdmin');

Route::get('/listPengadaan','Pengadaan@index');

Route::post('/tambahPengadaan','Pengadaan@tambahPengadaan');

Route::get('/hapusGambar/{id}','Pengadaan@hapusGambar');

Route::post('/uploadGambar','Pengadaan@uploadGambar');

Route::get('/hapusPengadaan/{id}','Pengadaan@hapusPengadaan');

Route::post('/ubahPengadaan','Pengadaan@ubahPengadaan');

Route::get('/listSupplier','Pengadaan@listSupplier');

Route::post('/tambahPengajuan','Pengajuan@tambahPengajuan');

Route::get('/terimaPengajuan/{id}','Pengajuan@terimaPengajuan');

Route::get('/tolakPengajuan/{id}','Pengajuan@tolakPengajuan');

Route::get('/riwayatku','Pengajuan@riwayatku');

Route::post('/tambahLaporan','Pengajuan@tambahLaporan');

Route::get('/laporan','Pengajuan@laporan');

Route::get('/selesaiPengajuan/{id}','Pengajuan@selesaiPengajuan');

Route::get('/pengajuanSelesai','Pengajuan@pengajuanSelesai');

Route::get('/tolakLaporan/{id}','Pengajuan@tolakLaporan');

Route::get('/listSup','Supplier@listSup');

Route::get('/nonAktif/{id}','Supplier@nonAktif');

Route::get('/aktif/{id}','Supplier@aktif');

Route::post('/ubahPasswordSup','Supplier@ubahPassword');

Route::post('/ubahPasswordAdm','Admin@ubahPassword');