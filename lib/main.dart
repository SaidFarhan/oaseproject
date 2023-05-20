import 'package:flutter/material.dart';
import 'package:oaseproject/menu.dart';
import 'login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:oaseproject/utils/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://daecxsfrnmlbadzghttj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhZWN4c2Zybm1sYmFkemdodHRqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQzMzU2NTUsImV4cCI6MTk5OTkxMTY1NX0.Y9KhCLD75Mzin1uwvIER6QhER_8A7c-ixst8A791hbc',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  User? _user;

  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = client.auth.currentUser;
    });
    client.auth.onAuthStateChange.listen((event) {
      setState(() {
        _user = event.session?.user;
      });
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ? const LoginPage() : const Menu(),
    );
  }
}