
# **Tệp Cấu Hình của Pilk  | DHUNGX Remake **

Đây là tệp cấu hình hiện tại của tôi. Một giao diện rất sạch sẽ cho **Hyprland**, cùng với bộ "rice" đầu tiên của tôi 🤓.

Phần lớn các tệp cấu hình gốc này được tạo ra bởi những **người khác** trong cộng đồng và sau đó tôi đã chỉnh sửa lại. Rất nhiều công việc nặng đã được thực hiện bởi [Stephan Raabe](https://github.com/mylinuxforwork) (ML4W), người đã tạo ra những tệp cấu hình gốc mà tôi đã chỉnh sửa.

Cảm ơn rất nhiều đến [Ksawlii](https://github.com/Ksawlii) và [Thomas Brugman](https://github.com/Githubguy132010) vì đã tạo ra các script cài đặt! 💙

---

### **Mục Lục**
- [Phụ thuộc](https://github.com/dhungx/Theme-arch#dependencies)
- [Cài đặt](https://github.com/dhungx/Theme-arch#installation)
- [Cài đặt thủ công](https://github.com/dhungx/Theme-arch#manual-installation)
- [Cấu hình thêm](https://github.com/dhungx/Theme-arch#extra-configuration)
- [Công việc gốc](https://github.com/dhungx/Theme-arch#original-work)

---

## **Ảnh Chụp Màn Hình**
Mặc định  
### ![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/Sreenshot3.png)

Với Viền  
### ![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/Screenshot1.png)

### ![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/sc2.gif)

### ![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/sc1.gif)

---

## **Phụ Thuộc**
Cài đặt những gói này bằng AUR helper yêu thích của bạn, ví dụ như yay:
```bash
hyprland
wlogout
waypaper
waybar
swww
rofi-wayland
swaync
nemo
kitty
pavucontrol
gtk3
gtk2
xcur2png
gsettings
nwg-look
fastfetch
zsh
oh-my-zsh-git
hyprshot
networkmanager
networkmanager-qt
nm-connection-editor
```

```bash
yay -Syu hyprland wlogout waypaper waybar swww rofi-wayland swaync nemo kitty pavucontrol gtk3 gtk2 xcur2png gsettings-qt nwg-look fastfetch zsh oh-my-zsh-git hyprshot networkmanager networkmanager-qt nm-connection-editor
```

---

## **Cài Đặt cho Gentoo**
```bash
git clone https://github.com/dhungx/Theme-arch
cd Theme-arch
sudo chmod +x ./install-gentoo.sh
./install-gentoo.sh
```

---

## **Cài Đặt cho Arch**
```bash
git clone https://github.com/dhungx/Theme-arch
cd Theme-arch
sudo chmod +x ./install-arch.sh
./install-arch.sh
```

Rất cảm ơn [Ksawlii](https://github.com/Ksawlii) và [Thomas Brugman](https://github.com/Githubguy132010) vì đã tạo ra các script cài đặt này! <3

> [!LƯU Ý]  
> Script cài đặt này hiện tại chỉ hỗ trợ Gentoo và Arch, và chưa hoàn toàn hoàn thiện. Một số tính năng có thể cần phải cấu hình thủ công.

---

## **Cài Đặt Thủ Công**
```bash
1. Cài đặt các phụ thuộc với AUR helper yêu thích của bạn.
2. Clone kho lưu trữ.
3. Di chuyển các thư mục `.config`, `.themes`, và wallpaper vào thư mục người dùng của bạn.
4. Cài đặt các font đã liệt kê.
5. Cài đặt zsh (Tùy chọn).
6. Thay đổi theme GTK và biểu tượng (Sử dụng GTK-look/nwg-look hoặc qua terminal).
```

---

## **Cấu Hình Thêm**
Có một số cấu hình và tùy chọn khác trong thư mục `.config` (ví dụ như viền cho **Waybar**). Bạn có thể chỉnh sửa bất kỳ thứ gì bạn muốn để tạo phong cách riêng cho mình. 🥰

Bạn cũng có thể thay đổi thư mục ảnh nền yêu thích trong tệp `.config/waypaper/config.ini`.

Để theme hoạt động trong các ứng dụng GTK nhất định, bạn có thể cần thêm thư mục tài nguyên của theme vào `~/.config/assets`.

---

## **Công Việc Gốc**
Dưới đây là danh sách những người đã tạo ra các công việc gốc mà tôi đã chỉnh sửa (Có thể còn nhiều hơn nữa, nhưng tôi không nhớ hết):

- [Stephan Raabe's ML4W](https://github.com/mylinuxforwork)
- [LireB's Fastfetch](https://github.com/LierB/fastfetch)
- [Newmals' Rofi themes](https://github.com/newmanls/rofi-themes-collection)
- [EliverLara's Sweet Themes](https://github.com/EliverLara/Sweet)
