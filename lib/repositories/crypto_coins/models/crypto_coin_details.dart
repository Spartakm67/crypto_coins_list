import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final dynamic name;
  final dynamic priceInUSD;
  final dynamic imageUrl;
  final dynamic toSymbol;
  final DateTime lastUpdate;
  final double hight24Hour;
  final double low24Hours;

  @override
  List<Object?> get props => [
        name,
        priceInUSD,
        imageUrl,
        toSymbol,
        lastUpdate,
        hight24Hour,
        low24Hours,
      ];
}

