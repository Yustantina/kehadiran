import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kehadiran/views/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              KotakBiru(),
              Expanded(
                child: SizedBox(),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            top: 200,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PENGUMUMAN",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Libur Nasional",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          Text(
                            "Libur Nasional Hari Kemerdekan Tgl 17 Agustus 2021",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 36,
                              ),
                              margin: EdgeInsets.only(top: 4),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                  )
                                ],
                                color: Colors.green[700],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Text(
                                "UBAH DATA",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Klik tombol logout untuk keluar dari aplikasi absensi",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orange[700]),
                                ),
                             onPressed: () => Get.offAll(LoginPage()),
                                child: Text(
                                  "LOGOUT",
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class KotakBiru extends StatelessWidget {
  const KotakBiru({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF3995DB),
            Color(0xFF59B9E9),
            Color(0xFF6CB2D3)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 40,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "WAHYUDI",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 2),
          Text(
            "SALES EXECUTIVE",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(height: 2),
          Text(
            "BANDUNG",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      )),
    );
  }
}
