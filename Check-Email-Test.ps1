Add-Type -AssemblyName System.Windows.Forms

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

Function Cleantxt
{
    Clear-Content -Path "C:\Users\USER\Desktop\PS\Get-Mailbox\mailbox.txt" -Force
}

$form1 = New-Object system.Windows.Forms.Form
$form1.Controls.Add($button2)
$form1.Controls.Add($button1)
$form1.Controls.Add($textbox1)
$form1.AutoScaleDimensions = '6, 13'
$form1.AutoScaleMode = 'Font'
$form1.BackColor = 'White'
$form1.ClientSize = '302, 261'
$form1.Name = 'form1'
$form1.Text = 'Form'
$form1.add_Load($form1_Load)
#
# button2
#
$button2 = New-Object system.Windows.Forms.Button
$button2.Font = 'Verdana, 8.25pt'
$button2.Location = '215, 59'
$button2.Name = 'button2'
$button2.Size = '75, 23'
$button2.TabIndex = 2
$button2.Text = 'button2'
$button2.UseCompatibleTextRendering = $True
$button2.UseVisualStyleBackColor = $True
$form1.Controls.Add($button2)
#
# button1
#
$button1 = New-Object system.Windows.Forms.Button
$button1.Font = 'Verdana, 8.25pt'
$button1.Location = '215, 30'
$button1.Name = 'button1'
$button1.Size = '75, 23'
$button1.TabIndex = 1
$button1.Text = 'button1'
$button1.UseCompatibleTextRendering = $True
$button1.UseVisualStyleBackColor = $True
$button1.Add_Click( { button1Info } )
$form1.Controls.Add($button1)

#
# textbox1
#
$textbox1 = New-Object system.Windows.Forms.TextBox
$textbox1.Location = '12, 30'
$textbox1.Multiline = $True
$textbox1.Name = 'textbox1'
$textbox1.Size = '186, 219'
$textbox1.TabIndex = 0
$form1.ResumeLayout()
$form1.Controls.Add($textbox1)
#endregion Generated Form Code

#----------------------------------------------


Function button1Info {
    Cleantxt
    $mailbox = $textbox1.lines.Split("`n")
    Add-Content -Path "C:\Users\USER\Desktop\PS\Get-Mailbox\mailbox.txt" -Value $mailbox
    Start-Process powershell {Write-Output hello; "C:\Users\USER\Desktop\PS\Get-Mailbox\button1.ps1"; pause}
}

[void] $form1.ShowDialog()
