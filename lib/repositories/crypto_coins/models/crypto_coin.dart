import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.details,

    // required this.priceInUSD,
    // required this.imageUrl,
  });

  final String name;
  final CryptoCoinDetail details;
  // final String priceInUSD;
  // final String imageUrl;

  
  @override
  List<Object?> get props => [name, details];
  // List<Object?> get props => [name, priceInUSD, imageUrl];

  // get hight24Hour => null;
  //
  // get low24Hours => null;

}
