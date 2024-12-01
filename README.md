# **Tệp Cấu Hình Pilk | Dhungx Remake**

Đây là bộ cấu hình hiện tại của tôi. Một giao diện cực kỳ sạch sẽ cho **Hyprland**, và cũng là bộ "rice" đầu tiên của tôi 🤓.

Hầu hết các tệp cấu hình gốc này được tạo ra bởi các **cộng đồng** và tôi đã chỉnh sửa lại. Công sức lớn nhất đến từ [Stephan Raabe](https://github.com/mylinuxforwork) (ML4W), người đã tạo ra bộ cấu hình gốc mà tôi chỉnh sửa.

Cảm ơn **[Ksawlii](https://github.com/Ksawlii)** và **[Thomas Brugman](https://github.com/Githubguy132010)** vì đã tạo ra các script cài đặt! 💙

---

### **Mục Lục**
- [Phụ thuộc](https://github.com/dhungx/Theme-arch#dependencies)
- [Cài đặt](https://github.com/dhungx/Theme-arch#installation)
- [Cài đặt thủ công](https://github.com/dhungx/Theme-arch#manual-installation)
- [Cấu hình thêm](https://github.com/dhungx/Theme-arch#extra-configuration)
- [Công việc gốc](https://github.com/dhungx/Theme-arch#original-work)

---

## **Ảnh Chụp Màn Hình**
**Mặc định**  
![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/Sreenshot3.png)

**Với Viền**  
![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/Screenshot1.png)

**Hoạt Hình**  
![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/sc2.gif)

![alt text](https://github.com/dhungx/Theme-arch/blob/master/screenshots/sc1.gif)

---

## **Phụ Thuộc**
Để cài đặt các gói cần thiết, bạn có thể dùng **yay** hoặc bất kỳ AUR helper nào bạn thích:

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

Cài đặt tất cả gói trên bằng lệnh sau:

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

```
code Vi
```bash
sudo chmod +x ./install-arch-vi.sh
sudo ./install-arch-vi.sh
```

Cảm ơn **[Ksawlii](https://github.com/Ksawlii)** và **[Thomas Brugman](https://github.com/Githubguy132010)** đã tạo ra các script cài đặt này! <3

> **Lưu ý**:  
> Script cài đặt hiện tại chỉ hỗ trợ Gentoo và Arch, một số tính năng có thể cần cấu hình thủ công.

---

## **Cài Đặt Thủ Công**
1. Cài đặt các phụ thuộc bằng AUR helper.
2. Clone kho lưu trữ về máy.
3. Di chuyển các thư mục `.config`, `.themes`, và wallpaper vào thư mục người dùng của bạn.
4. Cài đặt các font cần thiết.
5. Cài đặt **zsh** (tùy chọn).
6. Thay đổi theme GTK và biểu tượng (Có thể dùng GTK-look/nwg-look hoặc chỉnh thủ công qua terminal).

---

## **Cấu Hình Thêm**
Trong thư mục `.config`, có một số cấu hình tùy chỉnh mà bạn có thể thay đổi (ví dụ như viền cho **Waybar**). Cảm thấy tự do chỉnh sửa mọi thứ để tạo phong cách riêng cho bạn. 🥰

Bạn cũng có thể thay đổi thư mục lưu ảnh nền trong tệp `.config/waypaper/config.ini`.

Để theme hoạt động tốt trong các ứng dụng GTK, bạn có thể cần thêm thư mục tài nguyên của theme vào `~/.config/assets`.

---

## **Công Việc Gốc**
Dưới đây là danh sách các tác giả của những tệp cấu hình mà tôi đã chỉnh sửa:

- [Stephan Raabe's ML4W](https://github.com/mylinuxforwork)
- [LireB's Fastfetch](https://github.com/LierB/fastfetch)
- [Newmals' Rofi themes](https://github.com/newmanls/rofi-themes-collection)
- [EliverLara's Sweet Themes](https://github.com/EliverLara/Sweet)
