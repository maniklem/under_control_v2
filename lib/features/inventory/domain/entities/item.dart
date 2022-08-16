import 'package:equatable/equatable.dart';

import 'item_amount_in_location.dart';

enum ItemUnit {
  pcs('pcs'),
  kg('kg'),
  liter('liter'),
  unknown('unknown');

  final String name;

  const ItemUnit(this.name);

  factory ItemUnit.fromString(String name) {
    switch (name) {
      case 'pcs':
        return ItemUnit.pcs;
      case 'kg':
        return ItemUnit.kg;
      case 'liter':
        return ItemUnit.liter;
      default:
        return ItemUnit.unknown;
    }
  }
}

class Item extends Equatable {
  final String id;
  final String name;
  final String description;
  final String itemPhoto;
  final ItemUnit itemUnit;
  final List<String> locations;
  final List<ItemAmountInLocation> amountInLocations;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.itemPhoto,
    required this.itemUnit,
    required this.locations,
    required this.amountInLocations,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      itemPhoto,
      itemUnit,
      locations,
      amountInLocations,
    ];
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, description: $description, itemPhoto: $itemPhoto, itemUnit: $itemUnit, locations: $locations, amountInLocations: $amountInLocations)';
  }
}
