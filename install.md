## How I install my system

### System Update

Remove unnecessary packages:

```sh
sudo dnf remove cheese rhythmbox gnome-boxesd orca gnome-contacts gnome-getting-started-docs nautilus-sendto gnome-shell-extension-* libreoffice-* gnome-characters gnome-maps gnome-photos simple-scan virtualbox-guest-additions gedit gnome-boxes gnome-tour gnome-connections mediawriter eog gnome-system-monitor baobab gnome-log gnome-calculator gnome-weather gnome-text-editor gnome-font-viewer gnome-clocks gnome-calendar evince totem ffmpeg-free snapshot intel-media-driver cups-browsed anaconda malcontent-control loupe cockpit-bridge cockpit-system cockpit-storaged cockpit-ws cockpit-ws-selinux
```

Run Software Center, enable Flathub and Chrome.

Add RPM Fusion (for codecs):

```sh
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
flatpak remote-delete fedora
```

Update system via Software Center.

Install software:

```sh
dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
dnf install ghostty
sudo dnf copr enable dusansimic/themes
sudo dnf copr enable hyperreal/better_fonts
sudo dnf install xclip micro fuse-encfs zenity borgbackup openssl ffmpegthumbnailer nss-tools mosquitto ydotool amrnb amrwb faac faad2 flac gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer-ffmpeg gstreamer-plugins-bad-nonfree gstreamer-plugins-espeak gstreamer-plugins-ugly lame libdca libmad libmatroska x264 x265 xvidcore gstreamer1-plugins-bad-free gstreamer1-plugins-base gstreamer1-plugins-good gstreamer-plugins-bad gstreamer1-plugins-ugly-free mpv ffmpeg xorg-x11-drv-intel intel-media-driver webp-pixbuf-loader heif-pixbuf-loader avif-pixbuf-loader libheif-freeworld ffmpeg-libs libva libva-utils gstreamer1-vaapi mozilla-openh264 libheif-tools unrar p7zip p7zip-plugins speech-dispatcher speech-dispatcher-utils google-chrome-stable nodejs podman git tig ripgrep xkill bat make difftastic nextcloud-client zsh util-linux-user starship sqlite  morewaita-icon-theme nethogs fuse-sshfs logiops libgda libgda-sqlite playerctl cabextract xorg-x11-font-utils tesseract tesseract-devel zed podman-compose sgdisk tesseract-langpack-rus zbar
sudo rpm -ivh --nodigest --nofiledigest https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```

Set Flatpak languages:

```sh
flatpak config languages --set "en;ru"
sudo flatpak update
```

Install applications from Flatpak:

```sh
flatpak install flathub de.haeckerfelix.Fragments org.telegram.desktop org.nickvision.tubeconverter org.gnome.Loupe com.mattjakeman.ExtensionManager io.gitlab.adhami3310.Converter net.nokyan.Resources org.gnome.Calculator org.gnome.Logs org.gnome.Weather org.gnome.clocks org.gnome.Calendar org.gnome.Epiphany org.inkscape.Inkscape org.gnome.gitlab.YaLTeR.VideoTrimmer org.gnome.World.Iotas app.devsuite.Ptyxis hu.irl.cameractrls org.gnome.Snapshot org.gnome.Papers org.gimp.GIMP be.alexandervanhee.gradia com.github.PintaProject.Pinta com.yubico.yubioath org.gnome.font-viewer
```

Remove default GNOME console.

Set `Ctrl + C` and `Ctrl + V` for copy/paste in new terminal settings.

Speed-up boot:

```sh
sudo systemctl disable NetworkManager-wait-online.service
```

Disable Software auto-update and notifications.


Disable file system scanning:

```sh
dconf write /org/freedesktop/tracker/miner/files/crawling-interval -2
```


### Terminal

Install eza:

```sh
curl -sL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz
chmod +x eza
mkdir -p ~/.local/bin/
mv eza ~/.local/bin
```

Install atuin:

```sh
curl -sL https://github.com/atuinsh/atuin/releases/download/v18.6.1/atuin-x86_64-unknown-linux-gnu.tar.gz | tar xz --strip-components=1 atuin-x86_64-unknown-linux-gnu/atuin
mv atuin ~/.local/bin
```

Install zsh:

```sh
mkdir -p ~/.local/share/history
chmod 700 ~/.local/share/history
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.local/lib/zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/lib/zsh/zsh-autosuggestions
git clone https://github.com/jimhester/per-directory-history ~/.local/lib/zsh/per-directory-history
chsh -s /bin/zsh
```

Create `/root/.zshrc`:

```sh
eval "$(starship init zsh)"
```

Reboot.

Select `English/Spanish/Catalan Universal` (first) and `Russian Universal` layouts.

```sh
rm ~/.bash*
```


Install [Lilex](https://lilex.myrt.co).

```sh
mkdir -p ~/.local/share/fonts
# Copy variable fonts
fc-cache -f -v
gsettings set org.gnome.desktop.interface monospace-font-name "Lilex 12"
```

Disable GNOME extension version check:

```sh
gsettings set org.gnome.shell disable-extension-version-validation true
```

Install extensions from [`GNOME.md`](./GNOME.md).

Add icon theme:

```sh
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
```
