// ─── Place Item Model ─────────────────────────────────────────────────────────
class PlaceItem {
  final String imageUrl;
  final String name;
  final String desc;

  const PlaceItem({
    required this.imageUrl,
    required this.name,
    required this.desc,
  });
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
const List<PlaceItem> sampleCities = [
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&auto=format&fit=crop',
    name: 'ويستمنستر',
    desc: 'قلب لندن ومقر المعالم التاريخية الشهيرة',
  ),
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1583394293948-f94e0f2b3d19?w=800&auto=format&fit=crop',
    name: 'ايدنبرة',
    desc: 'بوابة اسكتلندا التاريخية الأكثر سحراً',
  ),
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1526129318478-62ed807ebdf9?w=800&auto=format&fit=crop',
    name: 'كامبريدج',
    desc: 'مدينة العلم والتاريخ والجامعات العريقة',
  ),
];

const List<PlaceItem> sampleActivities = [
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1520986606214-8b456906c813?w=800&auto=format&fit=crop',
    name: 'قصر باكنغهام',
    desc: 'تعرف على تاريخ العائلة المالكة',
  ),
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&auto=format&fit=crop',
    name: 'جسر لندن',
    desc: 'أشهر معالم لندن وأحد أجمل الجسور عالمياً',
  ),
  PlaceItem(
    imageUrl:
        'https://images.unsplash.com/photo-1583394293948-f94e0f2b3d19?w=800&auto=format&fit=crop',
    name: 'المتحف البريطاني',
    desc: 'أكبر المتاحف في العالم وأغناها بالتحف',
  ),
];
