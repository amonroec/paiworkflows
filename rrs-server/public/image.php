<?php
//Show the image
print_r($_POST['customer_name']);
echo $img;
echo "hello";
print_r($_POST['workflow_id']);

print_r($_POST['form_image_src']);
echo '<img src="'.$_POST['form_image_src'].'" />';
 
//Get the base-64 string from data
$filteredData=substr($_POST['form_image_src'], strpos($_POST['form_image_src'], ",")+1);
 
//Decode the string
$unencodedData=base64_decode($filteredData);

$image = base64_decode($filteredData);
$image_name= 'task.png';
$path = "assets/forms/" . $image_name;
 
//Save the image
file_put_contents($path, $unencodedData);

?>