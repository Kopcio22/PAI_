<?php

namespace Nieruchomosci\Model;

use Laminas\Mail\Message;
use Laminas\Mail\Transport\Smtp as SmtpTransport;
use Laminas\Mail\Transport\SmtpOptions;
use Laminas\Mime\Message as MimeMessage;
use Laminas\Mime\Part as MimePart;

class Zapytanie
{
    private array $smtpTransportConfig;
    private array $from;

    public function __construct(array $config)
    {
        $this->from = $config['from'];
        unset($config['from']);

        $this->smtpTransportConfig = $config;
    }

    public function wyslij($daneOferty, $tresc, $email, $telefon)
    {
        $transport = new SmtpTransport();
        $options = new SmtpOptions($this->smtpTransportConfig);
        $transport->setOptions($options);

        $part = new MimePart("Klient wyraził zainteresowanie ofertą numer *$daneOferty[numer]* o treści:\n\n$tresc \n\nTelefon kontaktowy: $telefon \n\nEmail: $email");
        $part->type = 'text/plain';
        $part->charset = 'utf-8';

        $body = new MimeMessage();
        $body->setParts([$part]);

        $message = new Message();
        $message->setEncoding('UTF-8');
        $message->setFrom($this->from['email'], $this->from['name']); // konto do wysyłania maili z serwisu
        $message->addTo('matejkop@wit.edu.pl', "Odbiorca"); // osoba obsługująca zgłoszenia
        $message->setSubject("Zainteresowanie ofertą");
        $message->setBody($body);

        try {
            $transport->send($message);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }


    public function wyslijPdf($daneOferty, $email, $pdf) {
        $transport = new SmtpTransport();
        $options = new SmtpOptions($this->smtpTransportConfig);
        $transport->setOptions($options);

        $part = new MimePart("W załączniku przesyłam ofertę *$daneOferty[numer]* ");
        $part->type = 'text/plain';
        $part->charset = 'utf-8';

        $pdf = new MimePart($pdf);
        $pdf->type = 'application/pdf';
        $pdf->charset = 'utf-8';

        $body = new MimeMessage();
        $body->setParts([$part, $pdf]);

        $message = new Message();
        $message->setEncoding('UTF-8');
        $message->setFrom($this->from['email'], $this->from['name']); // konto do wysyłania maili z serwisu
        $message->addTo($email, "Odbiorca"); // osoba obsługująca zgłoszenia
        $message->setSubject("Zainteresowanie ofertą");
        $message->setBody($body);

        try {
            $transport->send($message);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
}