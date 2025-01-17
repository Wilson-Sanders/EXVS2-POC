#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Fileversion=1.4.0.0
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#AutoIt3Wrapper_Run_After=mkdir "%scriptdir%\verau3"
#AutoIt3Wrapper_Run_After=mkdir "%scriptdir%\verexe"
#AutoIt3Wrapper_Run_After=copy /V /Y "%in%" "%scriptdir%\verau3\%scriptfile%_%fileversion%.au3"
#AutoIt3Wrapper_Run_After=copy /V /Y "%out%" "%scriptdir%\verexe\%scriptfile%_%fileversion%.exe"
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ColorConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>


#Region ## Global Variables Section Starts##

Global $Filename = "config.ini" ; Variable for Config file
Global $filedir = @ScriptDir & "\" & $Filename ; Variable for file directory to store path of config.ini
Global $ipconfigout = @ScriptDir & "\Tools\ipconfig-output.txt" ; Variable for the ipconfig output file path from batch file
Global $iFileExists = FileExists($filedir) ; Varuiable used to check if config.ini file is in the game directory
Global $currentIPEnabled = IniRead($filedir, "Config", "IpAddress", "default") ; Variable that reads current value of IpAddress in Config.ini
Global $currentIPDisabled = IniRead($filedir, "Config", "# IpAddress", "default"); Variable that reads current value of Commented IpAddress in Config.ini
Global $currentServer = IniRead($filedir, "Config", "Server", "default") ; Variable that reads current value of Server in Config.ini
Global $currentInterfaceNameEnabled = IniRead($filedir, "Config", "InterfaceName", "default") ; Variable that reads current value of InterfaceName in Config.ini
Global $currentInterfaceNameDisabled = IniRead($filedir, "Config", "# InterfaceName", "default") ; Variable that reads current value of Commented InterfaceName in Config.ini
Global $defaultIP = "192.168.0.100" ; Variable for Default Value of IpAddress in Config.ini
Global $defaultServer = "127.0.0.1" ; Variable for Default Value of Server in Config.ini
Global $defaultInterfaceName = "Ethernet" ; Variable for Default Value of InterfaceName in Config.ini
Global $currentB1 = IniRead($filedir, "controller", "A", "default") ; Variable that reads current value of ArcadeButton1 in Config.ini for DirectInput
Global $currentB2 = IniRead($filedir, "controller", "B", "default") ; Variable that reads current value of ArcadeButton2 in Config.ini for DirectInput
Global $currentB3 = IniRead($filedir, "controller", "C", "default") ; Variable that reads current value of ArcadeButton3 in Config.ini for DirectInput
Global $currentB4 = IniRead($filedir, "controller", "D", "default") ; Variable that reads current value of ArcadeButton4 in Config.ini for DirectInput
Global $currentBS = IniRead($filedir, "controller", "Start", "default") ; Variable that reads current value of ArcadeStartButton in Config.ini for DirectInput
Global $currentBC = IniRead($filedir, "controller", "Coin", "default") ; Variable that reads current value of ArcadeCoin in Config.ini for DirectInput
Global $currentBT = IniRead($filedir, "controller", "Test", "default") ; Variable that reads current value of ArcadeTest in Config.ini for DirectInput
Global $currentBCard = IniRead($filedir, "controller", "Card", "default") ; Variable that reads current value of ArcadeCard in Config.ini for DirectInput
Global $currentDeviceId = IniRead($filedir, "controller", "DeviceId", "default") ; Variable that reads current value of DeviceID in Config.ini for DirectInput
Global $currentKeyB1 = IniRead($filedir, "keyboard", "A", "default") ; Variable that reads current value of Button1 in Config.ini for Keyboard
Global $currentKeyB2 = IniRead($filedir, "keyboard", "B", "default") ; Variable that reads current value of Button2 in Config.ini for Keyboard
Global $currentKeyB3 = IniRead($filedir, "keyboard", "C", "default") ; Variable that reads current value of Button3 in Config.ini for Keyboard
Global $currentKeyB4 = IniRead($filedir, "keyboard", "D", "default") ; Variable that reads current value of Button4 in Config.ini for Keyboard
Global $currentKeyBS = IniRead($filedir, "keyboard", "Start", "default") ; Variable that reads current value of Start in Config.ini for Keyboard
Global $currentKeyBC = IniRead($filedir, "keyboard", "Coin", "default") ; Variable that reads current value of Coin in Config.ini for Keyboard
Global $currentKeyBT = IniRead($filedir, "keyboard", "Test", "default") ; Variable that reads current value of Test in Config.ini for Keyboard
Global $currentKeyCard = IniRead($filedir, "keyboard", "Card", "defautl") ; Variable that reads current value of Card in the Config.ini for Keyboard
Global $currentKeyUp = IniRead($filedir, "keyboard", "Up", "default") ; Variable that reads current value of Up in Config.ini for Keyboard
Global $currentKeyDown = IniRead($filedir, "keyboard", "Down", "default") ; Variable that reads current value of Down in Config.ini for Keyboard
Global $currentKeyLeft = IniRead($filedir, "keyboard", "Left", "default") ; Variable that reads current value of Left in Config.ini for Keyboard
Global $currentKeyRight = IniRead($filedir, "keyboard", "Right", "default") ; Variable that reads current value of Right in Config.ini for Keyboard
Global $currentKill = IniRead($filedir, "keyboard", "Kill", "default") ; Variable that reads the current value of Kill in Config.ini for Keyboard
Global $defaultB1 = "1" ; Variable for Default Value of ArcadeButton1 in Config.ini for DirectInput
Global $defaultB2 = "4" ; Variable for Default Value of ArcadeButton2 in Config.ini for DirectInput
Global $defaultB3 = "6" ; Variable for Default Value of ArcadeButton3 in Config.ini for DirectInput
Global $defaultB4 = "2" ; Variable for Default Value of ArcadeButton4 in Config.ini for DirectInput
Global $defaultBS = "10" ; Variable for Default Value of ArcadeStartButton in Config.ini for DirectInput
Global $defaultBC = "13" ; Variable for Default Value of ArcadeCoin in Config.ini for DirectInput
Global $defaultBT = "9" ; Variable for Default Value of ArcadeTest in Config.ini for DirectInput
Global $defaultBCard = "12" ; Variable for Default Value of ArcadeCard in Config.ini for DirectInput
Global $defaultKeyUp = "UpArr,W" ; Variable for Default Value of Up in Config.ini for Keyboard
Global $defaultKeyDown = "DownArr,S" ; Variable for efault Value of Down in Config.ini for Keyboard
Global $defaultKeyLeft = "LeftArr,A" ; Variable for Default Value of Left in Config.ini for Keyboard
Global $defaultKeyRight = "RightArr,D" ; Variable for Default Value of Right in Config.ini for Keyboard
Global $defaultKeyB1 = "Z,7 (NumPad)" ; Variable for Default Value of Button1 in Config.ini for Keyboard
Global $defaultKeyB2 = "X,8 (NumPad)" ; Variable for Default Value of Button2 in Config.ini for Keyboard
Global $defaultKeyB3 = "C,9 (NumPad)" ; Variable for Default Value of Button3 in Config.ini for Keyboard
Global $defaultKeyB4 = "V,0 (NumPad)" ; Variable for Default Value of Button4 in Config.ini for Keyboard
Global $defaultKeyBS = "1" ; Variable for Default Value of Start in Config.ini for Keyboard
Global $defaultKeyBC = "5" ; Variable for Default Value of Coin in Config.ini for Keyboard
Global $defaultKeyBT = "F1" ; Variable for Default Value of Test in Config.ini for Keyboard
Global $defaultKeyCard = "F3" ; Variable for Default Value of Card in Config.ini for Keyboard
Global $defaultKeyKill = "Esc" ; Variable for the Default Value of Kill in Config.ini for Keyboard
Global $Clicked = False ; Boolean Variable for confirming if Switch Language button is pressed

