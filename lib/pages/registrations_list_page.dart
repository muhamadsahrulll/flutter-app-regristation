import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/registrations_list_controller.dart';

class RegistrationsListPage extends StatelessWidget {
  final controller = Get.put(RegistrationsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pendaftar', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.registrations.isEmpty) {
          return Center(
            child: Text(
              "Belum ada pendaftar.",
              style: GoogleFonts.inter(fontSize: 16),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(24),
                itemCount: controller.registrations.length,
                itemBuilder: (context, index) {
                  final reg = controller.registrations[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 24),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6FAFA),
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4, 6),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama:", style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                        Text(controller.maskName(reg.name), style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Email:", style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                        Text(controller.maskEmail(reg.email), style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 10),
                        Text("Alamat:", style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                        Text(controller.maskAddress(reg.address), style: GoogleFonts.inter(fontSize: 16)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed('/'),
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
                  child: Text("Kembali ke Landing Page", style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
