<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//import lib validasi
use Illuminate\Support\Facades\Validator;

//import fungsi encrypt
use Illuminate\Contracts\Encryption\DecryptException;

//import library session
use Illuminate\Support\Facades\Session;

//import model supplier
use App\M_Supplier;

class Registrasi extends Controller
{
    //
    public function index(){

        $token = Session::get('token');

        $tokenDb = M_Supplier::where('token', $token)->count();

        if($tokenDb > 0){
            $data['token'] = $token;

        }else{
            $data['token'] = 'kosong';

        }
    	return view('registrasi.registrasi',$data);
    }

    public function regis(Request $request){

    	$this->validate($request,
    		[
    			'nama_usaha' => 'required',
    			'email' => 'required',
    			'alamat' => 'required',
    			'npwp' => 'required',
    			'password' => 'required'
    		]

    	);

    	if(M_Supplier::create(
    		[
    			'nama_usaha' => $request->nama_usaha,
    			'email' => $request->email,
    			'alamat' => $request->alamat,
    			'no_npwp' => $request->npwp,
    			'password' => encrypt($request->password)
    		]
    	)){
    		return redirect('/registrasi')->with('berhasil','Data Berhasil Disimpan');

    	}else{
    		return redirect('/registrasi')->with('gagal','Data Gagal Disimpan');

    	}
    }
}
