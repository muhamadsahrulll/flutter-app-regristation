import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/registration_controller.dart';

class RegistrationPage extends StatelessWidget {
  final controller = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Selamat Datang di Form Pendaftaran",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
        // (empty, move the text inside the box below)
        SizedBox(height: 24),
        Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(50),
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xFFF6FAFA),
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 8),
            blurRadius: 0,
          ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Silakan Isi Data Berikut:",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),
            SizedBox(height: 16),
            
            Text(
            "Nama:",
            style: GoogleFonts.inter(fontSize: 16),
              ),
            
            TextFormField(
              controller: controller.nameController,
              style: GoogleFonts.inter(),
              decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
              ),
              validator: (v) => v == null || v.isEmpty ? "Harus diisi" : null,
            ),
                SizedBox(height: 20),
                Text(
                  "Email:",
                  style: GoogleFonts.inter(fontSize: 16),
                ),
                TextFormField(
                  controller: controller.emailController,
                  style: GoogleFonts.inter(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Harus diisi";
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(v)) return "Format email tidak valid";
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  "Alamat:",
                  style: GoogleFonts.inter(fontSize: 16),
                ),
                TextFormField(
                  controller: controller.addressController,
                  style: GoogleFonts.inter(),
                  maxLines: 4, // Membuat textfield alamat lebih panjang
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  validator: (v) => v == null || v.isEmpty ? "Harus diisi" : null,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      elevation: 4,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                      textStyle: GoogleFonts.jetBrainsMono(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                      shadowColor: Colors.black,
                    ),
                    child: Text("Kirim", style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                  width: 120, // Smaller width than "Kirim" button
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed("/"),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    ),
                    child: Text("Kembali"),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
          ]
      ),
      )   
    );
  }
}
