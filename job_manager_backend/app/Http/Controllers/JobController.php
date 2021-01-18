<?php

namespace App\Http\Controllers;

use App\Mail\MailJob;
use App\Models\Job;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class JobController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jobs = Job::paginate(8);
        foreach ($jobs as $key => $job) {
            $status = $job->status;
            if ($status == 1) {
                $status = "Em andamento";
            } else {
                $status = "Concluido";
            }
            $jobs[$key]['status'] = $status;
        }

        return response()->json($jobs, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->only([
            'name',
            'description',
            'delivery_date',
        ]);

        $validate = Validator::make($data, [
            'name' => 'required|string|unique:job|max:30',
            'description' => 'required|string|min:10',
            'delivery_date' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $job = new Job();
        $job->status = 1;
        $job->name = $data['name'];
        $job->description = $data['description'];
        $job->delivery_date = $data['delivery_date'];
        if ($job->save()) {
            $users = User::all();
            $subjectMatter = "Novo Job";
            $title = "{$job->name}";
            $description = "{$job->description}";
            $link = "http://localhost:8080/#/job/{$job->id}/show";
            foreach($users as $user){
                Mail::to($user)->send(new MailJob($subjectMatter, $title, $description, $link));
            }

            return response()->json(['success' => 'Job criado com sucesso!'], 201);
        }
        return response()->json(['error' => 'Não foi possivel criar o job, tente novamente mais tarde!'], 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Job $job)
    {
        $status = $job->status;
        if ($status == 1) {
            $status = "Em andamento";
        } elseif ($status == 2) {
            $status = "Concluido";

            $user = $job->user()->first();
            $job['userName'] = $user['name'];
        }

        $job['status'] = $status;

        return response()->json($job, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Job $job, Request $request)
    {
        $user = $request->user();
        $data = $request->only([
            'description',
            'delivery_date'
        ]);
    
        $validate = Validator::make($data, [
            'description' => 'required|string|min:10',
            'delivery_date' => 'required|date',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $job->id_user = $user->id;
        $job->description = $data['description'];
        $job->delivery_date = $data['delivery_date'];

        if ($job->save()) {

            $users = User::all();
            $subjectMatter = "Job Atualizado";
            $title = "{$job->name}";
            $description = "Job Atualizado por {$user->name}";
            $link = "http://localhost:8080/#/job/{$job->id}/show";
            foreach($users as $user){
                Mail::to($user)->send(new MailJob($subjectMatter, $title, $description, $link));
            }

            return response()->json(['success' => 'Job atualizado com sucesso!'], 201);
        }
        return response()->json(['error' => 'Não foi possivel atualizar o trabalho, tente novamente mais tarde!'], 500);
    }

    public function conclude(Job $job, Request $request)
    {  
        $user = $request->user();
       
        if (!$job) {
            return response()->json(['error' => 'Não foi possivel atualizar o job, porque o mesmo não foi encontrado!'], 404);
        }
        $job->finished_in = now();
        $job->status = 2;
        $job->id_user = $user->id;
        $job->save();

        $users = User::all();
        $subjectMatter = "Job Atualizado";
        $title = "{$job->name}";
        $description = "Job Concluido por {$user->name} em {$job->finished_in}";
        $link = "http://localhost:8080/#/job/{$job->id}/show";
        foreach($users as $user){
            Mail::to($user)->send(new MailJob($subjectMatter, $title, $description, $link));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Job $job, Request $request)
    {
        $user = $request->user();
        $job->delete();

        $users = User::all();
        $subjectMatter = "Job Excluido";
        $title = "{$job->name}";
        $description = "Job Excluido por {$user->name}";
        $link = "http://localhost:8080/#/job/{$job->id}/show";

        foreach($users as $user){
            Mail::to($user)->send(new MailJob($subjectMatter, $title, $description, $link));
        }
    }
}
