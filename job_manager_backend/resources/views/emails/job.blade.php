@component('mail::message')
{{$title}}

{{$description}}

@component('mail::button', ['url' => $link])
Ver
@endcomponent

Obrigado,<br>
{{ config('app.name') }}
@endcomponent
