import 'package:flutter_any_logo/flutter_logo.dart';

enum CarBrand {
  Maruti(
      "https://cdn.iconscout.com/icon/free/png-512/free-suzuki-3441300-2874749.png?f=webp&w=256",
      "Maruti"),
  Skoda(
      "https://cdn.iconscout.com/icon/free/png-512/free-skoda-1-202898.png?f=webp&w=256",
      "Skoda"),
  Honda(
      "https://cdn.iconscout.com/icon/free/png-512/free-honda-car-3441177-2874282.png?f=webp&w=256",
      "Honda"),
  Hyundai(
      "https://cdn.iconscout.com/icon/free/png-512/free-hyundai-6-202804.png?f=webp&w=256",
      "Hyundai"),
  Toyota(
      "https://cdn.iconscout.com/icon/free/png-512/free-toyota-3441648-2874417.png?f=webp&w=256",
      "Toyota"),
  Ford(
      "https://cdn.iconscout.com/icon/free/png-512/free-ford-1-202767.png?f=webp&w=256",
      "Ford"),
  Renault(
      "https://cdn.iconscout.com/icon/free/png-512/free-renault-3441635-2874404.png?f=webp&w=256",
      "Renault"),
  Mahindra(
      "https://cdn.iconscout.com/icon/free/png-512/free-mahindra-3441615-2874384.png?f=webp&w=256",
      "Mahindra"),
  Tata(
      "https://cdn.iconscout.com/icon/free/png-512/free-tata-3441644-2874413.png?f=webp&w=256",
      "Tata"),
  Chevrolet(
      "https://cdn.iconscout.com/icon/free/png-512/free-chevrolet-3-202739.png?f=webp&w=256",
      "Chevrolet"),
  Datsun(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Datsun_logo.png/1024px-Datsun_logo.png",
      "Datsun"),
  Jeep(
      "https://cdn.iconscout.com/icon/free/png-512/free-jeep-59-202822.png?f=webp&w=256",
      "Jeep"),
  MercedesBenz(
      "https://cdn.iconscout.com/icon/free/png-512/free-mercedes-202837.png?f=webp&w=256",
      "MercedesBenz"),
  Mitsubishi(
      "https://cdn.iconscout.com/icon/free/png-512/free-mitsubishi-1-202851.png?f=webp&w=256",
      "Mitsubishi"),
  Audi(
      "https://cdn.iconscout.com/icon/free/png-512/free-audi-6-282743.png?f=webp&w=256",
      "Audi"),
  Volkswagen(
      "https://cdn.iconscout.com/icon/free/png-512/free-volkswagen-51-202922.png?f=webp&w=256",
      "Volkswagen");

  const CarBrand(this.imageUrl, this.label);
  final String imageUrl;
  final String label;
}

enum FuelType{
  Petrol("Petrol"),
  Diesel("Diesel"),
  LPG("LPG"),
  CNG("CNG")
  ;
  const FuelType(this.label);
  final String label;
}
enum SellerType{
  Individual("Individual"),
  Dealer("Dealer"),
  TrustmarkDealer("Trustmark Dealer")
  ;
  const SellerType(this.label);
  final String label;
}
enum TransmissionType{
  Manual("Manual"),
  Automatic("Automatic")
  ;
  const TransmissionType(this.label);
  final String label;
}
enum OwnerType{
  One("1"),
  Two("2"),
  Three("3"),
  Four("4"),
  TestDriveCar("Test Drive Car")
  ;
  const OwnerType(this.label);
  final String label;
}