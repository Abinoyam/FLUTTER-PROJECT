import 'package:flutter/material.dart';

class StageCard extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const StageCard({
    super.key, required this.number, required this.title,
    required this.description, required this.icon, required this.onTap,
  });

  static const colors = [
    Color(0xFF142D3D), Color(0xFF1688F5), Color(0xFF6C63FF), Color(0xFF0B83E6),
    Color(0xFF12A879), Color(0xFF8B5CF6), Color(0xFFF59E0B), Color(0xFF7C3AED),
    Color(0xFF0284C7), Color(0xFF0F766E),
  ];

  @override
  Widget build(BuildContext context) {
    final color = colors[(number - 1) % colors.length];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                width: 43, height: 43,
                decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(icon, color: color, size: 23),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(color: color.withOpacity(.10), borderRadius: BorderRadius.circular(20)),
                child: Text('EXP ${number.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: color)),
              ),
            ]),
            const Spacer(),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
            const SizedBox(height: 4),
            Text(description, maxLines: 2, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11.5, height: 1.3, color: Color(0xFF718096))),
          ]),
        ),
      ),
    );
  }
}
