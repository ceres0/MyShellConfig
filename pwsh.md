# PowerShell个人配置

> Windows系列系统习惯使用自带的PowerShell作为命令行工具，本文档记录了个人的PowerShell配置。

## 必备软件

### scoop

一个简单方便的 windows 下的包管理器，优点是把软件全部安装在用户主目录下的一个文件夹中，管理和删除都非常方便。而且默认情况下不需要启用管理员权限，我们也不必每次专门开一个管理员权限的窗口来运行命令。用下面的命令就可以安装 scoop 包管理器。

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

## WindowsTerminal配置

## 可选

### PowerShell升级

Windows自带版本为5.1，最新版本为7.x。Powershell 可以直接在微软商店中安装，不过商店版有一点点权限限制。所以你也可以直接从 Github 上下载 Powershell，<https://github.com/PowerShell/PowerShell/releases>
