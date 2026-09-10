import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Brasserie Bistro',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      home: const DetailRestoran(),
    );
  }
}

class DetailRestoran extends StatefulWidget {
  const DetailRestoran({super.key});

  @override
  State<DetailRestoran> createState() => _DetailRestoranState();
}

class _DetailRestoranState extends State<DetailRestoran> {
  bool showFullDescription = false;

  final List<bool> favorit = [false, false, false];

  final List<Map<String, String>> menu = [
    {
      'nama': 'Grilled Sirloin Steak',
      'harga': 'Rp 145.000',
      'gambar': 'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Truffle Carbonara',
      'harga': 'Rp 98.000',
      'gambar': 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=600&q=80',
    },
    {
      'nama': 'Grilled Salmon',
      'harga': 'Rp 128.000',
      'gambar': 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=600&q=80',
    },
  ];

  void tampilPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // ==========================================
      // APPBAR
      // Sesuai spesifikasi: nama restoran + Share
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),

        title: const Text(
          'La Brasserie Bistro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            onPressed: () {
              tampilPesan('Restoran dibagikan');
            },
          ),
        ],
      ),

      // ==========================================
      // FLOATING ACTION BUTTON
      // ==========================================
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF16806F),
        elevation: 4,

        onPressed: () {
          tampilPesan('Reservasi Sekarang dipilih');
        },

        icon: const Icon(
          Icons.calendar_today_outlined,
          color: Colors.white,
          size: 19,
        ),

        label: const Text(
          'Reservasi Sekarang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==========================================
            // GAMBAR RESTORAN BAGIAN ATAS
            // Image.network + BoxFit.cover
            // ==========================================
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,

                  child: Image.network(
                    'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=1200&q=90',
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: const Center(
                          child: Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Efek gelap agar mirip contoh
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.45),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ==========================================
            // CONTAINER PUTIH MELENGKUNG
            // ==========================================
            Transform.translate(
              offset: const Offset(0, -22),

              child: Container(
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 110),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // =====================================
                      // NAMA RESTORAN
                      // =====================================
                      const Text(
                        'La Brasserie Bistro',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263238),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // =====================================
                      // RATING + ULASAN + KATEGORI
                      // =====================================
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFB300),
                            size: 25,
                          ),

                          const SizedBox(width: 7),

                          const Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            '(1250 Ulasan)',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),

                          const SizedBox(width: 15),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2EF),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: const Row(
                              children: [
                                Icon(
                                  Icons.restaurant,
                                  size: 17,
                                  color: Color(0xFF16806F),
                                ),

                                SizedBox(width: 6),

                                Text(
                                  'Western + Bistro',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF16806F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // =====================================
                      // ALAMAT
                      // =====================================
                      const Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey, size: 23),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              'Jl. Kenanga Raya No. 45, Jakarta Selatan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // =====================================
                      // 3 STATISTIK DALAM ROW
                      // =====================================
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 12,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),

                        child: Row(
                          children: [
                            Expanded(
                              child: statistik(
                                Icons.navigation_outlined,
                                '2.5 km',
                                'Jarak',
                              ),
                            ),

                            Container(
                              height: 60,
                              width: 1,
                              color: Colors.grey.shade300,
                            ),

                            Expanded(
                              child: statistik(
                                Icons.access_time_outlined,
                                '10.00 - 22.00',
                                'Waktu Buka',
                              ),
                            ),

                            Container(
                              height: 60,
                              width: 1,
                              color: Colors.grey.shade300,
                            ),

                            Expanded(
                              child: statistik(
                                Icons.account_balance_wallet_outlined,
                                'Rp 100.000',
                                'Harga Rata-rata',
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // =====================================
                      // DESKRIPSI
                      // maxLines + overflow sesuai spesifikasi
                      // =====================================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'La Brasserie Bistro menghadirkan pengalaman bersantap '
                              'dengan cita rasa khas Eropa dalam suasana yang hangat '
                              'dan elegan. Menggunakan bahan-bahan segar pilihan dan '
                              'racikan chef berpengalaman untuk setiap hidangan istimewa.',

                              maxLines: showFullDescription ? null : 4,

                              overflow: showFullDescription
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4F5559),
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 10),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showFullDescription = !showFullDescription;
                                });
                              },

                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Text(
                                    showFullDescription
                                        ? 'Lebih Sedikit'
                                        : 'Selengkapnya',

                                    style: const TextStyle(
                                      color: Color(0xFF16806F),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(width: 5),

                                  Icon(
                                    showFullDescription
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,

                                    color: const Color(0xFF16806F),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // =====================================
                      // MENU POPULER + LIHAT SEMUA
                      // =====================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            'Menu Populer',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              tampilPesan('Menampilkan semua menu');
                            },

                            child: const Row(
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Color(0xFF16806F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(width: 5),

                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Color(0xFF16806F),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // =====================================
                      // 3 CARD MENU
                      // =====================================
                      Row(
                        children: [
                          Expanded(
                            child: menuCard(
                              index: 0,
                              nama: menu[0]['nama']!,
                              harga: menu[0]['harga']!,
                              gambar: menu[0]['gambar']!,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: menuCard(
                              index: 1,
                              nama: menu[1]['nama']!,
                              harga: menu[1]['harga']!,
                              gambar: menu[1]['gambar']!,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: menuCard(
                              index: 2,
                              nama: menu[2]['nama']!,
                              harga: menu[2]['harga']!,
                              gambar: menu[2]['gambar']!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // WIDGET STATISTIK
  // ==========================================
  Widget statistik(IconData icon, String nilai, String judul) {
    return Column(
      children: [
        Icon(icon, size: 27, color: const Color(0xFF16806F)),

        const SizedBox(height: 8),

        Text(
          nilai,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 7),

        Text(
          judul,
          textAlign: TextAlign.center,

          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // ==========================================
  // CARD MENU
  // Menggunakan STACK
  // Gambar + Favorite + Nama + Harga
  // ==========================================
  Widget menuCard({
    required int index,
    required String nama,
    required String harga,
    required String gambar,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      clipBehavior: Clip.antiAlias,

      child: SizedBox(
        height: 245,

        child: Stack(
          children: [
            // =====================================
            // GAMBAR MENU
            // =====================================
            Positioned(
              top: 0,
              left: 0,
              right: 0,

              child: Image.network(
                gambar,
                height: 135,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 135,
                    color: Colors.grey.shade300,

                    child: const Center(child: Icon(Icons.fastfood, size: 40)),
                  );
                },
              ),
            ),

            // =====================================
            // FAVORIT
            // ♡ -> ❤️
            // =====================================
            Positioned(
              top: 10,
              right: 10,

              child: GestureDetector(
                onTap: () {
                  setState(() {
                    favorit[index] = !favorit[index];
                  });

                  tampilPesan(
                    favorit[index]
                        ? '$nama ditambahkan ke favorit'
                        : '$nama dihapus dari favorit',
                  );
                },

                child: Container(
                  width: 40,
                  height: 40,

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    favorit[index] ? Icons.favorite : Icons.favorite_border,

                    color: favorit[index] ? Colors.red : Colors.grey,

                    size: 25,
                  ),
                ),
              ),
            ),

            // =====================================
            // NAMA MENU
            // =====================================
            Positioned(
              top: 150,
              left: 12,
              right: 12,

              child: Text(
                nama,

                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // =====================================
            // HARGA MENU
            // =====================================
            Positioned(
              top: 205,
              left: 12,
              right: 12,

              child: Text(
                harga,

                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF16806F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