#EndRegion ### Global Variables Section End ###

#Region ### GUI Variables used for Language Switching ###

Global $GUI_baseElements = 8 ; Number of Elements used in BaseGUI
Global $GUI_configElements = 11 ; Number of Elements used in Config GUI
Global $GUI_controllerElements = 16 ; Number of Elements used in Controller GUI
Global $GUI_keyboardElements = 20 ; Number of Elemtents used in Keyboard GUI
Global $currentLang = 0 ; CurrentLanguage ID
Global $baseGUI[$GUI_baseElements] ; Create Array BaseGUI
Global $configGUI[$GUI_configElements] ; Create Array ConfigUI
Global $controllerGUI[$GUI_controllerElements] ; Create Array ControllerGUI
Global $keyboardGUI[$GUI_keyboardElements] ; Create Array KeyboardGUI

#Below Creates Array baseGUILang with 2 values per Element
Global $baseGUILang[$GUI_baseElements][2] = [["XBoost Single Instance Launcher", "XBoost 单实例 启动器"], ["Start Server.exe", "开始 Server.exe"], ["Start LM Mode", "启动 LM"], ["Start Client Mode", "启动 Client"], ["Open Config.ini", "打开Config.ini"], ["Card Webpage", "卡片网页"], ["Switch Language", "改变语言"], ["Exit", "退出"]]

#Below Creates Array configGUILang with 2 values per Element
Global $configGUILang[$GUI_configElements][2] = [["", ""], ["Config", "配置"], ["IP Address", "IP 地址"], ["InterfaceName", "网卡名称"], ["Server.exe Address", "Server.exe 地址"], ["Windowed Mode", "窗口模式"], ["Run ipconfig.bat", "运行 ipconfig.bat"], ["Initialize iauthdll.bat", "初始化 iauthdll.bat"], ["Save", "保存"], ["Restore defaults", "恢复默认选项"], ["How To Setup", "如何设置"]]

#Below Creates Array controllerGUILang with 2 values per Element
Global $controllerGUILang[$GUI_controllerElements][2] = [["", ""], ["Controller Settings", "按键 设置"], ["DirectInput", "Direct Input"], ["Windows USB Game Controller Options", "Windows USB 按键设置"], ["Joystick Detection Tool", "操纵杆检测工具"], ["Button A (Shoot)", "按钮 A（射击）"], ["Button B (Melee)", "按钮 B（格斗）"], ["Button C (Jump)", "按钮 C（喷射）"], ["Button D (Target)", "按钮 D（换锁）"], ["Start / Comms", "启动 / 通讯"], ["Coin", "硬币"], ["Card", "卡片"], ["Device ID", "设备 ID"], ["Save", "保存"], ["Restore defaults", "恢复默认选项"], ["How To Setup", "如何设置"]]

#Below Creates Array keyboardGUILang with 2 values per Element
Global $keyboardGUILang[$GUI_keyboardElements][2] = [["", ""], ["Keyboard", "键盘"], ["Keyboard", "键盘"], ["Link for Input Mappings", "按键映射参考网址"], ["Up", "上"], ["Down", "下"], ["Left", "左"], ["Right", "右"], ["Button A (Shoot)", "按钮 A（射击）"], ["Button B (Melee)", "按钮 B（格斗）"], ["Button C (Jump)", "按钮 C（喷射）"], ["Button D (Target)", "按钮 D（换锁）"], ["Start / Comms", "启动 / 通讯"], ["Coin", "硬币"], ["Test", "测试"], ["Card", "卡片"], ["Exit Program", "退出程序"], ["Save", "保存"], ["Restore defaults", "恢复默认选项"], ["How To Setup", "如何设置"]]

