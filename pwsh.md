# PowerShell个人配置

> Windows 系列系统习惯使用自带的 PowerShell 作为命令行工具，本文档记录了个人的 PowerShell 配置。

## 先决条件

在 Windows 上，脚本执行策略必须设置为 RemoteSigned

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Confirm
```

## 必备软件

### scoop

一个简单方便的 windows 下的包管理器，优点是把软件全部安装在用户主目录下的一个文件夹中，管理和删除都非常方便。而且默认情况下不需要启用管理员权限，我们也不必每次专门开一个管理员权限的窗口来运行命令。用下面的命令就可以安装 scoop 包管理器。

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

### Windows Terminal

Win11自带，Win10可从微软商店自行安装

## 配置 WindowsTerminal

### 安装 NF 字体

nerd-fonts 是一个开源的字体项目，提供了很多编程常用的字体。oh-my-posh 需要使用 nerd-fonts字体来显示图标，官方推荐使用`Meslo-Nerd-Fonts`，可以使用 scoop 安装：

```powershell
scoop bucket add nerd-fonts
scoop install Meslo-NF-Mono
```

### 修改设置

- 启动 -> 默认配置文件：Windows PowerShell
- 启动 -> 默认终端应用程序：Windows 终端
- 外观 -> 在选项卡行中使用亚克力材料：开
- 配置文件/默认值 -> 外观：
  - 文本 -> 字体：MesloLGM Nerd Font Mono(MesloLGN NF Mono)
  - 透明度 -> 背景不透明度：70%左右
  - 透明度 -> 启用亚克力材料：开

## oh-my-posh

### 安装 oh-my-posh

可以通过三种方式进行安装：

#### 1. winget 安装

Windows自带的包管理工具，适合没有安装 scoop 时。

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

#### 2. scoop 安装（*）

```powershell
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

#### 3. 微软商店安装

可以直接在微软商店中搜索 oh-my-posh 进行安装。

### 配置 oh-my-posh

在 PowerShell 中使用 oh-my-posh 需要先加载它的模块，可以打开 PowerShell 配置文件（`$profile`）进行编辑：

```powershell
notepad $profile
# or
code $profile # 如果安装了 VSCode
```

添加以下内容：

```powershell
oh-my-posh init pwsh | Invoke-Expression
```

### 设置主题

查看主题命令`Get-PoshThemes`疑似被弃用，可以在[官网](https://ohmyposh.dev/docs/themes)查看主题，目前选用的是`clean-detailed`主题。

添加如下信息至配置文件中：

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression
# 模板
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/[主题名].omp.json" | Invoke-Expression
```

### posh-git

PowerShell的Git模块拓展，可以直接通过 scoop 安装。

```powershell
scoop bucket add extras
scoop install posh-git
Add-PoshGitToProfile
```

## PSReadline

PSReadline 用于自定义拓展 PowerShell 的按键功能

```powershell
# 按 Tab 自动补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# 绑定预测补全下一个单词按键
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
# 关闭声音
Set-PSReadLineOption -BellStyle None
```

7.x 版本内置了预测器 IntelliSense， 其默认视图为`InlineView`，按`F2`键可以在`InlineView`和`ListView`之间切换。
5.x 版本需要自行安装较新版本 PSReadline

## 自定义函数

### lsc

自定义一个函数`lsc`，用于列出当前目录下的文件，默认每行显示5个文件。

```powershell
function lsc {
    Param ([int]$c = 5)
    ls | Format-Wide -Column $c -Property Name
}
```

## 待完善

### PoshFuck

PowerShell的 TheFuck，可以使用`fuck`来纠正命令

## 可选

### PowerShell 升级

Windows 自带版本为5.1，最新版本为7.x。Powershell 可以直接在微软商店中安装，不过商店版有一点点权限限制。所以也可以直接从 Github 上下载 Powershell，<https://github.com/PowerShell/PowerShell/releases>

- 包含 PowerToys 的 CommandNotFound 模块，在用户输入命令遇到错误之后，会自动执行检测和分析。
- 引入了 PSReadLine 模块的预测性 IntelliSense 功能
