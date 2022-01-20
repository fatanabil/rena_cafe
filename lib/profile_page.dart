import 'package:flutter/material.dart';
import 'package:rena_cafe/login_page.dart';
import 'my_theme.dart';
import 'menu_page.dart';
import 'cart_page.dart';

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
        padding: EdgeInsets.only(top: 92),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-img.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-1.0, -1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
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
              SizedBox(
                height: 32,
              ),
              Text(
                'Zanna Kirania',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+62 812-3456-7892',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text(
                                  'Change Username',
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                                leading: Icon(Icons.person_rounded),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_right_rounded),
                                  onPressed: () {},
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Change Mobile Phone',
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                                leading: Icon(Icons.phone),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_right_rounded),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _popScreen(context, LoginPage());
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(color: Colors.red, width: 2),
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
