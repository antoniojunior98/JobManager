@component('mail::message')
{{$title}}

{{$message}}

Obrigado,<br>
{{ config('app.name') }}
@endcomponent
