#!/bin/bash
###
 # @Author: Vincent Young
 # @Date: 2022-07-01 15:29:23
 # @LastEditors: Vincent Young
 # @LastEditTime: 2022-07-30 19:26:45
 # @FilePath: /MTProxy/mtproxy.sh
 # @Telegram: https://t.me/missuo
 # 
 # Copyright © 2022 by Vincent, All Rights Reserved. 
### 

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Define Color
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

# Make sure run with root
[[ $EUID -ne 0 ]] && echo -e "[${red}错误${plain}]请使用ROOT运行此脚本!" && exit 1

download_file(){
	echo "Checking System..."

	bit=`uname -m`
	if [[ ${bit} = "x86_64" ]]; then
		bit="amd64"
    elif [[ ${bit} = "aarch64" ]]; then
        bit="arm64"
    else
	    bit="386"
    fi

    last_version=$(curl -Ls "https://api.github.com/repos/9seconds/mtg/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    if [[ ! -n "$last_version" ]]; then
        echo -e "${red}无法检测到 mtg 版本可能是由于超出了 Github API 限制，请稍后再试。"
        exit 1
    fi
    echo -e "检测到的 mtg 的最新版本： ${last_version}, 开始安装..."
    version=$(echo ${last_version} | sed 's/v//g')
    wget -N --no-check-certificate -O mtg-${version}-linux-${bit}.tar.gz https://github.com/9seconds/mtg/releases/download/${last_version}/mtg-${version}-linux-${bit}.tar.gz
    if [[ ! -f "mtg-${version}-linux-${bit}.tar.gz" ]]; then
        echo -e "${red}下载 mtg-${version}-linux-${bit}.tar.gz 失败, 请再试一次."
        exit 1
    fi
    tar -xzf mtg-${version}-linux-${bit}.tar.gz
    mv mtg-${version}-linux-${bit}/mtg /usr/bin/mtg
    rm -f mtg-${version}-linux-${bit}.tar.gz
    rm -rf mtg-${version}-linux-${bit}
    chmod +x /usr/bin/mtg
    echo -e "mtg-${version}-linux-${bit}.tar.gz 安装成功，开始配置..."
}

configure_mtg(){
    echo -e "配置 mtg..."
    wget -N --no-check-certificate -O /etc/mtg.toml https://raw.githubusercontent.com/missuo/MTProxy/main/mtg.toml
    
    echo ""
    read -p "请输入伪装域名 (默认 itunes.apple.com): " domain
	[ -z "${domain}" ] && domain="itunes.apple.com"

	echo ""
    read -p "输入要监听的端口 (默认为 8443):" port
	[ -z "${port}" ] && port="8443"

    secret=$(mtg generate-secret --hex $domain)
    
    echo "Waiting configuration..."

    sed -i "s/secret.*/secret = \"${secret}\"/g" /etc/mtg.toml
    sed -i "s/bind-to.*/bind-to = \"0.0.0.0:${port}\"/g" /etc/mtg.toml

    echo "MTG配置成功，开始配置systemctl..."
}

configure_systemctl(){
    echo -e "正在配置 systemctl..."
    wget -N --no-check-certificate -O /etc/systemd/system/mtg.service https://raw.githubusercontent.com/missuo/MTProxy/main/mtg.service
    systemctl enable mtg
    systemctl start mtg
    echo "MTG配置成功后，开始配置防火墙..."
    systemctl disable firewalld
    systemctl stop firewalld
    ufw disable
    echo "MTG成功启动，尽情享受吧!"
    echo ""
    # echo "MTG配置："
    # mtg_config=$(mtg access /etc/mtg.toml)
    public_ip=$(curl -s ipv4.ip.sb)
    subscription_config="tg://proxy?server=${public_ip}&port=${port}&secret=${secret}"
    subscription_link="https://t.me/proxy?server=${public_ip}&port=${port}&secret=${secret}"
    echo -e "${subscription_config}"
    echo -e "${subscription_link}"
}

change_port(){
    read -p "输入要修改的端口(默认为 8443):" port
	[ -z "${port}" ] && port="8443"
    sed -i "s/bind-to.*/bind-to = \"0.0.0.0:${port}\"/g" /etc/mtg.toml
    echo "重新启动 MTProxy..."
    systemctl restart mtg
    echo "MTProxy 已成功重启!"
}

change_secret(){
    echo -e "Please note that unauthorized modification of Secret may cause MTProxy to not function properly."
    read -p "Enter the secret you want to modify:" secret
	[ -z "${secret}" ] && secret="$(mtg generate-secret --hex itunes.apple.com)"
    sed -i "s/secret.*/secret = \"${secret}\"/g" /etc/mtg.toml
    echo "秘钥更改成功！!"
    echo "重新启动 MTProxy..."
    systemctl restart mtg
    echo "MTProxy 已成功重启!"
}

update_mtg(){
    echo -e "更新 mtg..."
    download_file
    echo "mtg 更新成功，开始重启 MTProxy..."
    systemctl restart mtg
    echo "MTProxy 已成功重启!"
}

start_menu() {
    clear
    echo -e "  MTProxy v2 一键安装
---- by Vincent | github.com/missuo/MTProxy ----
---- 中文 Vincent | github.com/missuo/MTProxy ----
 ${green} 1.${plain} 安装 MTProxy
 ${green} 2.${plain} 卸载 MTProxy
————————————
 ${green} 3.${plain} 启动 MTProxy
 ${green} 4.${plain} 停止 MTProxy
 ${green} 5.${plain} 重启 MTProxy
 ${green} 6.${plain} 更改监听端口
 ${green} 7.${plain} 更改密钥
 ${green} 8.${plain} 更新 MTProxy
————————————
 ${green} 0.${plain} 退出
————————————" && echo

	read -e -p " 请输入号码 [0-8]: " num
	case "$num" in
    1)
		download_file
        configure_mtg
        configure_systemctl
		;;
    2)
        echo "卸载 MTProxy..."
        systemctl stop mtg
        systemctl disable mtg
        rm -rf /usr/bin/mtg
        rm -rf /etc/mtg.toml
        rm -rf /etc/systemd/system/mtg.service
        echo "成功卸载 MTProxy!"
        ;;
    3) 
        echo "启动 MTProxy..."
        systemctl start mtg
        systemctl enable mtg
        echo "MTProxy成功启动！"
        ;;
    4) 
        echo "停止 MTProxy..."
        systemctl stop mtg
        systemctl disable mtg
        echo "MTProxy 已成功停止!"
        ;;
    5)  
        echo "正在重新启动 MTProxy..."
        systemctl restart mtg
        echo "MTProxy 重启成功！"
        ;;
    6) 
        change_port
        ;;
    7)
        change_secret
        ;;
    8)
        update_mtg
        ;;
    0) exit 0
        ;;
    *) echo -e "${Error} 请输入一个数字 [0-8]: "
        ;;
    esac
}
start_menu
