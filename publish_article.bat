@echo off
chcp 65001 > nul

echo.
echo ===================================
echo   AYULOG 一键发布脚本
echo ===================================
echo.

:: 提示用户输入提交信息
set /p commit_message="请输入本次的提交信息 (Enter your commit message): "

:: 检查信息是否为空
if "%commit_message%"=="" (
    echo.
    echo 错误：提交信息不能为空。操作已中止。
    echo ERROR: Commit message cannot be empty. Aborting.
    echo.
    pause
    exit /b
)

:: --- 执行 Git 命令 ---

echo.
echo --- 第1步: 添加所有文件变更 (git add .) ---
git add .

echo.
echo --- 第2步: 提交你的信息 (git commit) ---
git commit -m "%commit_message%"

echo.
echo --- 第3步: 推送到 GitHub (git push) ---
git push

echo.
echo ===================================
echo      发布完成！请检查 Vercel 部署状态。
echo      DEPLOYMENT COMPLETE!
echo ===================================
echo.
pause