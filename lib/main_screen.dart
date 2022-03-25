import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int score = 0;
  int out = 0;
  int overs = 0;
  int balls = 0;

  /// to show increament in overs
  ballsIncreament() {
    if (balls < 6) {
      balls++;
    }
  }

  /// Showing balls details

  ballsDetail() {
    if (sixRun() != null) {
      print("SIX RunS");
    } else if (fourRun() != null) {
      ballsRun.add(4);
      print("Four Runs");
    } else {
      ballsRun.add(5);
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Mufties Cricket Counter"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: Get.height * 0.2,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Score : ",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        score.toString(),
                        style: const TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " -",
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        out.toString(),
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Overs : ",
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        overs.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        ".",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        balls.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width*0.95,
              height: Get.height * 0.07,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(color: Colors.black, width: 3)),
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          ballsRun.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(ballsRun[index].toString()),
                          ))),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            if(balls<6) {
                              ballsRun.add(0);
                              ballsIncreament();
                              setState(() {});
                            } },
                          child: scorechnager("DOT"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){  score++;
                          ballsRun.add(1);
                          ballsIncreament();

                          setState(() {});}

                          },
                          child: scorechnager("+ 1"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){  ballsRun.add(2);
                          score = score + 2;

                          ballsIncreament();
                          setState(() {});}

                          },
                          child: scorechnager("+ 2"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {if(balls<6){  score += 3;
                          ballsRun.add(3);

                          ballsIncreament();
                          setState(() {});}

                          },
                          child: scorechnager("+ 3"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){  ballsRun.add(4);
                          fourRun();}

                          },
                          child: scorechnager("Four"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){ ballsRun.add(5);
                          score = score + 5;
                          ballsIncreament();
                          setState(() {});}

                          },
                          child: scorechnager("+ 5"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {if(balls<6){ ballsRun.add(6);
                          sixRun();}

                          },
                          child: scorechnager("SIX"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){ ballsRun.add("NB");
                          score++;
                          setState(() {});}

                          },
                          child: scorechnager("No Ball"),
                        ),
                        InkWell(
                          onTap: () {if(balls<6){ ballsRun.add("W");
                          score++;
                          setState(() {});}

                          },
                          child: scorechnager("Wide"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (out < 10) {if(balls<6){ ballsRun.add("🥚");
                        out++;
                        ballsIncreament();}

                        }

                        setState(() {});
                      },
                      child: Container(
                        height: Get.height * 0.08,
                        width: Get.width * 0.95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red, width: 5)),
                        child: Center(
                            child: Text(
                          " O  U  T",
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        balls = 0;

                        ballsRun.clear();
                        overs++;
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.orange,
                        height: Get.height * 0.06,
                        width: Get.width * 0.9,
                        alignment: Alignment.center,
                        child: const Text(
                          "Next Over",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: Get.height * 0.07,
                    //   width: Get.width * 0.9,
                    //   decoration: BoxDecoration(
                    //       color: Colors.black,
                    //       border:
                    //           Border.all(color: Colors.lightGreen, width: 2)),
                    //   child: const Center(
                    //       child: Text(
                    //     " ABDULLAH    &   ANAS",
                    //     style:
                    //         TextStyle(color: Colors.lightGreen, fontSize: 25),
                    //   )),
                    // )
                  ],
                ),
                color: Colors.white)
          ],
        ),
      ),
    );
  }

  int sixRun() {
    score = score + 6;
    ballsIncreament();
    setState(() {});
    return 6;
  }

  int fourRun() {
    score = score + 4;
    ballsIncreament();
    setState(() {});
    return 4;
  }
}

scorechnager(String text) {
  return Container(
    child: Center(
        child: Text(
      text,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    )),
    width: Get.width * 0.3,
    height: Get.height * 0.07,
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 4)),
  );
}

List ballsRun = [];
