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
sudo dnf copr enable atim/starship
sudo dnf install zsh util-linux-user starship sqlite
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

### Install nvidia drivers

```sh
lspci -vnn | grep VGA
sudo dnf update
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install akmod-nvidia
```

### Install VS Code:

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code
sudo sysctl fs.inotify.max_user_instances=524288
```

Install [VS Code extensions](./VSCode.md).
