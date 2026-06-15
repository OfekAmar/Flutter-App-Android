import 'package:flutter/material.dart';
import 'book_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = [
    _Category('Ages 0-4', 'word', Icons.description, Color(0xFF42A5F5)),
    _Category('Ages 0-4', 'pdf', Icons.picture_as_pdf, Color(0xFFEF5350)),
    _Category('Ages 4-8', 'word', Icons.description, Color(0xFF66BB6A)),
    _Category('Ages 4-8', 'pdf', Icons.picture_as_pdf, Color(0xFFFF7043)),
    _Category('Ages 8-12', 'word', Icons.description, Color(0xFFAB47BC)),
    _Category('Ages 8-12', 'pdf', Icons.picture_as_pdf, Color(0xFF26C6DA)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose your child's age:",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 16),
              _ColumnLegend(),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.0,
                  children: _categories
                      .map((cat) => _BookCard(category: cat))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColumnLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _LegendItem(
            icon: Icons.description,
            label: 'Word',
            color: const Color(0xFF1565C0),
          ),
        ),
        Expanded(
          child: _LegendItem(
            icon: Icons.picture_as_pdf,
            label: 'PDF',
            color: const Color(0xFFC62828),
          ),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _LegendItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _BookCard extends StatelessWidget {
  final _Category category;

  const _BookCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BookListScreen(
            ageGroup: category.ageGroup,
            format: category.format,
          ),
        ),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: category.color,
                width: double.infinity,
                child: Icon(
                  category.icon,
                  size: 52,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.ageGroup,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(category.icon,
                              size: 13, color: category.color),
                          const SizedBox(width: 4),
                          Text(
                            category.format.toUpperCase(),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: category.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Category {
  final String ageGroup;
  final String format;
  final IconData icon;
  final Color color;

  const _Category(this.ageGroup, this.format, this.icon, this.color);
}
