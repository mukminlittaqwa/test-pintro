import 'package:flutter/material.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Pendaftaran')),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: RegistrationScreen(),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;

  final List<String> stepTitles = [
    "Pelaksanaan Observasi",
    "Proses Pembayaran",
    "Pengumuman Observasi",
    "Proses Daftar Ulang",
    "Proses Pembayaran Uang Pangkal"
  ];

  final List<String> stepDescriptions = [
    "Peserta mengikuti observasi sesuai jadwal yang telah ditentukan.",
    "Peserta melakukan pembayaran sesuai dengan ketentuan yang berlaku.",
    "Pengumuman hasil observasi akan diinformasikan melalui portal resmi.",
    "Peserta yang lolos melakukan daftar ulang untuk memastikan tempat.",
    "Peserta melakukan pembayaran uang pangkal sebagai tahap akhir."
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hallo, Firdaus 👋",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        const Text(
          "Kamu telah menyelesaikan pembayaran uang formulir. "
          "Silakan lengkapi data dan ikuti tes/observasi sesuai jadwal.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.event, size: 40, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Jadwal Ujian Seleksi",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Klik di sini untuk melihat jadwal",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward, color: Colors.blue),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text("Lengkapi Administrasi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
              child: BerkasCard(
                imagePath: 'assets/folder_icon.png',
                title: "Berkas Dokumen",
                description: "Yuk, jangan lupa isi berkas pendaftaran!",
                bgColor: Colors.green,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: BerkasCard(
                imagePath: 'assets/document_icon.png',
                title: "Dokumen Tambahan",
                description: "Pastikan semua dokumen lengkap!",
                bgColor: Colors.blue,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        const Text("Lengkapi Pendaftaran", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),


  Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Stepper(
          currentStep: _currentStep,
          type: StepperType.vertical,
          onStepTapped: (index) {
            setState(() {
              _currentStep = index;
            });
          },
          onStepContinue: () {
            if (_currentStep < stepTitles.length - 1) {
              setState(() => _currentStep += 1);
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentStep > 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text("Back"),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 10),
                  if (_currentStep < stepTitles.length - 1)
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text("Continue"),
                    ),
                ],
              ),
            );
          },
          steps: List.generate(stepTitles.length, (index) {
            return Step(
              title: Text(
                stepTitles[index],
                style: TextStyle(
                  fontWeight: _currentStep == index ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stepDescriptions[index]),
                  const SizedBox(height: 16),
                ],
              ),
              isActive: _currentStep >= index,
            );
          }),
        ),
      ],
    ),
  ),
      ],
    );
  }
}

class BerkasCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color bgColor;

  const BerkasCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
