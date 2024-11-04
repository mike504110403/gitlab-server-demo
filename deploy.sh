#!/bin/bash

# 設置本地儲存路徑
BASE_PATH="${HOME}/gitlab"
CONFIG_PATH="${BASE_PATH}/config"
LOGS_PATH="${BASE_PATH}/logs"
DATA_PATH="${BASE_PATH}/data"

# 將路徑設置為環境變數
export GITLAB_CONFIG_PATH=$CONFIG_PATH
export GITLAB_LOGS_PATH=$LOGS_PATH
export GITLAB_DATA_PATH=$DATA_PATH
export GITLAB_ROOT_PASSWORD="Mm_test!@#"
export GITLAB_EXTERNAL_URL="http://localhost"

# 創建本地儲存資料夾
mkdir -p "$CONFIG_PATH"
mkdir -p "$LOGS_PATH"
mkdir -p "$DATA_PATH"

# 設置權限（選擇性步驟）
sudo chown -R $(whoami) "$BASE_PATH"
sudo chmod -R 755 "$BASE_PATH"

echo $GITLAB_ROOT_PASSWORD
# 啟動 Docker Compose
docker-compose down
docker-compose up -d
