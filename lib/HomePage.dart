import 'package:blinking_text/blinking_text.dart';
import 'package:earthquake_alarm/global/Button2.dart';
import 'package:earthquake_alarm/global/Column2.dart';
import 'package:earthquake_alarm/global/Text2.dart';
import 'package:earthquake_alarm/global/TextField2.dart';
import 'package:earthquake_alarm/style/style.dart';
import 'package:flutter/material.dart';

late Function reloadHomePage;

class HomePage extends StatefulWidget {
  final TextField2Elem ctrl;
  final String btnText;
  final Function btnFunc;
  final bool vib;
  //
  const HomePage({
    super.key,
    required this.ctrl,
    required this.btnText,
    required this.btnFunc,
    required this.vib,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double contentWidth;
  //

  @override
  Widget build(BuildContext context) {
    reloadHomePage = () {
      setState(() {});
    };

    //
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: bg0,
            image: DecorationImage(
              image: AssetImage("assets/imgs/bg.png"),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              contentWidth = constraints.maxWidth - sz4;

              return SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.all(sz4),
                      child: Column2(
                        spacing: sz2,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: sz6),
                            child: Column2(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: sz6,
                                children: [
                                  SizedBox(
                                    width: contentWidth * 0.7,
                                    height: contentWidth * 0.7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            contentWidth * 0.35),
                                        border: Border.all(
                                            color: accent0, width: sz2),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text2(
                                            text: widget.vib ? "3.56" : "0.00",
                                            fontSize: constraints.maxWidth / 6,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const Text2(
                                            text: "RICHTER",
                                            color: accent0,
                                            fontSize: sz3,
                                            fontWeight: FontWeight.w400,
                                            wrapper: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text2(
                                      text: "Boumerdes, DZ",
                                      fontSize: sz5,
                                      fontWeight: FontWeight.w400,
                                      wrapper: false,
                                    ),
                                  ),
                                ]),
                          ),
                          widget.vib
                              ? const Center(
                                  child: BlinkText(
                                    "Earthquake detected !!!",
                                    style: TextStyle(
                                      fontSize: sz6,
                                      fontWeight: FontWeight.w700,
                                      color: accent0,
                                    ),
                                    textAlign: TextAlign.center,
                                    duration: Duration(milliseconds: 900),
                                  ),
                                )
                              : const SizedBox(),
                          Column2(
                            spacing: sz2,
                            children: [
                              TextField2(elem: widget.ctrl),
                              SizedBox(
                                width: double.infinity,
                                child: Button2(
                                  invert: true,
                                  child: Text2(
                                    text: widget.btnText,
                                    fontSize: sz3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  func: () async {
                                    await widget.btnFunc();
                                  },
                                ),
                              ),
                              const Center(
                                child: Text2(
                                  text: "https://github.com/zaqks",
                                  fontSize: sz3 * 0.75,
                                  color: Colors.grey,
                                  wrapper: false,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            }),
          ),
        ),
      ),
    );
  }
}
