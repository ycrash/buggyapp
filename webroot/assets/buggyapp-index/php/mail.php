<?php
header("Access-Control-Allow-Origin: *");
    // Only process POST reqeusts.
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get the form fields and remove whitespace.
        $name = strip_tags(trim($_POST["con_name"]));
                $name = str_replace(array("\r","\n"),array(" "," "),$name);
        $email = filter_var(trim($_POST["con_email"]), FILTER_SANITIZE_EMAIL);
        $phone = trim($_POST["con_phone"]);
        $subject = trim($_POST["con_subject"]);
        $message = trim($_POST["con_message"]);
 
        // Check that data was sent to the mailer.
        if ( empty($name) OR empty($phone) OR empty($subject) OR empty($message) OR !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            // Set a 400 (bad request) response code and exit.
            http_response_code(400);
            echo "Please complete the form and try again.";
            exit;
        }
 
        // Set the recipient email address.
        $recipient = "test@hasthemes.com";
 
        // Set the email subject.
        $subject = "Test Email for Template Demo - Mail From $name";
 
        // Build the email content.
        $email_content = "Name: $name\n";
        $email_content .= "Email: $email\n";
        $email_content .= "Phone:\n$phone\n";
        $email_content .= "Subject:\n$subject\n";
        $email_content .= "Message:\n$message\n";
 
        // Build the email headers.
        $email_headers = "From: $name <$email>";
 
        // Send the email.
        if (mail($recipient, $subject, $email_content, $email_headers)) {
            // Set a 200 (okay) response code.
            http_response_code(200);
            echo "Thank You! Your message has been sent.";
        } else {
            // Set a 500 (internal server error) response code.
            http_response_code(500);
            echo "Oops! Something went wrong and we couldn't send your message.";
        }
 
    } else {
        // Not a POST request, set a 403 (forbidden) response code.
        http_response_code(403);
        echo "There was a problem with your submission, please try again.";
    }
 
?>