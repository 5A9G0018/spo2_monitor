import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../spo2_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  Color getSpo2Color(int spo2) {
    if (spo2 >= 95) return Colors.green.shade600;
    if (spo2 >= 90) return Colors.orange.shade700;
    return Colors.red.shade700;
  }

  String formatTimestamp(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    final ss = dt.second.toString().padLeft(2, '0');
    return '$y/$m/$d $hh:$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Spo2Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('歷史紀錄'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2F1), Color(0xFF80CBC4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: provider.feeds.isEmpty
            ? const Center(
          child: Text(
            '尚無紀錄',
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
        )
            : ListView.builder(
          padding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          itemCount: provider.feeds.length,
          itemBuilder: (context, myIndex) {
            int index = provider.feeds.length - 1 - myIndex;
            final record = provider.feeds[index];
            final spo2Color = getSpo2Color(int.parse(record['field1']));

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.teal.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.shade100.withOpacity(0.6),
                    blurRadius: 10,
                    offset: const Offset(3, 6),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 20),
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [spo2Color.withOpacity(0.7), spo2Color],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: spo2Color.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                title: Text(
                  'SpO₂: ${record['field1']}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: spo2Color,
                    letterSpacing: 1.1,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '心率: ${record['field2']} bpm',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        formatTimestamp(DateTime.parse(record['created_at']).toLocal()),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}