# Exported by RouterOS
# model = RB750Gr3
# serial number = [SERIAL_NUMBER_ROUTER]

/interface ethernet
set [ find default-name=ether1 ] name=ether1_ISP
set [ find default-name=ether2 ] name=ether2_KOMPUTER
set [ find default-name=ether3 ] name=ether3_HOTSPOT

/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik

/ip hotspot profile
set [ find default=yes ] dns-name=sinsarnet.com hotspot-address=10.20.30.1 \
    html-directory=flash/hotspot login-by=http-chap,http-pap,mac-cookie
add dns-name=sinsarnet.com hotspot-address=10.20.30.1 html-directory=\
    flash/hotspot login-by=http-chap,http-pap,mac-cookie name=hsprof1

/ip hotspot user profile
set [ find default=yes ] name=Admin
add address-list=IP-GURU mac-cookie-timeout=5d name=Guru rate-limit=3M/5M \
    shared-users=2
add name=Tamu rate-limit=10K/10K

/ip pool
add name=dhcp_pool0 ranges=192.168.22.10-192.168.22.20
add name=hs-pool-3 ranges=10.20.30.11-10.20.30.254

/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2_KOMPUTER lease-time=\
    12h10m name=dhcp1
add address-pool=hs-pool-3 disabled=no interface=ether3_HOTSPOT lease-time=1h \
    name=dhcp2

/ip hotspot
add address-pool=hs-pool-3 addresses-per-mac=1 disabled=no interface=\
    ether3_HOTSPOT name=hotspot1 profile=hsprof1

/ip address
add address=192.168.22.1/24 interface=ether2_KOMPUTER network=192.168.22.0
add address=10.20.30.1/24 interface=ether3_HOTSPOT network=10.20.30.0

/ip dhcp-client
add disabled=no interface=ether1_ISP

/ip dhcp-server network
add address=10.20.30.0/24 comment="hotspot network" gateway=10.20.30.1
add address=192.168.22.0/24 gateway=192.168.22.1

/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4,1.1.1.1,1.0.0.1

/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
# inactive time
add action=drop chain=forward comment="Blokir Internet Guru Malam" \
    src-address-list=IP-GURU time=19h30m-23h59m59s,mon,tue,wed,thu,fri
# inactive time
add action=drop chain=forward comment="Blokir Internet Guru Pagi" \
    src-address-list=IP-GURU time=0s-5h40m,mon,tue,wed,thu,fri
add action=drop chain=forward comment="Blokir Internet Guru Weekend" \
    src-address-list=IP-GURU time=0s-23h59m59s,sun,sat
add action=drop chain=forward comment="Blokir Akses Game Online" content=\
    mobilelegends
add action=drop chain=forward content=moonton
add action=drop chain=forward content=garena
add action=drop chain=forward content=freefire
add action=drop chain=forward content=pubg
add action=drop chain=forward content=tencent
add action=drop chain=forward content=roblox
add action=drop chain=forward content=steampowered
add action=drop chain=forward comment="Blokir Domain ML 1" protocol=tcp \
    tls-host=*.mobilelegends.com
add action=drop chain=forward comment="Blokir Domain ML 2" protocol=tcp \
    tls-host=*.moonton.com
add action=drop chain=forward comment="Blokir Domain ML 3" protocol=tcp \
    tls-host=*.youngjoygame.com
add action=drop chain=forward comment="Blokir Port Battle ML" dst-port=\
    5000-5200,30000-30300 protocol=udp

/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1_ISP
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.20.30.0/24

