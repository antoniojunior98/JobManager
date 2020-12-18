<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MailUser extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;
    private $subjectMatter;
    private $title;
    private $message;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($subjectMatter, $title, $message)
    {
        $this->subjectMatter = $subjectMatter;
        $this->title = $title;
        $this->message = $message;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subjectMatter)->markdown('emails.user', [
            "subjectMatter" => $this->subjectMatter,
            "title" => $this->title,
            "message" => $this->message
        ]);
    }
}


