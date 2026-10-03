
import 'package:flutter/material.dart';

// =============================================================
// HALAMAN PROFIL
// =============================================================

class PilihMatakuliah extends StatefulWidget {
  const PilihMatakuliah({super.key});

  @override
  State<PilihMatakuliah> createState() =>
      _PilihMatakuliahState();
}

class _PilihMatakuliahState
    extends State<PilihMatakuliah> {
  final formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();

  bool drawerOpen = false;

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  void bukaMataKuliah() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DaftarMatakuliah(
          nama: namaController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),

      appBar: AppBar(
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1976D2),
                Color(0xFF512DA8),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // =================================================
          // BACKGROUND
          // =================================================

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE3F2FD),
                  Color(0xFFF5F7FA),
                  Color(0xFFE8EAF6),
                ],
              ),
            ),
          ),

          // =================================================
          // ORNAMEN
          // =================================================

          Positioned(
            top: -60,
            right: -50,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.08),
              ),
            ),
          ),

          Positioned(
            bottom: -70,
            left: -60,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple.withOpacity(0.08),
              ),
            ),
          ),

          // =================================================
          // CONTENT
          // =================================================

          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // =================================================
              // PROFILE CARD
              // =================================================

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.96),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'BIODATA MAHASISWA',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // =================================================
                    // FOTO
                    // =================================================

                    Container(
                      width: 145,
                      height: 145,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF42A5F5),
                            Color(0xFF7E57C2),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/foto_formal.jpeg',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                size: 75,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Salsabila Adnina Hadi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Mahasiswa Informatika',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),

                    biodataItem(
                      'NIM',
                      '2411022',
                      Icons.badge,
                    ),

                    biodataItem(
                      'Semester',
                      '5',
                      Icons.school,
                    ),

                    biodataItem(
                      'Kelas',
                      'IFB5A',
                      Icons.groups,
                    ),

                    biodataItem(
                      'Prodi',
                      'Informatika',
                      Icons.computer,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // =================================================
              // RINGKASAN
              // =================================================

              Row(
                children: [
                  Expanded(
                    child: summaryCard(
                      Icons.school,
                      'Semester',
                      '5',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: summaryCard(
                      Icons.credit_score,
                      'Target SKS',
                      '24',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // =================================================
              // FORM
              // =================================================

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.96),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mulai Pengisian',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1565C0),
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'Masukkan nama untuk melanjutkan ke pemilihan mata kuliah.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Mahasiswa',
                          hintText: 'Masukkan nama lengkap',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xFF1976D2),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F7FA),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return 'Nama wajib diisi';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF1976D2),
                                Color(0xFF512DA8),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: bukaMataKuliah,
                            icon: const Icon(
                              Icons.arrow_forward,
                            ),
                            label: const Text(
                              'PILIH MATA KULIAH',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // INFORMASI
              // =================================================

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1976D2),
                      Color(0xFF512DA8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Pastikan data dan mata kuliah yang dipilih sudah sesuai sebelum disimpan.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget biodataItem(
    String label,
    String value,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1976D2),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(':'),
          const SizedBox(width: 10),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget summaryCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF1976D2),
            size: 30,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF512DA8),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// DRAWER
// =============================================================

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 25,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1976D2),
                  Color(0xFF512DA8),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 95,
                  height: 95,
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/foto_formal.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 55,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Salsabila Adnina Hadi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  '2411022 • IFB5A',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color(0xFF1976D2),
            ),
            title: const Text('Profil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.menu_book,
              color: Color(0xFF1976D2),
            ),
            title: const Text('Mata Kuliah'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DaftarMatakuliah(
                    nama: 'Salsabila Adnina Hadi',
                  ),
                ),
              );
            },
          ),

          const Spacer(),

          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const _LoginKembali(),
                ),
                (route) => false,
              );
            },
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

// =============================================================
// LOGIN KEMBALI
// =============================================================

class _LoginKembali extends StatelessWidget {
  const _LoginKembali();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// =============================================================
// DAFTAR MATA KULIAH
// =============================================================

class DaftarMatakuliah extends StatefulWidget {
  final String nama;

  const DaftarMatakuliah({
    super.key,
    required this.nama,
  });

