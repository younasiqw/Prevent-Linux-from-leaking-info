# Prevent-Linux-from-leaking-info

## 自動刪除文件脚本
這個shell脚本用於在持續24小時無法ping通google.com後自動執行系統強制刪除全部文件命令。

#如何使用？
下載 Protecting Linux Privacy.sh 文件到您的Linux系統中。
修改 Protecting Linux Privacy.sh 文件權限為可執行：chmod +x script.sh。
執行 Protecting Linux Privacy.sh 文件：./Protecting Linux Privacy.sh。

您可以讓此脚本一直運行，或者將其添加到 cron 計劃中以定期運行。
```
* * * * * /path/to/Protecting Linux Privacy.sh >/dev/null 2>&1
```

注意事項
這個脚本會每分鐘 ping 一次 google.com，如果連接失敗將會執行 rm -rf / 命令。請注意，這個脚本將刪除所有文件和資料夾，如果您確定需要這樣做，才使用此脚本。同時也建議備份重要的文件，以免造成不必要的損失。
確保您有足夠的權限來執行這個脚本。
在修改這個脚本之前，請先了解您正在執行的命令。
