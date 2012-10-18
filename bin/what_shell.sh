shell=$(ps -e | grep -e "\b$$\b" | grep -v ps | grep -v grep | awk '{print $4}');
echo $shell;