  @override
  State<DaftarMatakuliah> createState() =>
      _DaftarMatakuliahState();
}

class _DaftarMatakuliahState
    extends State<DaftarMatakuliah> {
  bool mobile = false;
  bool jaringan = false;
  bool basisData = false;
  bool sistemOperasi = false;
  bool rpl = false;

  int totalSKS() {
    int total = 0;

    if (mobile) total += 3;
    if (jaringan) total += 3;
    if (basisData) total += 3;
    if (sistemOperasi) total += 3;
    if (rpl) total += 3;

    return total;
  }

  List<String> pilihan() {
    final list = <String>[];

    if (mobile) {
      list.add('Pemrograman Mobile');
    }

    if (jaringan) {
      list.add('Jaringan Komputer');
    }

    if (basisData) {
      list.add('Basis Data');
    }

    if (sistemOperasi) {
      list.add('Sistem Operasi');
    }

    if (rpl) {
      list.add('Rekayasa Perangkat Lunak');
    }

    return list;
  }

  void simpan() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilPilihan(
          nama: widget.nama,
          pilihan: pilihan(),
          totalSKS: totalSKS(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sks = totalSKS();
    final progress = (sks / 24).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Mata Kuliah',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1976D2),
                Color(0xFF512DA8),
              ],
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE3F2FD),
                  Color(0xFFF5F7FA),
                  Color(0xFFE8EAF6),
                ],
              ),
            ),
          ),

          Positioned(
            top: -70,
            right: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.08),
              ),
            ),
          ),

          Positioned(
            bottom: -80,
            left: -50,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple.withOpacity(0.08),
              ),
            ),
          ),

          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // =================================================
              // DATA SINGKAT
              // =================================================

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF1976D2),
                            Color(0xFF512DA8),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            'NIM 2411022 • IFB5A • Semester 5',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Daftar Mata Kuliah',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Pilih mata kuliah yang ingin kamu ambil.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 12),

              mataKuliah(
                Icons.phone_android,
                'Pemrograman Mobile',
                mobile,
                (value) {
                  setState(() {
                    mobile = value;
                  });
                },
              ),

              mataKuliah(
                Icons.wifi,
                'Jaringan Komputer',
                jaringan,
                (value) {
                  setState(() {
                    jaringan = value;
                  });
                },
              ),

              mataKuliah(
                Icons.storage,
                'Basis Data',
                basisData,
                (value) {
                  setState(() {
                    basisData = value;
                  });
                },
              ),

              mataKuliah(
                Icons.computer,
                'Sistem Operasi',
                sistemOperasi,
                (value) {
                  setState(() {
                    sistemOperasi = value;
                  });
                },
              ),

              mataKuliah(
                Icons.code,
                'Rekayasa Perangkat Lunak',
                rpl,
                (value) {
                  setState(() {
                    rpl = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // =================================================
              // PROGRESS SKS
              // =================================================

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Progress SKS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          '$sks / 24 SKS',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF512DA8),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 12,
                        backgroundColor:
                            const Color(0xFFE0E0E0),
                        valueColor:
                            const AlwaysStoppedAnimation(
                          Color(0xFF512DA8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      sks == 0
                          ? 'Belum ada mata kuliah dipilih.'
                          : 'Kamu telah memilih $sks SKS.',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // =================================================
              // BUTTON
              // =================================================

              SizedBox(
                height: 55,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1976D2),
                        Color(0xFF512DA8),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: simpan,
                    icon: const Icon(
                      Icons.save_rounded,
                    ),
                    label: const Text(
                      'SIMPAN PILIHAN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent,
                      foregroundColor:
                          Colors.white,
                      shadowColor:
                          Colors.transparent,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget mataKuliah(
    IconData icon,
    String nama,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: (newValue) {
          onChanged(newValue ?? false);
        },
        activeColor: const Color(0xFF512DA8),
        secondary: CircleAvatar(
          backgroundColor: const Color(0xFFE3F2FD),
          child: Icon(
            icon,
            color: const Color(0xFF1976D2),
          ),
        ),
        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('3 SKS'),
      ),
    );
  }
}

// =============================================================
// HASIL PILIHAN
// =============================================================

class HasilPilihan extends StatelessWidget {
  final String nama;
  final List<String> pilihan;
  final int totalSKS;

  const HasilPilihan({
    super.key,
    required this.nama,
    required this.pilihan,
    required this.totalSKS,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Pilihan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1976D2),
                Color(0xFF512DA8),
              ],
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFF5F7FA),
              Color(0xFFE8EAF6),
            ],
          ),
        ),

        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),

            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF43A047),
                    Color(0xFF66BB6A),
                  ],
                ),
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 55,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Pilihan Berhasil Disimpan!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Mahasiswa',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),

                  const SizedBox(height: 15),

                  dataRow('Nama', 'Salsabila Adnina Hadi'),
                  dataRow('NIM', '2411022'),
                  dataRow('Semester', '5'),
                  dataRow('Kelas', 'IFB5A'),
                  dataRow('Prodi', 'Informatika'),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mata Kuliah Dipilih',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),

                  const SizedBox(height: 15),

                  if (pilihan.isEmpty)
                    const Text(
                      'Belum ada mata kuliah dipilih.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ...pilihan.map(
                    (item) => Container(
                      margin:
                          const EdgeInsets.only(
                        bottom: 8,
                      ),
                      padding:
                          const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFF5F7FA),
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                          const Text(
                            '3 SKS',
                            style: TextStyle(
                              color:
                                  Color(0xFF512DA8),
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Divider(height: 25),

                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total SKS',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(0xFF1976D2),
                              Color(0xFF512DA8),
                            ],
                          ),
                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Text(
                          '$totalSKS SKS',
                          style:
                              const TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                label: const Text(
                  'KEMBALI',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF1976D2),
                  foregroundColor:
                      Colors.white,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataRow(
    String label,
    String value,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 8),
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius:
            BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
          const Text(':'),
          const SizedBox(width: 10),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
