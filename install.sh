#!/bin/bash
echo "Flipper Zero Clone Installation für Termux wird gestartet..."

# Aktualisiere Paketquellen und installiere Abhängigkeiten
echo "Installiere Abhängigkeiten..."
pkg update -y
pkg install -y git wget tar python qemu-system-x86_64

# Erstelle das FlipperZero-Verzeichnis
echo "Erstelle Verzeichnisse..."
mkdir -p ~/FlipperZero
mkdir -p ~/FlipperZero/Apps
mkdir -p ~/FlipperZero/Scripts

# Kopiere die Firmware und Tools
echo "Kopiere Firmware und Tools..."
cp -r ./Firmware ~/FlipperZero/
cp -r ./Tools ~/FlipperZero/
cp -r ./Apps ~/FlipperZero/
cp -r ./Scripts ~/FlipperZero/

# Erstelle ein Autostart-Skript
echo "Erstelle Autostart-Skript..."
echo "#!/bin/bash" > ~/FlipperZero/start.sh
echo "cd ~/FlipperZero" >> ~/FlipperZero/start.sh
echo "python3 menu.py" >> ~/FlipperZero/start.sh
chmod +x ~/FlipperZero/start.sh

# Füge den Autostart zu .bashrc hinzu
echo "Füge Autostart zu .bashrc hinzu..."
echo "~/FlipperZero/start.sh" >> ~/.bashrc

# Erstelle eine einfache GUI (optional)
echo "Erstelle einfache GUI..."
echo "import os" > ~/FlipperZero/menu.py
echo "print('Willkommen beim Flipper Zero Clone für Termux!')" >> ~/FlipperZero/menu.py
echo "print('Verfügbare Apps:')" >> ~/FlipperZero/menu.py
echo "for app in os.listdir('Apps'):" >> ~/FlipperZero/menu.py
echo "    print(f'- {app}')" >> ~/FlipperZero/menu.py

# Installation abgeschlossen
echo "Installation abgeschlossen! Starte Termux neu, um die Anwendung zu starten."
echo "Du kannst die Anwendung jederzeit mit ~/FlipperZero/start.sh starten."
