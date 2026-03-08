# 🚀 MikroTik Hotspot Automation & Network Security

An integrated solution for managing a school's local network (SDN Sindangsari 02). This project combines customized Captive Portal (Hotspot) web development with advanced MikroTik RouterOS scripting to ensure network stability, security, and automated maintenance.

## 📌 Project Overview
The objective of this project is to create a secure, fair, and zero-touch maintenance network environment for an educational institution. It prevents unauthorized access, limits bandwidth for fair usage, blocks distracting content (online games) during school hours, and completely automates the router's backup process.

## ✨ Key Features & Implementations

### 1. 🎨 Custom Captive Portal (UI/UX)
Designed a fully responsive and user-friendly Hotspot login interface using HTML, CSS, and Vanilla JS.
* **Modern UI:** Clean, intuitive design matching the school's branding.
* **Dynamic Status Page:** Displays real-time data usage, IP address, and connection uptime.
* **Interactive Elements:** Features like a password visibility toggle and a countdown timer on the success page for better User Experience (UX).

### 2. 🤖 Automated Maintenance (Zero-Touch System)
Wrote comprehensive RouterOS scripts mapped to the system scheduler to keep the router healthy without manual intervention.
* **Auto-Backup to Email:** Automatically generates a configuration backup (`.rsc` and `.backup`) on the 1st of every month and emails it directly to the admin using Gmail SMTP.
* **Auto-Clear DNS Cache:** Daily scheduled DNS flush to prevent memory overload and ensure smooth browsing.
* **Auto-Reboot:** Scheduled midnight reboots to maintain hardware performance.

### 3. 🔒 Network Security & Filtering
* **Time-Based Access Control:** Internet access for teachers is strictly managed based on working hours.
* **Layer 7 Protocol Filtering:** Actively blocks major online gaming servers and domains (Mobile Legends, Roblox, PUBG, Free Fire, etc.) to keep the educational network strictly for productivity.

### 4. ⚡ Bandwidth Management (QoS)
Implemented user profiles with strict Rate Limiting (Bandwidth limit) to ensure every connected device gets a fair share of the internet speed, eliminating network lag during peak hours.

## 📸 Screenshots

*(Here are the visual representations of the Captive Portal)*

**Login Page & Connected Status**
![Login Page](assets/login-preview.png)
![Status Page](assets/status-preview.png)

**Success & Error Pages**
![Success Page](assets/alogin-preview.png)
![Error Page](assets/error-preview.png)

## 🛠️ Tech Stack & Tools Used
* **Networking:** MikroTik RouterOS, Winbox, LAN/WLAN Configuration, DHCP, DNS, NAT.
* **Scripting:** MikroTik Scripting Language.
* **Web Development:** HTML5, CSS3, JavaScript.

---
*This repository serves as a portfolio piece demonstrating real-world problem-solving skills in network administration and frontend customization.*