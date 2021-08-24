docker-compose -f docker-compose.yml down
docker-compose build 
docker-compose -f docker-compose.yml up -d
docker exec jenkins bash -c "sh /start.sh"

# SoanrQube 預設帳密為 admin
# 查詢 Jenkins 初始密碼
#   docker exec jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
# 