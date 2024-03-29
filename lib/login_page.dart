import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(top: 72),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg-img.png'),
              fit: BoxFit.cover,
              alignment: Alignment(-1.0, -1.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/rena-cafe-logo.png',
                  width: 92,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "RENA CAFE",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 36,
                ),
                SizedBox(
                  height: 36,
                  width: 350,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.black38),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 36,
                  width: 350,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'No Telepon',
                      hintStyle: const TextStyle(color: Colors.black38),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 36,
                  width: 350,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'No Telepon',
                      hintStyle: const TextStyle(color: Colors.black38),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Daftar'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          shape: const StadiumBorder(),
                          elevation: 0),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _navigateToNextScreen(context, const MainPage());
                      },
                      child: const Text('Log In'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          shape: const StadiumBorder(),
                          elevation: 0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

void _navigateToNextScreen(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
