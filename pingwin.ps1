
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'



$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)

$form.Controls.Add($label)


$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})


if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
} 



while(1){



    #
    # KARL
    #

    #ping -n 2 192.168.68.100 > karldator.txt

    echo "Testar Karls Dator:"

    $karls = (ping -n 1 192.168.68.100 | findstr /c:"Request timed out")

    #echo $karls.Length

    if($karls.Length -gt 0){
	    #echo "Karls dator ej funnen"
	    $label.Text = 'Karls dator ej funnen'
	    $result = $form.ShowDialog()
    }
    else{
	    echo "Karls dator ok"
    }



    #
    # ANDERS
    #

    echo "Testar Anders telefon:"

    $anders = (ping -n 1 192.168.68.107 | findstr /c:"Request timed out")


    #echo $karls.Length

    if($anders.Length -gt 0){
	    #echo "Anders telefon ej funnen"
	    $label.Text = 'Anders telefon ej funnen'
	    $result = $form.ShowDialog()
    }
    else{
	    echo "Anders telefon ok"
    }


    echo ""


    Start-Sleep -Seconds $args[0]

}