#Below Variable to store ENG HowTow for Config Section
Global $ENconfigHowTo = "If you are running this for the first time, please click on 'Initialize iauthdll.bat' to complete the setup." &@CRLF&@CRLF& _
			"Please choose either IP Address or InterfaceName option to define the network configuration." &@CRLF&@CRLF& _
			"On normal circumstances, you only need to select your desired network interface adapter from the dropdown and you are all set (e.g. Radmin VPN if you are using Radmin)" &@CRLF&@CRLF& _
			"However if you do need additional customization with Ip Address, you may use 'Run ipconfig.bat' to run the ipconfig batch script and it will then open the output values in a text document which you can use to populate the IP Aaddress field" &@CRLF&@CRLF& _
			"Once that's done, please also enter your Server address if you know any remote server to connect to." &@CRLF&@CRLF& _
			"If not, please leave the 'Server.exe address' field as default '127.0.0.1' and launch your own instance of server by using the 'Start server.exe' button on the sidebar." &@CRLF&@CRLF& _
			"Please don't forget to save your changes by pressing the 'Save' button."

#Below Variable to store ENG HowTow for Controller Section
Global $ENcontrollerHowTo = "If you are unsure if your device is using DirectInput or XInput, try enable the 'GAME PAD' option in-game, if it works out of the box then you don't need to enable this option." &@CRLF&@CRLF& _
			"However on the case where your device is using DirectInput, please enable this option by ticking on the 'DirectInput' checkbox." &@CRLF&@CRLF& _
			"Please plug in your Gamepad/Arcadestick and click the 'Windows USB Game Controller Options' Button." &@CRLF&@CRLF& _
			"This will bring up the Game Controllers control panel, select your Gamepad/Arcadestick and choose properties." &@CRLF &@CRLF& _
			"Press the buttons you wish to use and remember the buttons number shown on the window." &@CRLF&@CRLF& _
			"If you wish to use a specific DeviceID for your Gamepad/Arcadestick, click the 'Joystick Detection Tool' Button and press a button to find 'Joystick ID = #' " &@CRLF&@CRLF& _
			"Please don't forget to save your changes by pressing the 'Save' button."

#Below Variable to store ENG HowTow for Config Section
Global $ENkeyboardHowTo = "If you wish to use Keyboard, enable this option by ticking on the 'Keyboard' checkbox." &@CRLF&@CRLF& _
			"To obtain the correct mappings, please click the button 'Link for Input Mappings' to be taken to website with ID mappings." &@CRLF&@CRLF& _
			"You can use a comma ',' in between mappings to have each command map to more than 1 input."  &@CRLF&@CRLF& _
			"Example: Start----Q,W,E,R,T,Y - All the letters will be mapped to Start." &@CRLF&@CRLF& _
			"Please don't forget to save your changes by pressing the 'Save' button."

#Below Variable to store CN HowTow for Config Section
Global $CNconfigHowTo = "如果是第一次运行，请按下‘初始化iauthdll.bat’" &@CRLF&@CRLF& _
			"请选择Ip地址或者网卡名称" &@CRLF&@CRLF& _
			"正常情况下，你只需要使用网卡名称选上你要链接的网卡即可（e.g. 如果你是使用 Radmin, 请选择 Radmin VPN 网卡）" &@CRLF&@CRLF& _
			"虽然如此，如果你想要自行设定 IP Address 信息，你可以使用 '运行 ipconfig.bat' 按钮运行 ipconfig.bat 脚本，完成后 Ip 信息将会被写在 .txt 文档里以方便参考。" &@CRLF&@CRLF& _
			"完成后，请别忘记填入卡片服务器地址。" &@CRLF&@CRLF& _
			"如果你不知道卡片服务器地址，请使用‘开始 Server.exe’开启自己的本地服务器，本地开启的服务器地址都默认为 '127.0.0.1'" &@CRLF&@CRLF& _
			"请记得按下‘保存’按键以保存你修改的信息"

#Below Variable to store CN HowTow for Controller Section
Global $CNcontrollerHowTo = "如果不确定设备使用的是 DirectInput 还是 XInput，请尝试在游戏中启用'GAME PAD'选项、 如果能正常运行，则无需启用此选项" &@CRLF&@CRLF& _
			"但是如果你的操纵杆是使用 Direct Input，请开启‘Direct Input’选项" &@CRLF&@CRLF& _
			"请将你的操纵杆链接至你的电脑后，按下'Windows USB 按键设置'" &@CRLF&@CRLF& _
			"这将会开启你的电脑的‘设置USB游戏控制器’程序，请选择了你的操纵杆后按下‘属性’" &@CRLF &@CRLF& _
			"按下你想要用的按键，界面上会亮起相对的按键号码，请记住这个号码后，修改你要的按键信息。" &@CRLF&@CRLF& _
			"如果你有多过一个操纵杆，但是只想要使用一个其中一个，你可按下‘操纵杆检测工具’后了解你的操纵杆的ID，然后在‘设备 ID’上输入你得到的 ID" &@CRLF&@CRLF& _
			"请记得按下‘保存’按键以保存你修改的信息"

