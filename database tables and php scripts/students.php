<?php
$string = file_get_contents("/Users/tejas/Downloads/cisstudent.dat", "r");
$myFile = "/Users/tejas/Downloads/trial.dat";
$fh = fopen($myFile, 'w') or die("Could not open: " . mysql_error());
fwrite($fh, $string);
fclose($fh);
$connect = mysql_connect("localhost", "root", "password")
or die('Could not connect: ' . mysql_error());
$bool = mysql_select_db("SwipeSystem", $connect);
if ($bool === False){
   print "can't find $database";
}
$result = mysql_query("LOAD DATA INFILE '$myFile'" .
                      " INTO TABLE student FIELDS TERMINATED BY '|'");
if (!$result) {
    die("Could not load. " . mysql_error());
}
?>