import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:majadigi/core/widgets/auth_header_widget.dart';

class LaporanHoaksLacak extends StatefulWidget {
  const LaporanHoaksLacak({super.key});

  @override
  State<LaporanHoaksLacak> createState() =>
      _LaporanHoaksLacakState();
}

class _LaporanHoaksLacakState
    extends State<LaporanHoaksLacak> {
  final TextEditingController ticketController =
  TextEditingController();

  bool hasResult = true;

  String status = 'processing';

  Map<String, dynamic>? resultData;

  @override
  void initState() {
    super.initState();

    /// Dummy awal (sesuai mockup pertama)
    ticketController.text = '8889991202';
  }

  void handleTrackTicket() {
    final ticket = ticketController.text.trim();

    if (ticket.isEmpty) return;

    /// TIKET DIPROSES
    if (ticket == '8889991202') {
      setState(() {
        hasResult = true;
        status = 'processing';
      });
    }

    /// TIKET SELESAI
    else if (ticket == '9998887776') {
      setState(() {
        hasResult = true;
        status = 'completed';

        resultData = {
          'image':
          'lib/assets/images/hoaks_sample.png',
          'title':
          'Donald Trump Singgung Sunni dan Syiah di Indonesia terkait Dukungan ke Iran',
          'date': '17 April 2026',
          'classification': 'HOAKS',
        };
      });
    }

    /// Default
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nomor tiket tidak ditemukan',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    ticketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          AuthHeaderWidget(
            imagePath:
            'lib/assets/images/hoaks_background.png',
            showTitle: true,
            title: 'Lacak Tiket Laporan',
            onBackPressed: () {
              context.pop();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      'lib/assets/images/lacak_laporan.png',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildTrackingForm(),

                  const SizedBox(height: 24),

                  if (hasResult)
                    status == 'processing'
                        ? _buildProcessingCard()
                        : _buildCompletedCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            'Pelacakan Tiket\nPermohonan Anda',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'masukkan no tiket yang telah dikirim ke\nWhatsApp dan Email anda.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 24),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'No Tiket',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: ticketController,
            decoration: InputDecoration(
              hintText: 'Nomor temuan anda',
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: handleTrackTicket,
              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xFF1D73FF),
              ),
              child: const Text(
                'Lacak',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Dummy:\n8889991202 = Diproses\n9998887776 = Selesai',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4E5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.access_time_filled,
              color: Color(0xFFF5A623),
              size: 42,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Tiket Laporan anda\nSedang Diproses',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Berikut adalah tiket laporan hoaks anda',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                const Color(0xFF1D73FF),
              ),
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    ticketController.text,
                    textAlign:
                    TextAlign.center,
                    style: const TextStyle(
                      color:
                      Color(0xFF1D73FF),
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text:
                        ticketController.text,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color:
                    Color(0xFF1D73FF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCard() {
    final data = resultData!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Image.asset(
              data['image'],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      data['date'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      data['classification'],
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  data['title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight:
                    FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}