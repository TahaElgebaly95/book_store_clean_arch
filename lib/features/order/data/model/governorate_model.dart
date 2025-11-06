class Governorate {
  final int id;
  final String nameEn;
  final String nameAr;

  const Governorate({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });
}

class GovernorateData {
  static const List<Governorate> egyptGovernorates = [
    Governorate(id: 1, nameEn: 'Cairo', nameAr: 'القاهرة'),
    Governorate(id: 2, nameEn: 'Giza', nameAr: 'الجيزة'),
    Governorate(id: 3, nameEn: 'Alexandria', nameAr: 'الإسكندرية'),
    Governorate(id: 4, nameEn: 'Dakahlia', nameAr: 'الدقهلية'),
    Governorate(id: 5, nameEn: 'Red Sea', nameAr: 'البحر الأحمر'),
    Governorate(id: 6, nameEn: 'Beheira', nameAr: 'البحيرة'),
    Governorate(id: 7, nameEn: 'Fayoum', nameAr: 'الفيوم'),
    Governorate(id: 8, nameEn: 'Gharbiya', nameAr: 'الغربية'),
    Governorate(id: 9, nameEn: 'Ismailia', nameAr: 'الإسماعيلية'),
    Governorate(id: 10, nameEn: 'Menofia', nameAr: 'المنوفية'),
    Governorate(id: 11, nameEn: 'Minya', nameAr: 'المنيا'),
    Governorate(id: 12, nameEn: 'Qaliubiya', nameAr: 'القليوبية'),
    Governorate(id: 13, nameEn: 'New Valley', nameAr: 'الوادي الجديد'),
    Governorate(id: 14, nameEn: 'Suez', nameAr: 'السويس'),
    Governorate(id: 15, nameEn: 'Aswan', nameAr: 'أسوان'),
    Governorate(id: 16, nameEn: 'Assiut', nameAr: 'أسيوط'),
    Governorate(id: 17, nameEn: 'Beni Suef', nameAr: 'بني سويف'),
    Governorate(id: 18, nameEn: 'Port Said', nameAr: 'بورسعيد'),
    Governorate(id: 19, nameEn: 'Damietta', nameAr: 'دمياط'),
    Governorate(id: 20, nameEn: 'Sharkia', nameAr: 'الشرقية'),
    Governorate(id: 21, nameEn: 'South Sinai', nameAr: 'جنوب سيناء'),
    Governorate(id: 22, nameEn: 'Kafr El Sheikh', nameAr: 'كفر الشيخ'),
    Governorate(id: 23, nameEn: 'Matrouh', nameAr: 'مطروح'),
    Governorate(id: 24, nameEn: 'Luxor', nameAr: 'الأقصر'),
    Governorate(id: 25, nameEn: 'Qena', nameAr: 'قنا'),
    Governorate(id: 26, nameEn: 'North Sinai', nameAr: 'شمال سيناء'),
    Governorate(id: 27, nameEn: 'Sohag', nameAr: 'سوهاج'),
  ];
}