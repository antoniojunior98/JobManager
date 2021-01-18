<?php

namespace App\Http\Controllers;

use App\Mail\MailUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    protected $user;
    protected $data;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::paginate(8);
        return response()->json($users, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return response()->json($user, 200);
    }

    private function verifyEmail($validate): void
    {
        $validate->after(function ($validate) {
            if ($this->user->email != $this->data['email']) {
                $hasEmail = User::where("email", $this->data['email'])->get();
                if ($hasEmail === 0) {
                    $this->user->email = $this->data['email'];
                    return;
                }
                $validate->errors()->add('email', __('validation.unique', [
                    'attribute' => 'email',
                ]));
                return;
            }
            $this->user->email = $this->data['email'];
        });
    }

    private function verifyPassword($validate)
    {
        $validate->after(function ($validate) {
            if (!empty($this->data['password']) && !empty($this->data['current_password'])) {
                $password = $this->data['password'];
                $currentPassword = $this->data['current_password'];

                if (strlen($password) >= 8) {

                    if (!Hash::check($currentPassword, $this->user->password)) {
                        $validate->errors()->add('current_password', 'Senha atual incorreta!');
                        return;
                    }
                    if ($currentPassword == $password) {
                        $validate->errors()->add('password', 'Senha não pode ser a mesma da qual está sendo utilizada!');
                        return;
                    }
                    $this->user->password = Hash::make($this->data['password']);
                    return;
                }
                $validate->errors()->add('password', __('validation.min.string', [
                    'attribute' => 'password',
                    'min' => 8,
                ]));
                return;
            }
        });
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $this->data = $request->only([
            'name',
            'email',
            'current_password',
            'password',
        ]);

        $validate = Validator::make($this->data, [
            'name' => 'required|string|max:150',
            'email' => 'required|email',
        ]);

        $this->user->name = $this->data['name'];
        $this->verifyEmail($validate);
        $this->verifyPassword($validate);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        if ($this->user->save()) {
            $subjectMatter = "Usuário Atualizado";
            $title = "Usuário Atualizado";
            $message = "Seu usuário foi atualizado!";
            Mail::to($this->user->email)->send(new MailUser($subjectMatter, $title, $message));

            return response()->json(['success' => 'Usuário atualizado com sucesso!'], 201);
        }
        return response()->json(['error' => 'Não foi possivel atualizar o usuário, tente novamente mais tarde!'], 500);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
            $user->delete();
            $subjectMatter = "Usuário Excluido";
            $title = "Usuário Excluido";
            $message = "Seu usuário foi excluido!";
            Mail::to($user->email)->send(new MailUser($subjectMatter, $title, $message));
    }
}

