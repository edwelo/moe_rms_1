<?php

#######
## SECTION: Authentication
#######

//if local machine
#if($_SERVER["HTTP_HOST"] == "localhost" || $_SERVER["HTTP_HOST"] == "d1") {
$nonLDAPusers = array("Ameeshi180604", "Edwel1970");
if(in_array($_POST["username"] . $_POST["password"], $nonLDAPusers)) {
	if($_POST["username"] == "Ameeshi") {
		$_SESSION["uid"]="ameeshi";
		$_SESSION["cn"]="Ameeshi Goel";
		$_SESSION["uidnumber"]=3999;
	}
	if($_POST["username"] == "Edwel") {
		$_SESSION["uid"]="edwel";
		$_SESSION["cn"]="Edwel Ongrung";
		$_SESSION["uidnumber"]=71;
	}
} else {

	// LDAP variables
	$ldap['user']				= $_POST['username'];
	$ldap['pass']				= $_POST['password'];
	$ldap['host']				= 'ldap.moe';
	$ldap['port']				= 389;
	$ldap['dn']         		= 'uid='.$ldap['user'].',ou=Users,dc=moe';
	$ldap['base']				= 'dc=moe';

	#echo $ldap['dn'] . "<br>\r";

	// connecting to ldap
	$ldap['conn'] = ldap_connect( $ldap['host'], $ldap['port'] ) or die( "Could not connect to ldap server " . $ldap['host'] );

	// binding to ldap
	if($ldap['bind'] = ldap_bind( $ldap['conn'], $ldap['dn'], $ldap['pass'] )) {

		// search for the user on the ldap server and return all the user information
		$ldap['result'] = ldap_search( $ldap['conn'], $ldap['base'], 'uid='.$ldap['user'] );

		if( $ldap['result'] ) {
			// retrieve all the entries from the search result
			$ldap['info'] = ldap_get_entries( $ldap['conn'], $ldap['result'] );
			if( $ldap['info'] ) {
				// add uname and cname to $_SESSION
				list($tmp, ) = explode("|", $ldap['info'][0]['uid'][0]);
				$tmp = trim($tmp);
				if(strpos(". lauriemaderkewet deniciamariur fennyseklii edwel", $tmp)) {
					$_SESSION['uid'] = $tmp;
					$_SESSION['cn'] = $ldap['info'][0]['cn'][0];
					$_SESSION['uidnumber'] = $ldap['info'][0]['uidnumber'][0];
					$_SESSION['o'] = $ldap['info'][0]['o'][0];
					$_SESSION['persid'] = $_SESSION['uidnumber'] - 2000;
				}
				#echo "<pre>";print_r($ldap["info"]);echo "</pre>\r";

			} else {
				$ldaperror .= ldap_error( $ldap['conn'] ) . "<br />";
			}
		} else {
			$ldaperror .= ldap_error( $ldap['conn'] ) . "<br />";
		}

	} else {

		$ldaperror .= ldap_error( $ldap['conn'] ) . "<br />";

	}

	// close connection to ldap server
	ldap_close( $ldap['conn'] );

	unset($_POST); //clears the variable to hide usernames and passwords
}
?>
