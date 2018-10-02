#!/bin/bash
function testCloudFlare {
        if [[ "$SERVER_RESPONSE" =~ "Server: cloudflare-nginx" ]]; then
                echo "This connection is going via CloudFlare"
        else
            	echo "This connection is going directly to the origin server"
        fi 
}
echo
echo "Connecting to FQDN www.fractione.com...";
curl -Is "https://www.fractione.com/" > file1.txt;
SERVER_RESPONSE=$(cat file1.txt | grep Server);
echo "$SERVER_RESPONSE";
testCloudFlare
echo
echo "Connecting directly to origin server IPv6 address...";
curl -Iks "https://[2600:1f14:e07:501:5fd7:bc84:31cb:f2a1]/" > file2.txt;
SERVER_RESPONSE=$(cat file2.txt | grep Server);
echo "$SERVER_RESPONSE";
testCloudFlare
echo
