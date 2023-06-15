<?php

namespace App\Http\Controllers;

use App\Models\Start;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function signup(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            "login" => true
        ]);
    }

    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Invalid login details',
                "login" => false
            ], 401);
        }

        $user = User::where('email', $request['email'])->firstOrFail();

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            "login" => true
        ]);
    }

    public function me(Request $request)
    {

        if (Auth::check()) {

            $user = Auth::user();

            $is_pref = Start::NumRowsDB("preference", ['userid' => $user['id']]);

            if ($is_pref > 0) {

                $table = DB::table("preference");

                $user['pref'] = ($table->select("sources", "categories", "authors")->distinct()->where("userid", "=", $user['id'])->get());
            } else {

                $user['pref'] = [
                    "sources" => "",
                    "categories" => "",
                    "authors" => ""
                ];
            }

            return response()->json([
                'user' => $user,
                "login" => true
            ]);
        } else {

            return response()->json([
                'message' => 'Invalid login details',
                "login" => false
            ], 401);
        }
    }

    public function logout(Request $request)
    {

        auth('sanctum')->user()->tokens()->delete();

        return [
            'message' => 'Logged out',
            "login" => false
        ];
    }
}

// http://127.0.0.1:8000/api/signup

// http://127.0.0.1:8000/api/login