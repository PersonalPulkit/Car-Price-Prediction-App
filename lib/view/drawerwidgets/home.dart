import 'package:ai/constants/media_size.dart';
import 'package:ai/custom_widgets/textfield.dart';
import 'package:ai/data/models/predictdetails.dart';
import 'package:ai/data/network/FirestoreServices.dart';
import 'package:ai/enum/input_enum.dart';
import 'package:ai/repository/predict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../custom_widgets/elevatedbutton.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  // Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PredictDetailsService? predict = PredictDetailsService();
  TextEditingController carBrandController = TextEditingController();
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController sellerTypeController = TextEditingController();
  TextEditingController transmissionTypeController = TextEditingController();
  TextEditingController ownerTypeController = TextEditingController();
  TextEditingController numberOfSeatsController = TextEditingController();
  TextEditingController vehicleAgeController = TextEditingController();
  TextEditingController enginePowerController = TextEditingController();
  TextEditingController engineCapacityController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController kilometerDrivenController = TextEditingController();
  FirestoreServices fs= FirestoreServices();

  CarBrand? selectedBrand;
  FuelType? type;
  SellerType? sellerType;
  TransmissionType? transmissionType;
  OwnerType? ownerType;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic>? results;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text("Please enter the details")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: kilometerDrivenController,
                  text: "Kilometer driven",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: mileageController,
                  text: "Mileage",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: engineCapacityController,
                  text: "Engine capacity",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: enginePowerController,
                  text: "Engine power",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: vehicleAgeController,
                  text: "Vehicle age",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: SizedBox(
                width: MediaSize.isCompact(size)
                    ? size.width * 0.5
                    : size.width * 0.4,
                child: CustomTextField(
                  fetchtext: numberOfSeatsController,
                  text: "Number of seats",
                  keyboard: TextInputType.number,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu<CarBrand>(
                  width: MediaSize.isCompact(size)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  leadingIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: selectedBrand == null
                        ? Icon(Icons.manage_search)
                        : Image.network(
                            selectedBrand!.imageUrl,
                            height: size.height * 0.01,
                            width: size.width * 0.01,
                          ),
                  ),
                  label: Text("Select car brand"),
                  controller: carBrandController,
                  onSelected: (CarBrand? brand) {
                    setState(() {
                      selectedBrand = brand!;
                    });
                  },
                  dropdownMenuEntries: CarBrand.values
                      .map<DropdownMenuEntry<CarBrand>>((CarBrand brand) {
                    return DropdownMenuEntry<CarBrand>(
                      value: brand,
                      label: brand.label,
                      leadingIcon: Image.network(
                        brand.imageUrl,
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu<FuelType>(
                  width: MediaSize.isCompact(size)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  label: Text("Select fuel type"),
                  onSelected: (FuelType? type) {
                    this.type = type;
                  },
                  controller: fuelTypeController,
                  dropdownMenuEntries: FuelType.values
                      .map<DropdownMenuEntry<FuelType>>((FuelType type) {
                    return DropdownMenuEntry<FuelType>(
                        value: type, label: type.label);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu<SellerType>(
                  width: MediaSize.isCompact(size)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  label: Text("Select seller type"),
                  onSelected: (SellerType? stype) {
                    this.sellerType = stype;
                  },
                  controller: sellerTypeController,
                  dropdownMenuEntries: SellerType.values
                      .map<DropdownMenuEntry<SellerType>>(
                          (SellerType sellerType) {
                    return DropdownMenuEntry<SellerType>(
                        value: sellerType, label: sellerType.label);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu<TransmissionType>(
                  width: MediaSize.isCompact(size)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  label: Text("Select transmission type"),
                  onSelected: (TransmissionType? ttype) {
                    this.transmissionType = ttype;
                  },
                  controller: transmissionTypeController,
                  dropdownMenuEntries: TransmissionType.values
                      .map<DropdownMenuEntry<TransmissionType>>(
                          (TransmissionType transmissionType) {
                    return DropdownMenuEntry<TransmissionType>(
                        value: transmissionType, label: transmissionType.label);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownMenu<OwnerType>(
                  width: MediaSize.isCompact(size)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  label: Text("Select owner type"),
                  onSelected: (OwnerType? otype) {
                    this.ownerType = otype;
                  },
                  controller: ownerTypeController,
                  dropdownMenuEntries: OwnerType.values
                      .map<DropdownMenuEntry<OwnerType>>((OwnerType ownerType) {
                    return DropdownMenuEntry<OwnerType>(
                        value: ownerType, label: ownerType.label);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: CustomElevatedButton(
                text: "Check",
                callBack: () async {
                  PredictDetails? details = PredictDetails(
                      kmDriven: int.parse(kilometerDrivenController.text),
                      fuel: fuelTypeController.text,
                      sellerType: sellerTypeController.text,
                      transmission: transmissionTypeController.text,
                      owner: ownerTypeController.text,
                      mileage: double.parse(mileageController.text),
                      engine: int.parse(engineCapacityController.text),
                      maxPower: int.parse(enginePowerController.text),
                      seats: int.parse(numberOfSeatsController.text),
                      brand: carBrandController.text,
                      vehicleAge: int.parse(vehicleAgeController.text));
                  if (kDebugMode) {
                    print(details);
                  }
                  results = await predict!.predictDetailsApi(details);
                  if (kDebugMode) {
                    print(results);
                    print(results!.values);
                  }
                  await fs.addDataToFirestore(carBrandController.text, results?["prediction"], double.parse(mileageController.text), transmissionTypeController.text);
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: size.height * 0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Current car value is ₹${results?["prediction"].toString()} "),
                              ElevatedButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  // setState(() {
                  // result = results!.values.first;
                  // });
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