#Below Variable to store CN HowTow for Keyboard Section
Global $CNkeyboardHowTo = "如果你想要用键盘，请开启‘键盘’选项" &@CRLF&@CRLF& _
			"如果你想要知道按键映射名字，请按下‘按键映射参考网址’" &@CRLF&@CRLF& _
			"你可以使用逗号','（注意：英文字母逗号）来设定多按键映射" &@CRLF&@CRLF& _
			"譬如：启动 / 通讯----Q,W,E,R,T,Y -> 这将会把 Q,W,E,R,T,Y 按键映射到 启动 / 通讯 上" &@CRLF&@CRLF& _
			"请记得按下‘保存’按键以保存你修改的信息"

#EndRegion


#Region ### BaseGUI Variables in Koda ###

$baseGUI[0] = GUICreate($baseGUILang[0][$currentLang], 800, 720, -1, -1) ; Title of Window
$baseGUI[1] = GUICtrlCreateButton($baseGUILang[1][$currentLang], 592, 144, 131, 33) ; Start Server.exe
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[2] = GUICtrlCreateButton($baseGUILang[2][$currentLang], 592, 200, 131, 33) ; Start LM Mode
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[3] = GUICtrlCreateButton($baseGUILang[3][$currentLang], 592, 256, 131, 33) ; Start Client Mode
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[4] = GUICtrlCreateButton($baseGUILang[4][$currentLang], 592, 312, 131, 33) ; Open Config.ini
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[5] = GUICtrlCreateButton($baseGUILang[5][$currentLang], 592, 370, 131, 33) ; Card Webpage
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[6] = GUICtrlCreateButton($baseGUILang[6][$currentLang], 592, 430, 131, 33) ; Switch Language
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$baseGUI[7] = GUICtrlCreateButton($baseGUILang[7][$currentLang], 592, 480, 131, 33) ; Exit
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$tConfig = GUICtrlCreateTab(8, 24, 569, 680) ; Create Tab GUI structure
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")

#EndRegion

#Region ### ConfigGUI Variables in Koda ###

$configGUI[1] = GUICtrlCreateTabItem($configGUILang[1][$currentLang]) ; Config Tab
GUICtrlSetState(-1,$GUI_SHOW)
$configGUI[2] = GUICtrlCreateLabel($configGUILang[2][$currentLang], 56, 81, 114, 24) ; IP Address
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$configGUI[3] = GUICtrlCreateLabel($configGUILang[3][$currentLang], 56, 121, 166, 24) ; InterfaceName
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$configGUI[4]= GUICtrlCreateLabel($configGUILang[4][$currentLang], 56, 161, 166, 24) ; Server.exe Address
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$configGUI[5] = GUICtrlCreateLabel($configGUILang[5][$currentLang], 56, 201, 146, 24) ; Windowed Mode
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$configGUI[6]= GUICtrlCreateButton($configGUILang[6][$currentLang], 50, 300, 200, 40) ; ipconfig
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$configGUI[7] = GUICtrlCreateButton($configGUILang[7][$currentLang], 50, 250, 200, 40) ; iauthdll
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$configGUI[8] = GUICtrlCreateButton($configGUILang[8][$currentLang], 50, 650, 150, 40) ; Save; Setup for Multilanguage array
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$configGUI[9] = GUICtrlCreateButton($configGUILang[9][$currentLang], 400, 650, 150, 40) ; Restore defaults
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$configGUI[10] = GUICtrlCreateButton($configGUILang[10][$currentLang], 590, 70, 150, 50) ; How to setup
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
Global $IPRadio = GUICtrlCreateRadio("", 35, 81, 17, 17) ; Radio for IP Address
Global $InterfaceRadio = GUICtrlCreateRadio("", 35, 121, 17, 17) ; Radio for InterfaceName
Global $iIPAddress = GUICtrlCreateInput($currentIPEnabled, 248, 81, 193, 28) ; Input for IP Address
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $combo = GUICtrlCreateCombo("", 248, 121, 150, 120) ; Dropdown box for InterfaceName
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $iServer = GUICtrlCreateInput($currentServer, 248, 161, 193, 28) ; Input for Server.exe Address
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $WindowCheck = GUICtrlCreateCheckbox("", 259, 201, 20, 20) ; Checkbox for Windowed Mode
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetFont(-1, 100, 400, 0, "MS Sans Serif")

#EndRegion

#Region ### ControllerGUI Variables in Koda ###

