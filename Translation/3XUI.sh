#!/bin/bash
 sed -i 's/3X-ui\sPanel\sManagement\sScript/3X-ui面板管理脚本/g' /usr/bin/x-ui
 sed -i 's/0.${plain}\sExit\sScript/0.${plain} 退出脚本/g' /usr/bin/x-ui
 sed -i 's/1.${plain}\sInstall/1.${plain} 安装/g' /usr/bin/x-ui
 sed -i 's/2.${plain}\sUpdate/2.${plain} 更新/g' /usr/bin/x-ui
 sed -i 's/3.${plain}\sCustom\sVersion/3.${plain} 定制版本/g' /usr/bin/x-ui
 sed -i 's/4.${plain}\sUninstall/4.${plain} 卸载/g' /usr/bin/x-ui
 sed -i 's/5.${plain}\sReset\sUsername\s\&\sPassword\s\&\sSecret\sToken/5.${plain} 重置用户名和密码和Secret Token/g' /usr/bin/x-ui
 sed -i 's/6.${plain}\sReset Settings/6.${plain} 重置设置/g' /usr/bin/x-ui
 sed -i 's/7.${plain}\sChange\sPort/7.${plain} 更改端口/g' /usr/bin/x-ui
 sed -i 's/8.${plain}\sView\sCurrent\sSettings/8.${plain} 查看当前设置/g' /usr/bin/x-ui
 sed -i 's/9.${plain}\sStart/9.${plain} 开始/g' /usr/bin/x-ui
 sed -i 's/10.${plain}\sStop/10.${plain} 停止/g' /usr/bin/x-ui
 sed -i 's/11.${plain}\sRestart/11.${plain} 重新启动/g' /usr/bin/x-ui
 sed -i 's/12.${plain}\sCheck Status/12.${plain} 检查状态/g' /usr/bin/x-ui
 sed -i 's/13.${plain}\sCheck Logs/13.${plain} 检查日志/g' /usr/bin/x-ui
 sed -i 's/14.${plain}\sEnable Autostart/14.${plain} 开启自启/g' /usr/bin/x-ui
 sed -i 's/15.${plain}\sDisable Autostart/15.${plain} 禁用自启/g' /usr/bin/x-ui
 sed -i 's/16.${plain}\sSSL\sCertificate\sManagement/16.${plain} SSL证书管理/g' /usr/bin/x-ui
 sed -i 's/17.${plain}\sCloudflare\sSSL\sCertificate/17.${plain} Cloudflare SSL 证书/g' /usr/bin/x-ui
 sed -i 's/18.${plain}\sIP\sLimit\sManagement/18.${plain} IP限制管理/g' /usr/bin/x-ui
 sed -i 's/19.${plain}\sWARP\sManagement/19.${plain} WARP管理/g' /usr/bin/x-ui
 sed -i 's/20.${plain}\sFirewall\sManagement/20.${plain} 防火墙管理/g' /usr/bin/x-ui
 sed -i 's/21.${plain}\sEnable\sBBR/21.${plain} 启动BBR/g' /usr/bin/x-ui
 sed -i 's/22.${plain}\sUpdate\sGeo\sFiles/22.${plain} 更新Geo文件/g' /usr/bin/x-ui
 sed -i 's/23.${plain}\sSpeedtest\sby\sOokla/23.${plain} Ookla 速度测试/g' /usr/bin/x-ui
 sed -i 's/Please\senter\syour\sselection/请输入您的选择/g' /usr/bin/x-ui
 sed -i 's/Panel\sstate/面板状态/g' /usr/bin/x-ui
 sed -i 's/Not\sInstalled\${plain}/未安装${plain}/g' /usr/bin/x-ui
 sed -i 's/Not\sRunning\${plain}/未运行${plain}/g' /usr/bin/x-ui
 sed -i 's/Running\${plain}/运行中${plain}/g' /usr/bin/x-ui
 sed -i 's/Start\sautomatically/自动启动/g' /usr/bin/x-ui
 sed -i 's/xray\sstate/Xray状态/g' /usr/bin/x-ui
 sed -i 's/Back\sto\sMain\sMenu/返回主菜单/g' /usr/bin/x-ui
 sed -i 's/Choose\san\soption/选择一个选项/g' /usr/bin/x-ui
 sed -i 's/Invalid\schoice/无效的选择/g' /usr/bin/x-ui
 sed -i 's/ERROR\:\sYou\smust\sbe\sroot\sto\srun\sthis\sscript/错误：您必须是 root 用户才能运行此脚本/g' /usr/bin/x-ui
 sed -i 's/Failed\sto\scheck\sthe\ssystem\sOS,\splease\scontact\sthe\sauthor/检查系统操作系统失败，请联系作者/g' /usr/bin/x-ui
 sed -i 's/The\sOS\srelease\sis/本机操作系统版本是/g' /usr/bin/x-ui
 sed -i 's/WARP\ssocks5\sproxy/WARP socks5代理/g' /usr/bin/x-ui
 sed -i 's/Account\sType/账户类型/g' /usr/bin/x-ui
 sed -i 's/Turn\son\/off/开关/g' /usr/bin/x-ui
 sed -i 's/Enter\sport\snumber/设置端口号/g' /usr/bin/x-ui
 sed -i 's/Press\senter\sto\sreturn\sto\sthe\smain\smenu/按回车键返回主菜单/g' /usr/bin/x-ui
 sed -i 's/This\sfunction\swill\sforcefully\sreinstall\sthe\slatest\sversion,\sand\sthe\sdata\swill\snot\sbe\slost.\sDo\syou\swant\sto\scontinue/此功能将强制重新安装最新版本，并且不会丢失数据。是否要继续/g' /usr/bin/x-ui
 sed -i 's/Update\sis\scomplete,\sPanel\shas\sautomatically\srestarted /更新完成，面板已自动重启/g' /usr/bin/x-ui
 sed -i 's/Are\syou\ssure\syou\swant\sto\suninstall\sthe\spanel?\sxray\swill\salso\suninstalled/您确定要卸载面板吗？Xray 也将卸载/g' /usr/bin/x-ui
 sed -i 's/Uninstalled\sSuccessfully/已成功卸载/g' /usr/bin/x-ui
 sed -i 's/install_warp_proxy.sh)/install_warp_proxy.sh)\n        echo "C" > \/etc\/wireguard\/language/g' /usr/bin/x-ui
