class PackageModel {
  final String id;
  final String packageCode;
  final String packageName;
  final String packageType;
  final String destinationCountry;
  final List<String> destinations;
  final int duration;
  final DateTime departureDate;
  final DateTime returnDate;
  final double price;
  final String currency;
  final int quota;
  final int availableSeat;
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String? updatedBy;

  const PackageModel({
    required this.id,
    required this.packageCode,
    required this.packageName,
    required this.packageType,
    required this.destinationCountry,
    required this.destinations,
    required this.duration,
    required this.departureDate,
    required this.returnDate,
    required this.price,
    required this.currency,
    required this.quota,
    required this.availableSeat,
    required this.isActive,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] as String,
      packageCode: json['packageCode'] as String,
      packageName: json['packageName'] as String,
      packageType: json['packageType'] as String,
      destinationCountry: json['destinationCountry'] as String,
      destinations: List<String>.from(json['destinations'] as List),
      duration: json['duration'] as int,
      departureDate: DateTime.parse(json['departureDate'] as String),
      returnDate: DateTime.parse(json['returnDate'] as String),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      quota: json['quota'] as int,
      availableSeat: json['availableSeat'] as int,
      isActive: json['isActive'] as bool,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdBy: json['createdBy'] as String,
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'packageCode': packageCode,
      'packageName': packageName,
      'packageType': packageType,
      'destinationCountry': destinationCountry,
      'destinations': destinations,
      'duration': duration,
      'departureDate': departureDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'price': price,
      'currency': currency,
      'quota': quota,
      'availableSeat': availableSeat,
      'isActive': isActive,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
    };
  }
}