$controllerGUI[1] = GUICtrlCreateTabItem($controllerGUILang[1][$currentLang]) ; Controller Settings Tab
$controllerGUI[2] = GUICtrlCreateLabel($controllerGUILang[2][$currentLang], 18, 65, 140, 24) ; DirectInput
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[3] = GUICtrlCreateButton($controllerGUILang[3][$currentLang], 268, 59, 283, 33) ; Windows USB Game Controller Options
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$controllerGUI[4] = GUICtrlCreateButton($controllerGUILang[4][$currentLang], 388, 100, 163, 33) ; Joystick Detection Tool
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$controllerGUI[5] = GUICtrlCreateLabel($controllerGUILang[5][$currentLang], 48, 158, 169, 24) ; Button A
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[6] = GUICtrlCreateLabel($controllerGUILang[6][$currentLang], 48, 198, 168, 24) ; Button B
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[7] = GUICtrlCreateLabel($controllerGUILang[7][$currentLang], 48, 238, 169, 24) ; Button C
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[8] = GUICtrlCreateLabel($controllerGUILang[8][$currentLang], 48, 278, 232, 24) ; Button D
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[9] = GUICtrlCreateLabel($controllerGUILang[9][$currentLang], 48, 318, 190, 24) ; Start
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[10] = GUICtrlCreateLabel($controllerGUILang[10][$currentLang], 48, 358, 139, 24) ; Coin
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[11] = GUICtrlCreateLabel($controllerGUILang[11][$currentLang], 48, 398, 141, 24) ; Card
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[12] = GUICtrlCreateLabel($controllerGUILang[12][$currentLang], 48, 458, 141, 24) ; Device ID
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$controllerGUI[13] = GUICtrlCreateButton($controllerGUILang[13][$currentLang], 50, 650, 150, 40) ; Save
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$controllerGUI[14] = GUICtrlCreateButton($controllerGUILang[14][$currentLang], 400, 650, 150, 40) ; Restore defaults
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$controllerGUI[15] = GUICtrlCreateButton($controllerGUILang[15][$currentLang], 590, 70, 150, 50) ; How to setup
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
Global $DIcheck = GUICtrlCreateCheckbox("", 160, 65, 17, 17) ; DirectInput Checkbox
Global $AB1 = GUICtrlCreateInput($currentB1, 312, 156, 121, 28) ; Input for Button A
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $AB2 = GUICtrlCreateInput($currentB2, 312, 196, 121, 28) ; Input for Button B
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $AB3 = GUICtrlCreateInput($currentB3, 312, 236, 121, 28) ; Input for Button C
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $AB4 = GUICtrlCreateInput($currentB4, 312, 276, 121, 28) ; Input for Button D
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $ABSt = GUICtrlCreateInput($currentBS, 312, 316, 121, 28) ; Input for Start
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $ABCoin = GUICtrlCreateInput($currentBC, 312, 356, 121, 28) ; Input for Coin
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $ABCard = GUICtrlCreateInput($currentBCard, 312, 396, 121, 28) ; Input for Card
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $DeviceID = GUICtrlCreateInput($currentDeviceID, 312, 456, 121, 28) ; Input for Device ID
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")

#EndRegion

#Region ### KeyboardGUI Variables in Koda ###

$keyboardGUI[1] = GUICtrlCreateTabItem($keyboardGUILang[1][$currentLang]) ; Keyboard Tab
$keyboardGUI[2] = GUICtrlCreateLabel($keyboardGUILang[2][$currentLang], 18, 65, 140, 24) ; Keyboard
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[3] = GUICtrlCreateButton($keyboardGUILang[3][$currentLang], 268, 59, 283, 33) ; Link for Input Mappings
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$keyboardGUI[4] = GUICtrlCreateLabel($keyboardGUILang[4][$currentLang], 48, 119, 169, 24) ; Up
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[5] = GUICtrlCreateLabel($keyboardGUILang[5][$currentLang], 48, 159, 169, 24) ; Down
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[6] = GUICtrlCreateLabel($keyboardGUILang[6][$currentLang], 48, 199, 168, 24) ; Left
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[7] = GUICtrlCreateLabel($keyboardGUILang[7][$currentLang], 48, 239, 232, 24) ; Right
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[8] = GUICtrlCreateLabel($keyboardGUILang[8][$currentLang], 48, 279, 169, 24) ; Button A
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[9] = GUICtrlCreateLabel($keyboardGUILang[9][$currentLang], 48, 319, 169, 24) ; Button B
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[10] = GUICtrlCreateLabel($keyboardGUILang[10][$currentLang], 48, 359, 168, 24) ; Button C
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[11] = GUICtrlCreateLabel($keyboardGUILang[11][$currentLang], 48, 399, 232, 24) ; Button D
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[12] = GUICtrlCreateLabel($keyboardGUILang[12][$currentLang], 48, 439, 142, 24) ; Start
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[13] = GUICtrlCreateLabel($keyboardGUILang[13][$currentLang], 48, 479, 139, 24) ; Coin
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[14] = GUICtrlCreateLabel($keyboardGUILang[14][$currentLang], 48, 519, 182, 24) ; Test
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[15] = GUICtrlCreateLabel($keyboardGUILang[15][$currentLang], 48, 560, 182, 24) ; Card
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[16] = GUICtrlCreateLabel($keyboardGUILang[16][$currentLang], 48, 599, 182, 24) ; Exit Program
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$keyboardGUI[17] = GUICtrlCreateButton($keyboardGUILang[17][$currentLang], 50, 650, 150, 40) ; Save
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$keyboardGUI[18] = GUICtrlCreateButton($keyboardGUILang[18][$currentLang], 400, 650, 150, 40) ; Restore defaults
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$keyboardGUI[19] = GUICtrlCreateButton($keyboardGUILang[19][$currentLang], 590, 70, 150, 50) ; How to setup
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
Global $Keycheck = GUICtrlCreateCheckbox("", 160, 65, 17, 17) ; Checkbox for Keyboard
Global $Up = GUICtrlCreateInput($currentKeyUp, 312, 115, 165, 28) ; Input for Up
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $Down = GUICtrlCreateInput($currentKeyDown, 312, 155, 165, 28) ; Input for Down
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $Left = GUICtrlCreateInput($currentKeyLeft, 312, 195, 165, 28) ; Input for Left
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $Right = GUICtrlCreateInput($currentKeyRight, 312, 235, 165, 28) ; Input for Right
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyB1 = GUICtrlCreateInput($currentKeyB1, 312, 275, 165, 28) ; Input for Button A
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyB2 = GUICtrlCreateInput($currentKeyB2, 312, 315, 165, 28) ; Input for Button B
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyB3 = GUICtrlCreateInput($currentKeyB3, 312, 355, 165, 28) ; Input for Button C
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyB4 = GUICtrlCreateInput($currentKeyB4, 312, 395, 165, 28) ; Input for Button D
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyStart = GUICtrlCreateInput($currentKeyBS, 312, 435, 165, 28) ;Input for Start
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyCoin = GUICtrlCreateInput($currentKeyBC, 312, 475, 165, 28) ;Input for Coin
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyTest = GUICtrlCreateInput($currentKeyBT, 312, 515, 165, 28) ;Input for Test
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyCard = GUICtrlCreateInput($currentKeyCard, 312, 555, 165, 28) ;Input for Card
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
Global $KeyKill = GUICtrlCreateInput($currentKill, 312, 595, 165, 28) ;Input for Exit Program
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)

