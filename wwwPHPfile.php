<?php

$servername = "172.31.30.196";
$username = "AHSSchedule";
$password = "5p[h#!TTTK?8Q92r";
$database = "AHSSchedule";

$connection = new mysqli($servername, $username, $password, $database);

/* Verify Connection*/
if (mysqli_connect_errno()) {
    printf("Connect failed %s\n", mysqli_connect_errno());
    exit();
}
?>


<HTML>
    <BODY>
	<TABLE>
		<?php
		$query = "SELECT courseCode, semesterLength, semester, description, dualCreditDailySchedule, location, periodBitmap, level, categories, subcategories FROM Courses WHERE Categories IS NULL LIMIT 10;";
		printf("<TR>");
		printf("<TD>No Categories</TD>");
		printf("</TR>");
		if ($result = $connection->query($query)) {
		    while ($row = $result->fetch_assoc()) {
			printf("<TR>");
			printf("<TD>%s</TD>", $row["courseCode"]);
			printf("<TD>%s</TD>", $row["semesterLength"]);
			printf("<TD>%s</TD>", $row["semester"]);
			printf("<TD>%s</TD>", $row["description"]);
			printf("<TD>%s</TD>", $row["dualCreditDailySchedule"]);
			printf("<TD>%s</TD>", $row["location"]);
			printf("<TD>%s</TD>", $row["periodBitmap"]);
			printf("<TD>%s</TD>", $row["level"]);
			printf("</TR>");
		    }
		}
		?>
	</TABLE>
	<TABLE>
	    <?php
	    $query = "SELECT courseCode, semesterLength, semester, description, dualCreditDailySchedule, location, periodBitmap, level, categories, subcategories FROM Courses WHERE subcategories IS NULL LIMIT 10;";
	    printf("<TR>");
	    printf("<TD>No Sub-Categories</TD>");
	    printf("</TR>");
	    if ($result = $connection->query($query)) {
		while ($row = $result->fetch_assoc()) {
		    printf("<TR>");
		    printf("<TD>%s</TD>", $row["courseCode"]);
		    printf("<TD>%s</TD>", $row["semesterLength"]);
		    printf("<TD>%s</TD>", $row["semester"]);
		    printf("<TD>%s</TD>", $row["description"]);
		    printf("<TD>%s</TD>", $row["dualCreditDailySchedule"]);
		    printf("<TD>%s</TD>", $row["location"]);
		    printf("<TD>%s</TD>", $row["periodBitmap"]);
		    printf("<TD>%s</TD>", $row["level"]);
		    printf("</TR>");
		}
	    }
	    ?>
	</TABLE>
    </BODY>
</HTML>

<style>
    table, th, td {
	border: 1px solid;
    }
</style>
