## How I install my system

### Install

Fix booting video glitch:

```sh
sudo grubby --update-kernel=ALL --args="plymouth.use-simpledrm=0"
```

### System Update

Remove unnecessary packages:

```sh
sudo dnf remove cheese rhythmbox gnome-boxesd orca gnome-contacts gnome-getting-started-docs nautilus-sendto gnome-shell-extension-* libreoffice-* gnome-characters gnome-maps gnome-photos simple-scan virtualbox-guest-additions gedit gnome-boxes gnome-tour gnome-connections mediawriter eog gnome-system-monitor baobab gnome-log gnome-calculator gnome-weather gnome-text-editor gnome-font-viewer gnome-clocks gnome-calendar evince totem ffmpeg-free snapshot intel-media-driver cups-browsed anaconda
```

Run Software Center, disable `Fedora Flatpak` and enable Flathub and Chrome.

Add RPM Fusion:

```sh
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Update system via Software Center.

Install software:

```sh
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install libva-nvidia-driver
sudo dnf copr enable atim/starship
sudo dnf copr enable dusansimic/themes
sudo dnf install xclip micro fuse-encfs zenity borgbackup openssl ffmpegthumbnailer nss-tools mosquitto ydotool amrnb amrwb faac faad2 flac gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer-ffmpeg gstreamer-plugins-bad-nonfree gstreamer-plugins-espeak gstreamer-plugins-ugly lame libdca libmad libmatroska x264 x265 xvidcore gstreamer1-plugins-bad-free gstreamer1-plugins-base gstreamer1-plugins-good gstreamer-plugins-bad gstreamer1-plugins-ugly-free mpv ffmpeg xorg-x11-drv-intel intel-media-driver webp-pixbuf-loader avif-pixbuf-loader ffmpeg-libs libva libva-utils gstreamer1-vaapi mozilla-openh264 libheif-tools unrar p7zip p7zip-plugins speech-dispatcher speech-dispatcher-utils google-chrome-stable nodejs podman git tig ripgrep xkill bat make difftastic java-21-openjdk nextcloud-client zsh util-linux-user starship sqlite input-remapper morewaita-icon-theme https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```

Install nvidia drivers (from https://rpmfusion.org/Howto/NVIDIA)
/!\ After the RPM transaction ends, please remember to wait until the kmod has been built. This can take up to 5 minutes on some systems.
```sh
sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
modinfo -F version nvidia
```

Set Flatpak languages:

```sh
flatpak config languages --set "en;ru"
sudo flatpak update
```

Install applications from Flatpak:

```sh
flatpak install flathub de.haeckerfelix.Fragments org.telegram.desktop org.nickvision.tubeconverter org.gnome.Loupe com.mattjakeman.ExtensionManager io.gitlab.adhami3310.Converter io.missioncenter.MissionCenter org.gnome.baobab org.gnome.Calculator org.gnome.Logs org.gnome.Weather org.gnome.clocks org.gnome.Calendar org.gnome.Epiphany org.inkscape.Inkscape org.gnome.gitlab.YaLTeR.VideoTrimmer org.gnome.gitlab.cheywood.Iotas app.devsuite.Ptyxis hu.irl.cameractrls org.gnome.Snapshot org.gnome.Papers org.gimp.GIMP dev.zed.Zed
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
```

Disable Software auto-start:

```sh
dconf write /org/gnome/software/allow-updates false
dconf write /org/gnome/software/download-updates false
mkdir -p ~/.config/autostart && cp /etc/xdg/autostart/org.gnome.Software.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-software-service.desktop
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Software.desktop']"
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/org.gnome.Software.desktop
```

### Terminal:

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