#EndRegion

#Region ### File Checker ##

$size = FileGetSize("bngrw.dll")
If $size <> "137728" Then

Else

Msgbox(16, "test", "Please check the bngrw.dll file, it is not the correct file size.")

EndIf

If Not $iFileExists Then ; Used to check if config.ini exists, if it does not it will Error with Message Box
 	MsgBox (16, "Error", $Filename & " is not found. Please make sure you copied the config.ini file over to Game Directory and restart the launcher.")
EndIf

#EndRegion

#Region ### Process to get InterfaceNames  ###

; Run Powershell to get InterfaceNames on computer an
Local $PSCommand = Run("powershell Get-NetAdapter -Name * | Where-Object { $_.Status -eq 'Up' } |  Select-Object -ExpandProperty Name", @WindowsDir, @SW_HIDE, 0x2)
Local $INames = ""

While 1
	$INames &= StdoutRead($PSCommand)
		If @error Then
			ExitLoop
		EndIf
WEnd

FileOpen(@ScriptDir & "\Temp.txt", 0)
FileWrite(".\Temp.txt", $INames)

Local $ComboItems
_FileReadToArray(".\Temp.txt", $ComboItems)
_PopulateCombo($combo, $ComboItems)

FileClose(".\Temp.txt")
FileDelete(".\Temp.txt")

Func _PopulateCombo($hwndCTRLID, $vInfo)
    Local $sStoreForCombo = ''
    For $iCount = 1 To UBound($vInfo) - 1
        If $vInfo[$iCount] <> '' Then $sStoreForCombo &= $vInfo[$iCount] & '|'
    Next
    GUICtrlSetData($hwndCTRLID, $sStoreForCombo)
EndFunc

#EndRegion

#Region ### Switch Language Function ###

Func _SwitchLanguage()
	If $currentLang = 0 Then
		$currentLang = 1
	Else
		$currentLang = 0
	EndIf

	WinSetTitle($baseGUI[0], "", $baseGUILang[0][$currentLang])

	For $i = 1 To UBound($baseGUI) - 1
		GUICtrlSetData($baseGUI[$i], $baseGUILang[$i][$currentLang])
	Next

	For $i = 1 To UBound($configGUI) - 1
		GUICtrlSetData($configGUI[$i], $configGUILang[$i][$currentLang])
	Next

	For $i = 1 To UBound($controllerGUI) - 1
	GUICtrlSetData($controllerGUI[$i], $controllerGUILang[$i][$currentLang])
	Next

	For $i = 1 To UBound($keyboardGUI) - 1
	GUICtrlSetData($keyboardGUI[$i], $keyboardGUILang[$i][$currentLang])
	Next
EndFunc

#EndRegion

#Region ### Find IPAddress/InterfaceName in INI ###

$InterfaceArray = IniReadSection($filedir, "config")
$keyvalue4 = $InterfaceArray[3][0]
$keyvalue5 = $InterfaceArray[4][0]
If $keyvalue4 = "# InterfaceName" Then
	GUICtrlSetState($InterfaceRadio, $GUI_UNCHECKED)
  	GUICtrlSetData($combo, $currentInterfaceNameDisabled)
 	GUICtrlSetState($combo, $GUI_DISABLE)
Else
	GUICtrlSetState($InterfaceRadio, $GUI_CHECKED)
	GUICtrlSetData($combo, $currentInterfaceNameEnabled)
EndIf

If $keyvalue5 = "# IpAddress" Then
	GUICtrlSetState($IPRadio, $GUI_UNCHECKED)
 	GUICtrlSetData($iIPAddress, $currentIPDisabled)
	GUICtrlSetState($iIPAddress, $GUI_DISABLE)
Else
 	GUICtrlSetState($IPRadio, $GUI_CHECKED)
EndIf

#EndRegion


#Region ### Windowed DitectInput Keyboard Checkbox Confirm ###
Local $DItrue = IniRead($filedir, "controller", "Enabled", "default")
Local $keytrue = IniRead($filedir, "keyboard", "Enabled", "default")
Local $Wtrue = IniRead($filedir, "Config", "windowed", "default"); Variable use to read value of windowed in config.ini

If $DItrue = "true" Then
	GUICtrlSetState($DIcheck,$GUI_CHECKED)
Else
	GUICtrlSetState($DIcheck,$GUI_UNCHECKED)
EndIf

If $keytrue = "true" Then
	GUICtrlSetState($Keycheck,$GUI_CHECKED)
Else
	GUICtrlSetState($Keycheck,$GUI_UNCHECKED)
EndIf

If $Wtrue = "true" Then
	GUICtrlSetState($WindowCheck,$GUI_CHECKED)
Else
	GUICtrlSetState($WindowCheck,$GUI_UNCHECKED)
EndIf

#EndRegion

#Region ### When GUI buttons/radios/checkboxes are used ###

