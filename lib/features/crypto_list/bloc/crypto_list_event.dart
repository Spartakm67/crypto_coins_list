part of 'crypto_list_bloc.dart';

class CryptoListEvent {}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({
    required this.completer,
    });
  
  final Completer? completer;
}
