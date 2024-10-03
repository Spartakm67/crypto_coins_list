import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String name;
  final String priceInUSD;
  final String imageUrl;
  
  @override
  List<Object?> get props => [name, priceInUSD, imageUrl];

  get hight24Hour => null;

  get low24Hours => null;

  // get details => null;
}
