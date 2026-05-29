import 'package:flutter/material.dart';

class AulaCard extends StatelessWidget {
  final String image;
  final String title;
  final String capacity;
  final String price;
  final VoidCallback onPressed;

  const AulaCard({
    super.key,
    required this.image,
    required this.title,
    required this.capacity,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Image.asset(
            image,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 12),

                /// INFO
                Row(
                  children: [
                    Expanded(
                      child: InfoItem(
                        label: 'Kapasitas',
                        icon: Icons.groups_2,
                        iconColor: const Color(0xFF1565F9),
                        value: capacity,
                      ),
                    ),
                    Expanded(
                      child: InfoItem(
                        label: 'Tarif mulai dari',
                        icon: Icons.payments_outlined,
                        iconColor: const Color(0xFF27AE60),
                        value: price,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF1565F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Detail Pesanan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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

class InfoItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final String value;

  const InfoItem({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8E8E93),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: iconColor,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}