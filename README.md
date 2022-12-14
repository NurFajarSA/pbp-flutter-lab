# Tugas 7: Elemen Dasar Flutter
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023
#
## Stateless widget vs Stateful widget
Stateless widget merupakan sebuah widget yang tidak pernah berubah atau bisa dibilang tidak memiliki state/kondisi (static). Sedangkan, stateful widget merupakan sebuah widget yang bisa berubah sesuai dengan state/kondisinya (dynamic)

## Widget
Pada flutter, widget merupakan komponen-komponen, seperti button, text, icon, dsb.
## SetState()
setState merupakan sebuah method yang dimiliki oleh statefulwidget untuk memberitahu terjadinya perubahan internal state. Ketika setState dipanggil maka widget-widget akan direbuild
## const vs final
const digunakan untuk inisiasi variable immutable yang bersifat konstan dan harus sudah diketahui pada saat compile time, artinya nilai dari variable harus sudah diassign dengan sebuah value. Sedangkan, final digunakan untuk inisiasi variable immutable yang hanya dapat disetel sekali, artinya nilai final akan diketahui pada saat runtime.
## Implementation
1. Membuat projek flutter baru dengan nama counter_7
2. Memulai dari awal dengan menghapus code main bawaan dari flutter.
3. Membuat CounterApp dengan homepage CounterPage
4. Membuat CounterPage dari statefulwidget
5. Membuat tampilan sesuai dengan ketentuan soal
6. Menambahkan logic increment dan decrement pada fab
7. Mengerjakan bonus dengan menambahkan kondisional pada fab -

# Tugas 8: Flutter Form
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia, Semester Ganjil 2022/2023
#
## Navigator.push vs Navigator.pushReplacement
[**Navigator.push**](https://api.flutter.dev/flutter/widgets/NavigatorState/pushReplacement.html) 
<br>
Navigator.push akan pergi ke page/rute baru, tetapi tidak menghapus rute sebelumnya sehingga ketika terus di push terlihat seperti tumpukan layer page.
<br>
[**Navigator.pushReplacement**](https://api.flutter.dev/flutter/widgets/NavigatorState/push.html)
<br>
Navigator.pushReplacement akan mengganti page saat ini dengan page baru.

## List Widget
- Drawer: Membuat material design drawer
- Form: Membuat container untuk form fields
- TextFormField: Membuat form fields yang berisi TextField
- DropdownButtonFormField: Membuat DropdownButton widget yang berupa FormField
- ElevatedButton: Membuat elevated button
- SnackBar: Membuat snack bar
- Card: Membuat material design card
- ListTile: Membuat list tile

## Event pada Flutter
- onTap
- onChanged
- onSaved
- onEditingComplete
- onFieldSubmitted
- onPressed
- onLongPress
- onHover
- onFocusChange

## Cara kerja navigator
[**Navigator Class**](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
<br>
Widget Navigator bekerja seperti tumpukan layar (stack), ia menggunakan prinsip LIFO (Last-In, First-Out).

## Implementation
1. Refactor drawer widget
2. Membuat file untuk form dan data page, kemudian menambahan MyDrawer
3. Membuat model budget
4. Menambahkan form field pada form page
5. Validasi input dan submit data
6. Menambahkan tampilan dan mengambil data budget pada data page


# Tugas 9: Integrasi Web Service pada Flutter
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia, Semester Ganjil 2022/2023

#
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya bisa, tidak lebih baik. Pengambilan data dari API dengan membuat model memudahkan kita dalam mengolah ataupun memodifikasi data.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- ListView: Tampilan scrollabel
- Checkbox: Menampilkan checkbox
- Text: Menampilkan text
- Flexible: Untuk wrap text

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Pertama mebuat model data sesuai dengan json yang akan diambil. Kemudian, get dengan library http dan decode menjadi json. Terakhir, ubah setiap data pada json menjadi model dart yang telah dibuat sebelumnya.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat model MyWatchlist
2. Get data dari https://katalogku.herokuapp.com/mywatchlist/json
3. Refactor widget checkbox
4. Membuat watchlist page dengan menambahkan checkbox yang sudah di-refactor sebelumnya
5. Membuat watchlist detail dengan data sesuai dengan list yang di tap di watchlist page