While 1

	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $InterfaceRadio ; Case structure for the InterfaceNames Radio Button
			GUICtrlSetState($iIPAddress, $GUI_DISABLE)
			GUICtrlSetState($combo, $GUI_ENABLE)

		Case $nMsg = $IPRadio ; Case structure for the IP Address Readio Button
			GUICtrlSetState($combo, $GUI_DISABLE)
			GUICtrlSetState($iIPAddress, $GUI_ENABLE)

		Case $nMsg = $baseGUI[1] ; Case structure for the Start Server button, verifies the file is there before booting.
			If FileExists("run_server.bat") Then
				Run("run_server.bat", @ScriptDir)
			Else
				MsgBox (16, "Error", "The file run_server.bat is not found. Please make sure you copied the files over to Game Directory")
			EndIf

		Case $nMsg = $baseGUI[2] ; Case structure for the Start LM Mode button, verifies the file is there before booting.
			If FileExists("run_xboost_LM_mode_v4.exe") Then
				Run("run_xboost_LM_mode_v4.exe")
			Else
				MsgBox (16, "Error", "The file run_xboost_LM_mode_v4.exe is not found. Please make sure you copied the files over to Game Directory")
			EndIf

		Case $nMsg = $baseGUI[3] ; Case structure for the Start Client Mode button, verifies the file is there before booting.
			If FileExists("run_xboost_CLIENT_mode_v4.exe") Then
			Run("run_xboost_CLIENT_mode_v4.exe")
			Else
			MsgBox (16, "Error", "The file run_xboost_CLIENT_mode_v4.exe is not found. Please make sure you copied the files over to Game Directory")
			EndIf

		Case $nMsg = $baseGUI[4] ; Case structure for the Open Config.ini button
			Run("notepad.exe " & $filedir, @WindowsDir)

		Case $nMsg = $baseGUI[6] ; Case structure for the Switch Language Button
			_SwitchLanguage()
			If $Clicked = True Then
				$Clicked = False
			Else
				$Clicked = True
			EndIf

		Case $nMsg = $baseGUI[5]  ; Case structure for accessing the Card Webpage button.
			ShellExecute("http://" & $currentServer & "/index")

		Case $nMsg = $baseGUI[7] ; Case structure for Exit Button in GUI
			Exit

		Case $nMsg = $configGUI[6] ; Case structure for the IPCONFIG button in the Config Tab to run the ipconfig batch file and open the outputfile.
			If FileExists(".\Tools\ipconfig.bat") Then
			Run(".\Tools\ipconfig.bat")
			Sleep(1000)
			Run("notepad.exe " & $ipconfigout, @WindowsDir)
			Else
			MsgBox (16, "Error", "The file ipconfig.bat is not found. Please make sure you copied the files over to the Game Directory")
			EndIf

		Case $nMsg = $configGUI[7] ; Case structure for running the iauthdll.bat button
			If FileExists(".\AMCUS\iauthdll.bat") Then
				ShellExecute(".\AMCUS\iauthdll.bat","","","runas")
			EndIf

		Case $nMsg = $configGUI[8] ; Case structure for Save button on Config Tab, takes all of the data in Input fields and saves to config.ini
			If GUICtrlRead($IPRadio) = 1 AND $keyvalue5 = "# IPAddress" Then
				_ReplaceStringInFile($Filename, "# IpAddress =", "IpAddress =")
				_ReplaceStringInFile($Filename, "InterfaceName =", "# InterfaceName =")
				IniWrite($Filename, "Config", "IpAddress", " " & GuiCtrlRead($iIPAddress))
			ElseIf GUICtrlRead($InterfaceRadio) = 1 AND $keyvalue4 = "# InterfaceName" Then
				_ReplaceStringInFile($Filename, "# InterfaceName =", "InterfaceName =")
				_ReplaceStringInFile($Filename, "IpAddress =", "# IpAddress =")
 				IniWrite($Filename, "Config", "InterfaceName", " " & GUICtrlRead($combo))
			ElseIf GUICtrlRead($IPRadio) = 1 AND $keyvalue5 = "IPAddress" Then
				IniWrite($Filename, "Config", "IpAddress", " " & GuiCtrlRead($iIPAddress))
			ElseIf GUICtrlRead($InterfaceRadio) = 1 AND $keyvalue4 = "InterfaceName" Then
				IniWrite($Filename, "Config", "InterfaceName", " " & GUICtrlRead($combo))
			EndIf

			$currentServer = GUICtrlRead($iServer)
			IniWrite($Filename, "Config", "Server", " " & $currentServer)

			If GUICtrlRead($WindowCheck) = $GUI_CHECKED Then
				IniWrite($Filename, "Config", "windowed", " " & "true")
			Else
				IniWrite($Filename, "Config", "windowed", " " & "false")
			EndIf

			MsgBox (64, "Success", "Settings Saved",2)

		Case $nMsg = $configGUI[9] ; Case structure for Default button on Config Tab, resets all current data in Input fields to default value
   			GUICtrlSetData($iIPAddress, $defaultIP)
			GUICtrlSetData($combo, $defaultInterfaceName)
			GUICtrlSetData($iServer, $defaultServer)
			GUICtrlSetState($WindowCheck, $GUI_CHECKED)

		Case $nMsg = $configGUI[10] ; Case structure for the How To button in the Config Tab

			If $Clicked = True Then
			MsgBox(32, "How To", $CNconfigHowTo)
			Else
			MsgBox(32, "How To", $ENconfigHowTo )
			EndIf

		Case $nMsg = $controllerGUI[3] ; Case structure for the JoystickDetection button to run the JoystickDetection_Realease application
			Run("control.exe joy.cpl,,4")

		Case $nMsg = $controllerGUI[4] ; Case structure for the JoystickDetection button to run the JoystickDetection_Realease application
			If FileExists(".\Tools\JoystickDetection_Release.exe") Then
			Run(".\Tools\JoystickDetection_Release.exe")
			Else
			MsgBox (16, "Error", "The file JoystickDetection_Release.exe is not found. Please make sure you copied the Tools folder over to the Game Directory")
			EndIf

		Case $nMsg = $controllerGUI[13] ; Case structure for Save button on Controllers Settings Tab, takes all of the data in Input fields and saves to config.ini
			IniWrite($Filename, "controller", "A", " " & GUICtrlRead($AB1))
			IniWrite($Filename, "controller", "B", " " & GUICtrlRead($AB2))
			IniWrite($Filename, "controller", "C", " " & GUICtrlRead($AB3))
			IniWrite($Filename, "controller", "D", " " & GUICtrlRead($AB4))
			IniWrite($Filename, "controller", "Start", " " & GUICtrlRead($ABSt))
			IniWrite($Filename, "controller", "Coin", " " & GUICtrlRead($ABCoin))
			IniWrite($Filename, "controller", "Card", " " & GUICtrlRead($ABCard))

			If GUICtrlRead($DIcheck) = $GUI_CHECKED Then
				IniWrite($Filename, "controller", "Enabled", " " & "true")
			Else
				IniWrite($Filename, "controller", "Enabled", " " & "false")
			EndIf

			MsgBox (64, "Success", "Settings Saved",2)

		Case $nMsg = $controllerGUI[14] ; Case structure for Default button on Controller Settings Tab, resets all current data in Input fields to default value
			GUICtrlSetData($AB1, $defaultB1)
			GUICtrlSetData($AB2, $defaultB2)
			GUICtrlSetData($AB3, $defaultB3)
			GUICtrlSetData($AB4, $defaultB4)
			GUICtrlSetData($ABSt, $defaultBS)
			GUICtrlSetData($ABCoin, $defaultBC)
			GUICtrlSetData($ABCard, $defaultBCard)
			IniWrite($Filename, "controller", "Enabled", " " & "true")

		Case $nMsg = $controllerGUI[15] ; Case structure for the How To button in the Controller Settings Tab
			If $Clicked = True Then
			MsgBox(32, "How To", $CNcontrollerHowTo)
			Else
			MsgBox(32, "How To", $ENcontrollerHowTo )
			EndIf


		Case $nMsg = $keyboardGUI[3] ; Case structure for the Link for Input Mappings button that will open browser link to Input Mappings for Keyboard
			ShellExecute("https://gist.github.com/emilianavt/f4b2d4e221235f55e8e5d3fb8ea769ed")

		Case $nMsg = $keyboardGUI[17] ; Case structure for Save button on Keyboard Tab, takes all of the data in Input fields and saves to config.ini
			IniWrite($Filename, "keyboard", "Up", " " & GUICtrlRead($Up))
			IniWrite($Filename, "keyboard", "Down", " " & GUICtrlRead($Down))
			IniWrite($Filename, "keyboard", "Left", " " & GUICtrlRead($Left))
			IniWrite($Filename, "keyboard", "Right", " " & GUICtrlRead($Right))
			IniWrite($Filename, "keyboard", "A", " " & GUICtrlRead($KeyB1))
			IniWrite($Filename, "keyboard", "B", " " & GUICtrlRead($KeyB2))
			IniWrite($Filename, "keyboard", "C", " " & GUICtrlRead($KeyB3))
			IniWrite($Filename, "keyboard", "D", " " & GUICtrlRead($KeyB4))
			IniWrite($Filename, "keyboard", "Start", " " & GUICtrlRead($KeyStart))
			IniWrite($Filename, "keyboard", "Coin", " " & GUICtrlRead($KeyCoin))
			IniWrite($Filename, "keyboard", "Test", " " & GUICtrlRead($KeyTest))
			IniWrite($Filename, "keyboard", "Card", " " & GUICtrlRead($KeyCard))
			IniWrite($Filename, "keyboard", "Kill", " " & GUICtrlRead($KeyKill))

			If GUICtrlRead($Keycheck) = $GUI_CHECKED Then
				IniWrite($Filename, "keyboard", "Enabled", " " & "true")
			Else
				IniWrite($Filename, "keyboard", "Enabled", " " & "false")
			EndIf

			MsgBox (64, "Success", "Settings Saved",2)

		Case $nMsg = $keyboardGUI[18] ; Case structure for Default button on the Keyboard tab, resets all current data in Input fields to default value
			GUICtrlSetData($Up, $defaultKeyUp)
			GUICtrlSetData($Down, $defaultKeyDown)
			GUICtrlSetData($Left, $defaultKeyLeft)
			GUICtrlSetData($Right, $defaultKeyRight)
			GUICtrlSetData($KeyB1, $defaultKeyB1)
			GUICtrlSetData($KeyB2, $defaultKeyB2)
			GUICtrlSetData($KeyB3, $defaultKeyB3)
			GUICtrlSetData($KeyB4, $defaultKeyB4)
			GUICtrlSetData($KeyStart, $defaultKeyBS)
			GUICtrlSetData($KeyCoin, $defaultKeyBC)
			GUICtrlSetData($KeyTest, $defaultKeyBT)
			GUICtrlSetData($KeyCard, $defaultKeyCard)
			GUICtrlSetData($KeyKill, $defaultKeyKill)

		Case $nMsg = $keyboardGUI[19] ; Case structure for the How To button in the Keyboard Tab
			If $Clicked = True Then
			MsgBox(32, "How To", $CNkeyboardHowTo)
			Else
			MsgBox(32, "How To", $ENkeyboardHowTo )
			EndIf

	EndSelect

#EndRegion

#Region ### Close Switch at top right of window ###

	Switch $nMsg
		Case $GUI_EVENT_CLOSE ; when GUI is closing, to use Exit command
			Exit
	EndSwitch

WEnd

#EndRegion

