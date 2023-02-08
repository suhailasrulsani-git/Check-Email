Clear-Host

$mailbox = @(get-content -Path "C:\Users\USER\Desktop\PS\Get-Mailbox\mailbox.txt")

foreach ($object in $mailbox) {
    $object
}

