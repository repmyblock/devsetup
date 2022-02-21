<?php
	$mysqli = new mysqli("localhost","usracct","","RepMyBlock");
	$sql = "SELECT * FROM RepMyBlock.SystemUserEmail ORDER BY SystemUserEmail_Received DESC";
	
	// Check connection
	if ($mysqli -> connect_errno) {
		echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
		exit();
	}
	
	// Perform query
	if ($result = $mysqli -> query($sql)) {
		while($row = mysqli_fetch_row($result)) {
			echo "<A HREF=\"https://dev-frontend-web.repmyblock.org/ml" . $row[3] . 
											"/exp/register/intake\" TARGET=\"DEVREP\">" . $row[1] . "</A> - " . 
											$row[7] . " - Concluded: " . $row[5] . "<BR>\n";
		}
		$result -> free_result();
	}
	$mysqli -> close();
?>
