### Install vpn client

```sh
unzip amnezia.tar.zip && tar -xvf amnezia.tar && ./amnezia
```

### Install applications from Flatpak:

```sh
flatpak install org.telegram.desktop
flatpak install flathub io.gitlab.news_flash.NewsFlash
```

### Install zsh:

```sh
sudo dnf install zsh util-linux-user
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
chsh -s /bin/zsh
```

Create `/root/.zshrc`, update it:

```sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Reboot.

```sh
rm ~/.bash*
```


### System Update

Remove unnecessary packages:

```sh
sudo dnf remove rhythmbox gnome-contacts libreoffice-* gnome-maps
```

Add RPM Fusion:

```sh
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Install nvidia drivers (from https://rpmfusion.org/Howto/NVIDIA)

```sh
/sbin/lspci | grep -e VGA
sudo dnf upgrade
sudo dnf install kmodtool akmods mokutil openssl
sudo kmodgenca -a
sudo mokutil --import /etc/pki/akmods/certs/public_key.der
systemctl reboot
```
When creating the public key, you will need to enter a password for the key (this is not your sudo password).
Then, when the system boots, select 'Enroll MOK' and type  password, select reboot

```sh
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
modinfo -F version nvidia
```

Install VS Code:

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code
sudo sysctl fs.inotify.max_user_instances=524288
```

Install [VS Code extensions](./VSCode.md).

Disable Software auto-start:

```sh
dconf write /org/gnome/software/allow-updates false
dconf write /org/gnome/software/download-updates false
mkdir -pv ~/.config/autostart && cp /etc/xdg/autostart/org.gnome.Software.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-software-service.desktop
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Software.desktop']"
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/org.gnome.Software.desktop
```

Add icon theme:

```sh
sudo dnf copr enable dusansimic/themes
sudo dnf install morewaita-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
```
