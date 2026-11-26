import 'package:demo_app_1/text_field_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> mahasiswa = [];

  // CRUD = CREATE, READ, UPDATE, DELETE
  final TextEditingController tambahData = TextEditingController();

  // Fungsi Create/Tambah
  void tambahMahasiswa() {
   final nama = tambahData.text.trim();

   if (nama.isEmpty) {
     return;
   }

   setState(() {
     mahasiswa.add(nama);
   });

   tambahData.clear();
  }

  // UPDATE

  // DELETE

  @override
  void dispose() {
    tambahData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SIAKAD POLMAIN")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text("Tambah data mahasiswa"),
            ),
            Textfieldwidget(
              nameController: tambahData,
              hintText: "Tambahkan Nama Mahasiswa",
              errorText: "Tidak boleh kosong",
              visionPass: false,
            ),
            ElevatedButton(onPressed: () => tambahMahasiswa(), child: Text("Tambah")),
            Divider(),
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text("Daftar Mahasiswa"),
            ),
            Expanded(
              child: ListView.builder( // READ
                itemCount: mahasiswa.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      // leading: Image.asset('assets/user_placeholder.png'),
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(mahasiswa[index]),
                      subtitle: Text("Mahasiswa Teknik Komputer"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        final snackBar = SnackBar(content: Text('Yay! A SnackBar! ${mahasiswa[index]}'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
