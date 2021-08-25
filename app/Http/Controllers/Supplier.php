<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//import library session
use Illuminate\Support\Facades\Session;

//import lib JWT
use \Firebase\JWT\JWT;

//import lib response
use Illuminate\Response;

//import lib validasi
use Illuminate\Support\Facades\Validator;

//import fungsi encrypt
use Illuminate\Contracts\Encryption\DecryptException;

//import model supplier
use App\M_Supplier;

//import model admin
use App\M_Admin;

class Supplier extends Controller
{
    //

    public function login(){
    	return view('login_supp.login');
    }

    public function masukSupplier(Request $request){
    	$this->validate($request,
    		[
    			'email' => 'required',
    			'password' => 'required',
    		]
    	);
    	
    	$cek = M_Supplier::where('email',$request->email)->count();

    	$supp = M_Supplier::where('email',$request->email)->get();

    	if($cek > 0){
    		//email terdaftar
    		foreach($supp as $su){
    			if(decrypt($su->password) == $request->password){
    				//jika password benar
    				$key = env('APP_KEY');

    				$data = array(
    					"id_supplier" => $su->id_supplier
    				);

    				$jwt = JWT::encode($data, $key);

    				if(M_Supplier::where('id_supplier', $su->id_supplier)->update(
    					[
    						'token' => $jwt
    					]
    				)){

    					//kalau berhasil update token di database
    					Session::put('token', $jwt);

    					return redirect('/listSupplier');

    				}else{
    					return redirect('/login')->with('gagal','Token Gagal Diupdate');

    				}

    			}else{
    				//jika password salah
    				return redirect('/login')->with('gagal','Password Tidak Sama');
    			}
    		}

    	}else{
    		return redirect('/login')->with('gagal','Email Tidak Terdaftar');
    	}
    }

    public function supplierKeluar(){

    	$token = Session::get('token');

    	if(M_Supplier::where('token', $token)->update(
    		[
    			'token' => 'keluar',
    		]
    	)){
    		Session::put('token', "");
    		return redirect('/');

    	}else{
    		return redirect('/listSupplier')->with('gagal','Anda Gagal Logut');
    	}
    }

    public function listSup(){
        $token = Session::get('token');

        $tokenDb = M_Admin::where('token',$token)->count();

        if($tokenDb > 0){

            $data['adm'] = M_Admin::where('token',$token)->first();
            $data['supplier'] = M_Supplier::paginate(15);
            return view('admin.listSup',$data);

        }else{

            return redirect('/masukAdmin')->with('gagal','Anda Sudah Logout, Silahkan Login Kembali');
        }
    }

    public function nonAktif($id){

        $token = Session::get('token');

        $tokenDb = M_Admin::where('token',$token)->count();

        if($tokenDb > 0){

            if(M_Supplier::where('id_supplier',$id)->update(
                [
                    "status" => "0"
                ])){
                return redirect('/listSup')->with('berhasil','Data Berhasil Diupdate');
            }else{
                return redirect('/listSup')->with('gagal','Data Gagal Diupdate');
            }

        }else{

            return redirect('/masukAdmin')->with('gagal','Anda Sudah Logout, Silahkan Login Kembali');
        }
    }

    public function aktif($id){

        $token = Session::get('token');

        $tokenDb = M_Admin::where('token',$token)->count();

        if($tokenDb > 0){

            if(M_Supplier::where('id_supplier',$id)->update(
                [
                    "status" => "1"
                ])){
                return redirect('/listSup')->with('berhasil','Data Berhasil Diupdate');
            }else{
                return redirect('/listSup')->with('gagal','Data Gagal Diupdate');
            }

        }else{

            return redirect('/masukAdmin')->with('gagal','Anda Sudah Logout, Silahkan Login Kembali');
        }
    }

    public function ubahPassword(Request $request){


        $token = Session::get('token');
        $tokenDb = M_Supplier::where('token',$token)->count();


        if($tokenDb > 0){
            $key = env('APP_KEY');

            $sup = M_Supplier::where('token',$token)->first();

            $decode = JWT::decode($token, $key, array('HS256'));
            $decode_array = (array) $decode;

            if(decrypt($sup->password) == $request->passwordlama){

                if(M_Supplier::where('id_supplier',$decode_array['id_supplier'])->update(
                [
                    "password" => encrypt($request->password)
                ])){
                return redirect('/login')->with('gagal','Password Berhasil Diupdate');
                }else{
                return redirect('/login')->with('gagal','Password Gagal Diupdate');
                }
            }else{
                return redirect('/login')->with('gagal','Password Gagal Diupdate, Password Lama Tidak Sama');
            }         

        }else{

            return redirect('/login')->with('gagal','Anda Sudah Logout, Silahkan Login Kembali');
        }
    }
}
