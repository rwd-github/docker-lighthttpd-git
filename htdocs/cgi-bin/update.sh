#!/bin/sh
exec 2>&1

output=""
status="200 OK"

myexec()
{
	ret=$(${*} 2>&1)
	if [ $? != 0 ]; then status="500 Internal Server Error"; fi
	output="${output}
${ret}"
}

#myexec ls -la
myexec git -C /workdir pull


echo "Content-type: text/html"
echo "Status: ${status}"
echo ""
#echo "<pre>"
echo "----------  start pull  --------------------------------"
echo "${output}"
echo "----------  end pull  ----------------------------------"
#echo "</pre>"
