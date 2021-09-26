[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

#Create Form Object
$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(900,900)
$Form.Text = "US ABC 3.0"
$Form.StartPosition = "CenterScreen" #loads the window in the center of the screen

#Link Label 1
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Size(10,20)
$Button1.Size = New-Object System.Drawing.Size(100,30)
$Button1.AutoSize= $true
$Button1.Text = "Show Report"
$Form.Controls.Add($Button1) 

#Load Web Browser
$Button1.add_Click({
$webBrowser1 = New-Object System.Windows.Forms.WebBrowser
$webBrowser1.Location = New-Object System.Drawing.Size(10,60)
$webBrowser1.Size = New-Object System.Drawing.Size(800,800)
$webBrowser1.URL="E:\CodeHub\tmp\New folder\x.html"
$Form.Controls.Add($webBrowser1) })
$Button1.Click();

#Show Form
$Form.ShowDialog()