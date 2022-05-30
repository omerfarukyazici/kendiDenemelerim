import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'community_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("refikA"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(224, 230, 99, 99),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(224, 230, 99, 99),
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {},
          items: const [
            Icon(
              Icons.map,
              color: Colors.white,
            ),
            Icon(
              Icons.people,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ),

        //burası bu 4lü kısmın tasarımı
        body: Container(
          //buradan bu 4lü notların heposinin yüksekliğini ayarlarsın
          padding: EdgeInsets.only(top: 85),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              //burada tek tek değiştirisen renkeri
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommunityPage(),
                            ));
                      },
                      child: const Text("Community"),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () {},
                      child: const Text("Match"),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () {},
                      child: const Text("Map1"),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent)),
                      onPressed: () {},
                      child: const Text("Map2"),
                    ),
                  ))
            ],
          ),
        ));
  }
}
