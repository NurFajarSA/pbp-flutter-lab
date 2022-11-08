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
