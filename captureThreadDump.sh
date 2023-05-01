logLocation=/u02/oracle/Oracle/Middleware/Oracle_Home/domains/fmw_domain/servers/osb_server1/logs
logName="ThreadDump_`/bin/date '+%Y-%m-%d-%H-%M'`.log"
scriptHome=/u01/mazahir/captureThreadDump
dumpPath=$scriptHome/dumps
outputFile=$scriptHome/outputfile.txt
pid=$(</u02/oracle/Oracle/Middleware/Oracle_Home/domains/fmw_domain/servers/osb_server1/data/nodemanager/osb_server1.pid)

cd $logLocation

find . -type f -mmin -1 | xargs grep -o "STUCK" >> $outputFile 2>&1

if [ -s $outputFile ]; then
        /u01/oracle/java/jdk/bin/jstack -l $pid >> $dumpPath/$logName 2>&1
fi

rm $outputFile
