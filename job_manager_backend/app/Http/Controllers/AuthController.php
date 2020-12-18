<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\MailUser;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth.api', ['except' => ['store','login']]);
    }
    
    public function unauthorized(){
        return response()->json(['error'=>'Unauthorized'], 401);
    }
    
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);
        $validate = Validator::make($credentials, [
            'email' => ['required', 'email'],
            'password' => ['required', 'string']
        ]);

        if($validate->fails()){
            return response()->json(['error' => $validate->errors()], 422);
        }

        if (! $token = Auth::attempt($credentials)) {
            
            return $this->unauthorized();
        }

        return $this->respondWithToken($token);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->data = $request->only([
            'name',
            'email',
            'password'
        ]);

        $validate = Validator::make($this->data, [
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:8|max:20',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $user = new User();
        $user->name = $this->data['name'];
        $user->email = $this->data['email'];
        $user->password = password_hash($this->data['password'], PASSWORD_DEFAULT);
        if ($user->save()) {
            $subjectMatter = "Bem Vindo!";
            $title = "{$user->name}";
            $message = "Seja bem vindo ao Job Manager!";
            Mail::to($user->email)->send(new MailUser($subjectMatter, $title, $message));

            return response()->json(['success' => 'Usuário criado com sucesso!'], 201);
        }
        return response()->json(['error' => 'Não foi possivel criar o usuário, tente novamente mais tarde!'], 500);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        Auth::logout();

        return response()->json(['message' => 'Successfully logged out'], 200);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(Auth::refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer'
        ]);
    }

    
}

