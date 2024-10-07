import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'crypto_coin_details.g.dart';


@JsonSerializable()
class CryptoCoinDetail extends Equatable{
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(name:
  'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,)
  final DateTime lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  String get formattedPriceInUSD => _formatPrice(priceInUSD);
  String get formattedHigh24Hour => _formatPrice(hight24Hour);
  String get formattedLow24Hour => _formatPrice(low24Hours);

  String _formatPrice(double price) {
        final decimalDigits = price < 1 ? 6 : 2;

    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '',
      decimalDigits: decimalDigits,
    ).format(price);
  }

  @override
  List<Object?> get props => [
    // priceInUSD,
    // imageUrl,
    // toSymbol,
    // lastUpdate,
    // hight24Hour,
    // low24Hours,
    formattedPriceInUSD,
    imageUrl,
    toSymbol,
    lastUpdate,
    formattedHigh24Hour,
    formattedLow24Hour,
  ];
}

