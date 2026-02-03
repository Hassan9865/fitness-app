import 'package:fitness_tracker/components/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AicoachView extends StatelessWidget {
  const AicoachView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColors.primary,
      appBar: AppBar(
        backgroundColor: appColors.primary,
        centerTitle: true,
        title: Text(
          "AI ChatBot",
          style: TextStyle(
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //get colors from hex
                        Colors.lightBlueAccent,
                        Color.fromARGB(255, 208, 209, 211),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0,
                            ),
                            child: (Text(
                              "Hi! You Can Ask Me",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 37,
                                fontWeight: FontWeight.bold,
                                color: appColors.onSecondary,
                              ),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: (Text(
                              "Anything",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 37,
                                fontWeight: FontWeight.bold,
                                color: appColors.onSecondary,
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 16.0,
                              bottom: 16.0,
                            ),
                            child: (TextButton(
                              onPressed: () {
                                GoRouter.of(context).push('/aichatview');
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  appColors.onSecondary,
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  Colors.black,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Colors.lightBlue,
                                      Color(0xFF7D96E6),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: Text(
                                    "Ask Now",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                          45,
                                      fontWeight: FontWeight.bold,
                                      color: appColors.onSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/icon.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, left: 16.0),
                child: Text(
                  "Welcome To Ai Chatbot",
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontSize: MediaQuery.of(context).size.height / 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 24),
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //get colors from hex
                        Colors.lightBlue,
                        Colors.blueGrey,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0,
                            ),
                            child: (Text(
                              "Talk freely about anything",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 37,
                                fontWeight: FontWeight.bold,
                                color: appColors.onSecondary,
                              ),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: (Text(
                              "You Like",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 37,
                                fontWeight: FontWeight.bold,
                                color: appColors.onSecondary,
                              ),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/chatot.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
