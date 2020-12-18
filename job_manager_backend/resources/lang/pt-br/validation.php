<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'date' => 'data inválida.',
    'max' => [
        'numeric' => 'O campo não pode ser maior que :max.',
        'file' => 'O campo não pode ser maior que :max kilobytes.',
        'string' => 'O campo não pode ser maior que :max caracteres.',
        'array' => 'O campo não pode ter mais do que :max itens.',
    ],
   
    'min' => [
        'numeric' => 'O campo deve ser pelo menos :min.',
        'file' => 'O campo deve ter pelo menos :min kilobytes.',
        'string' => 'O campo deve ter pelo menos :min caracteres.',
        'array' => 'O campo deve ter pelo menos :min itens.',
    ],
    'required' => 'O campo é obrigatório.',
    'string' => 'O :attribute deve ser uma string.',
    'unique' => 'O :attribute já foi usado.',
    'email' => 'O :attribute deve ser um endereço de e-mail válido.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [],

];
