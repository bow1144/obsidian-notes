@echo off
cd /d C:\Users\30252\Documents\Obsidian Vault
git add .
git commit -m "Backup: %date% %time%"
git push origin main
