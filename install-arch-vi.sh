#!/bin/bash

# Thoát ngay lập tức nếu một lệnh thoát với mã lỗi không phải 0
set -e

# Kiểm tra quyền sudo
if ! sudo -v &>/dev/null; then
    echo "Bạn cần quyền sudo để chạy script này."
    exit 1
fi

# Lấy thư mục chứa script hiện tại
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Hàm hỏi câu hỏi yes/no với thông báo tùy chỉnh
ask_yn() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;  # Trả về 0 (thành công) nếu chọn yes
            [Nn]* ) return 1;;  # Trả về 1 (thất bại) nếu chọn no
            * ) echo "Vui lòng trả lời y hoặc n.";;
        esac
    done
}

# Kích hoạt multilib nếu chưa được kích hoạt
if ! grep -q '^\[multilib\]' /etc/pacman.conf; then
    echo "Kích hoạt kho multilib..."
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
    sudo pacman -Syu
fi

# Kiểm tra và cài đặt yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo "Đang cài đặt yay (AUR helper)..."
    sudo pacman -Syu --needed base-devel git
    git clone https://aur.archlinux.org/yay.git ~/yay
    (cd ~/yay && makepkg -si)
    rm -rf ~/yay
else
    echo "yay đã được cài đặt sẵn."
fi

# Cài đặt các gói phụ thuộc
echo ""
if ask_yn "Bạn có muốn cài đặt các gói phụ thuộc (khuyến khích)?"; then
    yay -Syu --needed hyprland waybar waypaper swww rofi-wayland swaync python-pipx nemo kitty pavucontrol gtk2 gtk3 nwg-look fastfetch zsh nerd-fonts-complete networkmanager networkmanager-qt nm-connection-editor xcur2png gsettings-qt hyprshot wlogout ttf-fira-sans ttf-firecode-nerd otf-droid-nerd texlive-fontsextra
else
    echo "Bỏ qua cài đặt các gói phụ thuộc..."
fi

# Cài đặt Oh My Zsh
echo ""
if ask_yn "Bạn có muốn cài đặt Oh My Zsh?"; then
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh đã được cài đặt."
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
else
    echo "Bỏ qua cài đặt Oh My Zsh..."
fi

# Tạo sao lưu các tệp cấu hình nếu đã tồn tại
echo "Đang sao lưu các cấu hình hiện có..."
BACKUP_DIR="$HOME/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Hàm sao lưu và sao chép tệp cấu hình
copy_with_backup() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ]; then
        echo "Đang sao lưu $(basename "$dest") hiện có vào $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR"
    fi
    cp -rf "$src" "$dest"
}

# Sao lưu và sao chép các tệp cấu hình
copy_with_backup "$SCRIPT_DIR/.config/" "$HOME/.config/"
copy_with_backup "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
copy_with_backup "$SCRIPT_DIR/wallpaper" "$HOME/wallpaper"
copy_with_backup "$SCRIPT_DIR/.themes/" "$HOME/.themes/"

# Cài đặt Nerd Fonts nếu chưa cài
if ask_yn "Bạn có muốn cài đặt Nerd Fonts (Khuyến khích)?"; then
    if [ ! -d "$HOME/nerd-fonts" ]; then
        echo "Đang tải Nerd Fonts..."
        git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
        ~/nerd-fonts/install.sh
        rm -rf ~/nerd-fonts
    else
        echo "Nerd Fonts đã được cài đặt."
    fi
else
    echo "Bỏ qua cài đặt Nerd Fonts..."
fi

# Cài đặt font cho Zsh nếu chưa có
if [ ! -d "$HOME/.fonts" ]; then
    echo "Đang cài đặt font..."
    mkdir -p "$HOME/.fonts"
    cp -r "$SCRIPT_DIR/fonts/" "$HOME/.fonts/"
    fc-cache -fv
else
    echo "Font đã được cài đặt."
fi

# Thông báo chuẩn bị hoàn tất
echo ""
echo "Chuẩn bị hoàn tất trong 3..."
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "<3"
sleep 1
echo "ViBoss Studio  x  DHUNGX"
