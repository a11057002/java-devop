URL=$1
THRESHOLD=$2
level=$3
zap-cli --port 8080 quick-scan -s xss,sqli --spider $URL -l $level
ALERT_NUM=$(zap-cli --port 8080 -v alerts --alert-level $level -f json | jq length)
zap-cli --port 8080 report -o /zap/reports/report.html -f html
if [ $ALERT_NUM -gt $THRESHOLD ]
then
        echo "Build failed, Alerts is more than ${THRESHOLD}!"
        exit 1
else
        echo "Build Success!"
        exit 0
fi