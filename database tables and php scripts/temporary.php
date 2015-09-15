<?php
$string = file_get_contents("/Users/tejas/Downloads/cisstucrse.dat", "r");
$myFile = "/Users/tejas/Downloads/trials.dat";
$fh = fopen($myFile, 'w') or die("Could not open: " . mysql_error());
fwrite($fh, $string);
fclose($fh);
$connect = mysql_connect("localhost", "root", "root")
or die('Could not connect: ' . mysql_error());
$bool = mysql_select_db("SwipeSystem", $connect);
if ($bool === False){
   print "can't find $database";
}
$result = mysql_query("LOAD DATA INFILE '$myFile'" .
                      " INTO TABLE temporary FIELDS TERMINATED BY '|'");
if (!$result) {
    die("Could not load. " . mysql_error());
}
?>