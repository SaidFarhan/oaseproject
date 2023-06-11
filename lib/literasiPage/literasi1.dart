import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oaseproject/login_page.dart';
import 'package:oaseproject/menu.dart';
import 'package:oaseproject/widgets/literasiWidget.dart';

class literasi1 extends StatefulWidget {
  const literasi1({super.key});

  @override
  State<literasi1> createState() => _literasi1State();
}

class _literasi1State extends State<literasi1> {
  int _activepage = 1;
  @override
  Widget build(BuildContext context) {
    switch (_activepage) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(),
                    image: DecorationImage(
                      image: AssetImage("images/backgroundliterasi.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          "Di DevC, aplikasi ini khusus di buat untuk anda yang mempunyai anak usia di bawah umur yang sering menggunakan smartphone.",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activepage = 2;
                          });
                        },
                        child: Image.asset(
                          "images/nexticon.png",
                          color: Color(0xff2AA4FF),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            literasiWidget(
                imageTitle: "images/ketergantungan.png",
                imageContent: "images/literasiicon1.png",
                iconSize: 150,
                textContent:
                    "Anak-anak yang terlalu sering menggunakan smartphone cenderung mengembangkan ketergantungan yang berlebihan terhadap teknologi tersebut. Mereka mungkin menjadi sulit untuk menjauhkan diri dari perangkat tersebut, mengganggu konsentrasi dalam kegiatan sehari-hari, dan mengabaikan interaksi sosial di dunia nyata."),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _activepage = 3;
                });
              },
              child: Image.asset("images/nexticon.png"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff2AA4FF),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            literasiWidget(
                imageTitle: "images/gangguantidur.png",
                imageContent: "images/gangguanicon.png",
                iconSize: 150,
                textContent:
                    "Paparan cahaya biru yang dipancarkan oleh layar smartphone dapat mengganggu ritme alami tidur anak. Menggunakan smartphone sebelum tidur dapat menyebabkan kesulitan tidur, insomnia, dan gangguan tidur lainnya. Kurang tidur dapat mempengaruhi pertumbuhan dan perkembangan anak, serta kinerja akademik mereka."),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _activepage = 4;
                });
              },
              child: Image.asset("images/nexticon.png"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff2AA4FF),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            literasiWidget(
                imageTitle: "images/imageTitle3.png",
                imageContent: "images/imageContent3.png",
                iconSize: 100,
                textContent:
                    " Penggunaan smartphone yang berlebihan dapat mengurangi waktu yang dihabiskan anak untuk beraktivitas fisik. Mereka lebih cenderung terpaku pada layar daripada berpartisipasi dalam kegiatan fisik yang sehat, seperti bermain di luar, olahraga, atau berinteraksi dengan teman sebaya. Hal ini dapat menyebabkan masalah kesehatan seperti obesitas dan gangguan postur."),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _activepage = 5;
                });
              },
              child: Image.asset("images/nexticon.png"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff2AA4FF),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            literasiWidget(
                imageTitle: "images/imageTitle4.png",
                imageContent: "images/imageContent4.png",
                iconSize: 150,
                textContent:
                    " Penggunaan smartphone yang berlebihan dapat mengurangi waktu yang dihabiskan anak untuk beraktivitas fisik. Mereka lebih cenderung terpaku pada layar daripada berpartisipasi dalam kegiatan fisik yang sehat, seperti bermain di luar, olahraga, atau berinteraksi dengan teman sebaya. Hal ini dapat menyebabkan masalah kesehatan seperti obesitas dan gangguan postur."),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }),
                );
              },
              child: Image.asset("images/nexticon.png"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff2AA4FF),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
    }
  }
}
