import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.grey.shade300),
      child: Wrap(
        children: [
          Card(
            elevation: 10,
            shadowColor: Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(255, 255, 255, 255),
            child: SizedBox(
                width: 300,
                height: 100,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Center(
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("assets/images/book.png"),
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Total Book",
                          ),
                          subtitle: Text("1,100",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]))),
          ),
          Card(
            elevation: 10,
            shadowColor: Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(255, 255, 255, 255),
            child: const SizedBox(
                width: 300,
                height: 100,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Center(
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("assets/images/user.png"),
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Total User",
                          ),
                          subtitle: Text("100",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]))),
          ),
          Card(
            elevation: 10,
            shadowColor: Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(255, 255, 255, 255),
            child: const SizedBox(
                width: 300,
                height: 100,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Center(
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("assets/images/bank.png"),
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Total Bank",
                          ),
                          subtitle: Text("25",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]))),
          ),
          Card(
            elevation: 10,
            shadowColor: Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(255, 255, 255, 255),
            child: const SizedBox(
                width: 300,
                height: 100,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Center(
                        child: ListTile(
                          leading: Image(
                            image: AssetImage("assets/images/income.png"),
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "Total Income",
                          ),
                          subtitle: Text("\$100,00",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ]))),
          )
        ],
      ),
    );
  }
}
