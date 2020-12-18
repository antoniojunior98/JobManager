<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MailJob extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;
    private $subjectMatter;
    private $title;
    private $description;
    private $link;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($subjectMatter, $title, $description, $link)
    {
        $this->subjectMatter = $subjectMatter;
        $this->title = $title;
        $this->description = $description;
        $this->link = $link;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subjectMatter)->markdown('emails.job', [
            "subjectMatter" => $this->subjectMatter,
            "title" => $this->title,
            "description" => $this->description,
            "link" => $this->link
        ]);
    }
}
