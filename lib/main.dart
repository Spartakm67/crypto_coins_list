import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(248, 36, 35, 35),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 253, 199, 3)),
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 190, 124, 10),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            )),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) =>
            const CryptoListScreen(title: 'Crypto Currencies List'),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) =>
              Divider(color: theme.dividerColor),
          itemBuilder: (context, i) {
            const coinName = 'Bitcoin';
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/bitcoin_logo.svg',
                height: 30,
                width: 30,
              ),
              title: Text(
                coinName,
                style: theme.textTheme.bodyMedium,
              ),
              subtitle: Text(
                '59500\$',
                style: theme.textTheme.labelSmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/coin',
                  arguments: coinName,
                );
              },
            );
          }),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    assert(args != null && args is String, 'You must provide args');

    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
