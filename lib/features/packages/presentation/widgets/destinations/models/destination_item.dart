class DestinationItem {
  final String imageUrl;
  final String city;
  final String title;
  final String subtitle;

  const DestinationItem({
    required this.imageUrl,
    required this.city,
    required this.title,
    required this.subtitle,
  });
}

const List<DestinationItem> sampleDestinations = [
  DestinationItem(
    imageUrl:
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&auto=format&fit=crop',
    city: 'دبي',
    title: 'برج خليفة',
    subtitle: 'أطول مبنى في العالم',
  ),
  DestinationItem(
    imageUrl:
        'https://images.unsplash.com/photo-1609137144813-7d9921338f24?w=800&auto=format&fit=crop',
    city: 'دبي',
    title: 'برج العرب',
    subtitle: 'فندق أيقوني من فئة 7 نجوم',
  ),
  DestinationItem(
    imageUrl:
        'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&auto=format&fit=crop',
    city: 'دبي',
    title: 'نافورة دبي',
    subtitle: 'عرض مائي مذهل',
  ),
];
