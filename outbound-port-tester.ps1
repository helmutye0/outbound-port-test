# outbound port testing script
## edit file and put a comma separated list of ports you want to test in the $port variable
## 1,000 default nmap ports found here: https://nullsec.us/top-1-000-tcp-and-udp-ports-nmap-default/

$port = @(21,22,23,25,80,443,445,3389,8080,8443)
$test = ""

ForEach($p in $port) {
	$test = Test-NetConnection -WarningAction silentlyContinue -InformationLevel quiet -ComputerName portquiz.net -Port $p
	
	if ($test) {
		$p | Out-File -Append -FilePath ./open-ports.txt
	}
}