/ip hotspot user
add name=admin password="[PASSWORD_ADMIN]"
add name=Irfan password="[PASSWORD_GURU]" profile=Guru
add name=samsuri password="[PASSWORD_GURU]" profile=Guru
add name=sarnan password="[PASSWORD_GURU]" profile=Guru
add name=syahril password="[PASSWORD_GURU]" profile=Guru
add name=saroni password="[PASSWORD_GURU]" profile=Guru
add name=engkar password="[PASSWORD_GURU]" profile=Guru
add name=aris password="[PASSWORD_GURU]" profile=Guru
add name=aldest password="[PASSWORD_GURU]" profile=Guru
add name=ali password="[PASSWORD_GURU]" profile=Guru
add name=ita password="[PASSWORD_GURU]" profile=Guru
add name=indah password="[PASSWORD_GURU]" profile=Guru
add name=dessy password="[PASSWORD_GURU]" profile=Guru
add name=khomariyah password="[PASSWORD_GURU]" profile=Guru
add name=romlih password="[PASSWORD_GURU]" profile=Guru
add name=rayhan password="[PASSWORD_GURU]" profile=Guru

/system clock
set time-zone-name=Asia/Jakarta

/system identity
set name=SINSARNET

/system ntp client
set enabled=yes server-dns-names=id.pool.ntp.org

/system scheduler
add comment="Reboot Mikrotik tengah malam" interval=1d name=Auto-Reboot \
    on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=feb/24/2026 start-time=00:00:00
add comment="Setiap hari senin login lagi" interval=1w name=Reset-Login-Senin \
    on-event=\
    "/ip hotspot active remove [find]\
    \n/ip hotspot cookie remove [find]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/02/2026 start-time=01:00:00
add interval=1d name=Auto-Clear-DNS on-event="/ip dns cache flush" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=feb/25/2026 start-time=04:00:00
add disabled=yes interval=1w name=Auto-Backup-Telegram on-event=":local botTok\
    en \"[MASUKKAN_TOKEN_BOT_TELEGRAM_ANDA]\"\r\
    \n:local chatID \"[MASUKKAN_ID_TELEGRAM_ANDA]\"\r\
    \n:local date [/system clock get date]\r\
    \n:local time [/system clock get time]\r\
    \n:local backupName \"Backup-Mingguan-SDN\"\r\
    \n/system backup save name=\$backupName\r\
    \n/export file=\$backupName\r\
    \n:delay 5s\r\
    \n:local textMsg \"%F0%9F%93%A2%20Laporan%20Mikrotik%3A%0A%E2%9C%85%20Auto\
    -Backup%20SDN%20Sindangsari%2002%20BERHASIL%21%0ATanggal%3A%20\$date%0AJam\
    %3A%20\$time%0A%0AFile%20sudah%20aman%20tersimpan%20di%20menu%20Files.\"\r\
    \n:local urlStr \"https://api.telegram.org/bot\$botToken/sendMessage\?chat\
    _id=\$chatID&text=\$textMsg\"\r\
    \n/tool fetch url=\$urlStr keep-result=no" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/01/2026 start-time=03:00:00
add interval=1d name=Auto-Backup-Tanggal-1 on-event=":local date [/system cloc\
    k get date]\r\
    \n:local day [:pick \$date 4 6]\r\
    \n:if (\$day = \"01\") do={\r\
    \n  /system backup save name=\"Backup-Bulanan-SDN\"\r\
    \n  /export file=\"Backup-Bulanan-SDN\"\r\
    \n  :delay 15s\r\
    \n  /tool e-mail send to=\"[EMAIL_ANDA@gmail.com]\" subject=\"Backup Ja\
    ringan Bulanan SDN Sindangsari 02\" body=\"Halo, ini adalah backup otomati\
    s bulanan dari jaringan SDN Sindangsari 02 pada tanggal 1. File konfiguras\
    i terlampir.\" file=\"Backup-Bulanan-SDN.backup,Backup-Bulanan-SDN.rsc\"\r\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=feb/25/2026 start-time=03:00:00

/tool e-mail
set address=smtp.gmail.com from="[EMAIL_ANDA@gmail.com]" password=\
    "[MASUKKAN_SANDI_APLIKASI_GMAIL_DISINI]" port=587 start-tls=yes user=\
    "[EMAIL_ANDA@gmail.com]"