echo "*##############################################################################*"                               
echo "*                                                                              *"                               
echo "* SUMMARY                                                                      *"                               
echo "*                                                                              *"                               
echo "*##############################################################################*"                               
echo ""
echo -e "Package			        Version			           Status"
echo '========================================================================================='
dpkg-query -W -f='${Package}\t${Version}\t${Status}\n' $(cat packages.txt) | column -t

