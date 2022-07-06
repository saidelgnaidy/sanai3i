import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/models/service_model/service_model.dart';

Future addServices() async {
  try {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var e in shopsList) {
      DocumentReference doc = FBCR.fbi.collection('Services').doc();
      batch.set(doc, e.copyWith(type: ServiceType.shop).toMap());
    }
    for (var e in jopList) {
      DocumentReference doc = FBCR.fbi.collection('Services').doc();
      batch.set(doc, e.copyWith(type: ServiceType.job).toMap());
    }
    for (var e in transport) {
      DocumentReference doc = FBCR.fbi.collection('Services').doc();
      batch.set(doc, e.copyWith(type: ServiceType.transport).toMap());
    }

    await batch.commit();
  } catch (e) {
    debugPrint("from batch : $e");
  }
}

List<ServiceModel> jopList = [
  ServiceModel(nameAr: 'ميكانيكي', nameEn: "Mechanistic"),
  ServiceModel(nameAr: 'كهربائي', nameEn: "Electrician"),
  ServiceModel(nameAr: 'كوافير متنقل', nameEn: 'Hair Stylist'),
  ServiceModel(nameAr: 'نظافة المنزل', nameEn: 'Home Cleaning'),
  ServiceModel(nameAr: 'سباك', nameEn: 'Plumber'),
  ServiceModel(nameAr: 'نقاش', nameEn: "Engraver"),
  ServiceModel(nameAr: 'عامل بناء', nameEn: "Builder"),
  ServiceModel(nameAr: 'مبلط سيراميك', nameEn: "Ceramic"),
  ServiceModel(nameAr: 'سمسار عقارات', nameEn: "Realtor"),
  ServiceModel(nameAr: 'نجار مسلح', nameEn: "Mechanistic"),
  ServiceModel(nameAr: 'نجار باب', nameEn: "Carpenter"),
  ServiceModel(nameAr: 'لحام كهربائي', nameEn: 'Welder'),
  ServiceModel(nameAr: 'حلاق متنقل', nameEn: 'Hair dresser'),
  ServiceModel(nameAr: 'استرجي', nameEn: "Furniture paint"),
  ServiceModel(nameAr: 'حداد', nameEn: "Smith"),
  ServiceModel(nameAr: 'فني الوميتال', nameEn: "Alumital technician"),
  ServiceModel(nameAr: 'صيانة دش', nameEn: "TV Maintenance"),
  ServiceModel(nameAr: 'تنجيد و ستائر', nameEn: "Upholstery"),
  ServiceModel(nameAr: 'فني تكييفات', nameEn: "Air conditioning technician"),
  ServiceModel(nameAr: 'صيانة اجهزة منزلية', nameEn: "Appliances Maintenance"),
  ServiceModel(nameAr: 'فلاتر مياه', nameEn: "Water filters"),
  ServiceModel(nameAr: 'مبيض محارة', nameEn: "plasterer"),
  ServiceModel(nameAr: 'حمامات سباحة', nameEn: "Swimming pool"),
  ServiceModel(nameAr: 'تدفئة مركزية', nameEn: "Central heating"),
  ServiceModel(nameAr: 'طباخ', nameEn: "Chef"),
  ServiceModel(nameAr: 'خياط متنقل', nameEn: 'Dressmaker'),
  ServiceModel(nameAr: 'مكافحة حشرات', nameEn: 'Anti Bugs'),
  ServiceModel(nameAr: 'كاميرات مراقبة', nameEn: "Security cameras"),
];

List<ServiceModel> transport = [
  ServiceModel(nameAr: 'سائق سيارة أجرة', nameEn: 'Cab Driver'),
  ServiceModel(nameAr: 'سائق اتوبيس', nameEn: 'Bus-man'),
  ServiceModel(nameAr: 'خدمات الرحلات', nameEn: "Tour Services"),
  ServiceModel(nameAr: 'نقل أثاث', nameEn: "Moving furniture"),
];

List<ServiceModel> shopsList = [
  ServiceModel(nameAr: 'جزارة', nameEn: 'Butchery'),
  ServiceModel(nameAr: 'مشويات', nameEn: 'Barbecue'),
  ServiceModel(nameAr: 'مطبعة', nameEn: 'Printing press'),
  ServiceModel(nameAr: 'مغسلة', nameEn: 'Laundry'),
  ServiceModel(nameAr: 'مخبز', nameEn: 'Bakery'),
  ServiceModel(nameAr: 'ورشة خراطة', nameEn: 'Turning workshop'),
  ServiceModel(nameAr: 'حدايد و بويات', nameEn: "Iron and paint"),
  ServiceModel(nameAr: 'زجاج', nameEn: 'Glass'),
  ServiceModel(nameAr: 'معرض سيراميك', nameEn: "Ceramics Showroom"),
  ServiceModel(nameAr: 'تكييفات', nameEn: 'Air conditioning'),
  ServiceModel(nameAr: 'دهانات و ديكورات', nameEn: "Paints and Decorations"),
  ServiceModel(nameAr: 'ادوات صحية', nameEn: "Plumbing equipment"),
  ServiceModel(nameAr: 'كهرباء و اضاءة', nameEn: "Electricity equipment"),
  ServiceModel(nameAr: 'اثاث منزلي', nameEn: "Home furniture"),
  ServiceModel(nameAr: 'رخام و جيرانيت', nameEn: "Marble and granite"),
  ServiceModel(nameAr: 'عدد و ادوات', nameEn: "Tools & equipment "),
  ServiceModel(nameAr: 'خامات خشب', nameEn: 'Wood materials'),
  ServiceModel(nameAr: 'كاميرات مراقبة', nameEn: "Security cameras"),
  ServiceModel(nameAr: 'مراتب و ستائر', nameEn: 'Mattresses and curtains'),
  ServiceModel(nameAr: 'اجهزة منزلية', nameEn: "Home appliances"),
  ServiceModel(nameAr: 'محل ورد', nameEn: 'Flower shop'),
  ServiceModel(nameAr: 'سجاد و موكيت', nameEn: "Carpeting"),
];
