import 'package:flutter/material.dart';
import 'package:rena_cafe/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 92),
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
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/img/profile-pic.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Zanna Kirania',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '+62 812-3456-7892',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text(
                                'Change Username',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              leading: const Icon(Icons.person_rounded),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_right_rounded),
                                onPressed: () {},
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Change Mobile Phone',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              leading: const Icon(Icons.phone),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_right_rounded),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _popScreen(context, const LoginPage());
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: const BorderSide(color: Colors.red, width: 2),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 3),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _popScreen(BuildContext context, Widget widget) {
  Navigator.of(context).pop(MaterialPageRoute(builder: (context) => widget));
}
