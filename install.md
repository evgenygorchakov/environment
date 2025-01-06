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

### Add rpm fusion

```sh
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Install nvidia drivers (from https://rpmfusion.org/Howto/NVIDIA)

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

### Install VS Code:

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code
sudo sysctl fs.inotify.max_user_instances=524288
```

Install [VS Code extensions](./VSCode.md).
