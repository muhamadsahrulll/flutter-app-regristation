import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 600;
          return Center(
            child: Container(
              width: isWide ? 500 : double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: isWide ? 2 : 1),
                  Text(
                    'Daftarkan Dirimu\nUntuk Peluang Karir Terbaik!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isWide ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Isi data dirimu dan dapatkan kesempatan untuk bergabung bersama kami. Proses mudah dan cepat!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isWide ? 18 : 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(6,8),
                          blurRadius: 0,
                          
                        ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed('/register'),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        elevation: 0, // Remove default shadow
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        ),
                        child: Text('Daftar Sekarang'),
                      ),
                      ),
                    ),
                  
                  Spacer(flex: 3),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 4),
                    child: Column(
                      children: [
                        Text(
                          'Tentang Saya: Muhamad Sahrul Syabani',
                          style: TextStyle(color: Colors.black, fontSize: 14,
                          fontWeight: FontWeight.bold),
                          
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('GitHub: github.com/johndoe'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            textStyle: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Instagram: @johndoe'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
