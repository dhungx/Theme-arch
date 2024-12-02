#!/bin/bash

# Dừng script ngay lập tức nếu một lệnh thoát với trạng thái không phải 0
set -e

# Lấy thư mục hiện tại của script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Hàm hỏi người dùng có muốn làm gì đó hay không với câu hỏi có thể tùy chỉnh
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
    echo "Đang kích hoạt kho lưu trữ multilib..."
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
    sudo pacman -Syu
else
    echo "Kho lưu trữ multilib đã được kích hoạt."
    sleep 2
    clear
fi

# Hàm cài đặt yay hoặc paru
install_aur_helper() {
    local aur_helper=$1
    local aur_url=$2
    local aur_dir=$3

    if ! pacman -Q "$aur_helper" &>/dev/null; then
        echo "$aur_helper chưa được cài đặt, đang tiến hành cài đặt..."
        if ask_yn "Bạn có muốn cài đặt $aur_helper (AUR helper)?"; then
            echo "Đang cài đặt $aur_helper..."
            sudo pacman -Syu --needed base-devel git
            git clone "$aur_url" "$aur_dir"
            (cd "$aur_dir" && makepkg -si)
            rm -rf "$aur_dir"
        else
            echo "Bỏ qua cài đặt $aur_helper..."
            sleep 2
        fi
    else
        echo "$aur_helper đã được cài đặt, bỏ qua cài đặt..."
        sleep 2
    fi
}

# Cài đặt yay
install_aur_helper "yay" "https://aur.archlinux.org/yay.git" "~/yay"

# Cài đặt paru (nếu yay đã được cài đặt)
if pacman -Q yay &>/dev/null; then
    install_aur_helper "paru" "https://aur.archlinux.org/paru.git" "~/paru"
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
    sleep 2
    clear
fi

# Sao chép các tệp cấu hình
echo ""
echo "Đang sao chép các tệp cấu hình..."
sleep 1

# Tạo thư mục sao lưu các cấu hình cũ
BACKUP_DIR="$HOME/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

copy_with_backup() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ]; then
        echo "Đang sao lưu $(basename "$dest") vào $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR"
    fi
    cp -rf "$src" "$dest"
}

# Sao lưu và sao chép các tệp cấu hình
echo "Đang sao lưu các cấu hình hiện tại vào $BACKUP_DIR"
copy_with_backup "$SCRIPT_DIR/.config/" "$HOME/.config/"
copy_with_backup "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
copy_with_backup "$SCRIPT_DIR/wallpaper" "$HOME/wallpaper"
copy_with_backup "$SCRIPT_DIR/.themes/" "$HOME/.themes/"

# Cài đặt Nerd Fonts
echo ""
if ask_yn "Bạn có muốn cài đặt Nerd Fonts (Khuyến nghị)?"; then
    git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
    ~/nerd-fonts/install.sh
    rm -rf ~/nerd-fonts
else
    echo "Bỏ qua cài đặt Nerd Fonts..."
    sleep 2
    clear
fi

echo ""
echo "Sẵn sàng trong 3..."
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "<3"
