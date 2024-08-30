import 'package:crypto_coins_list/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto Currencies List'),
  '/coin': (context) => const CryptoCoinScreen(),
};
