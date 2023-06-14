<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


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

            return response()->json([
                "reqi" => $request->user(),
                'user' => Auth::user(),
                "login" => true
            ]);
        } else {

            return response()->json([
                'message' => 'Invalid login details',
                "login" => false
            ], 401);
        }

        // return $request->user();

        // $user = Auth::user(); // Retrieve the currently authenticated user...
        // $id = Auth::id(); // Retrieve the currently authenticated user's ID...

        // $user = $request->user(); // returns an instance of the authenticated user...
        // $id = $request->user()->id; // Retrieve the currently authenticated user's ID...

        // // return ['user' => $user, 'id' => $id];

        // $user = auth()->user(); // Retrieve the currently authenticated user...
        // $id = auth()->id();

        // return $request->user();
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return [
            'message' => 'Tokens Revoked',
            "login" => true
        ];
    }
}

// http://127.0.0.1:8000/api/signup

// http://127.0.0.1:8000/api/login