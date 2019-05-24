<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
 * server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "zumo", "password", "id9694822_stuff");
 
// Check connection
if($link === false){
  die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Attempt insert query execution
$sql = "INSERT INTO stuff(content) VALUES ('".$_GET["content"]."')";
if(mysqli_query($link, $sql)){
  echo "Records inserted successfully.";
} else{
  echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
// Close connection
mysqli_close($link);
?>
