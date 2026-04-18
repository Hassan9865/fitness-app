import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TchatsView extends StatelessWidget {
  const TchatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      appBar: AppBar(
        backgroundColor: appColors.primary,
        title: Text(
          'Trainers Chats',
          style: TextStyle(color: appColors.onSecondary),
        ),
      ),
      body: Column(
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
                        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                        child: (Text(
                          "Hi! You Can Ask Me",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 37,
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
                            fontSize: MediaQuery.of(context).size.height / 37,
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
                                colors: [Colors.lightBlue, Color(0xFF7D96E6)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: Text(
                                "Ask Now",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
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
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search friends...',
                hintStyle: TextStyle(color: appColors.onSecondary),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: appColors.onSecondary,
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide(color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: appColors.primary,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/pic3.jpg"),
                    ),
                    title: Text(
                      "doe_jane",
                      style: TextStyle(color: appColors.onSecondary),
                    ),
                    subtitle: Text(
                      "How are you ?",
                      style: TextStyle(color: appColors.onSecondary),
                    ),
                    trailing: Text(
                      "9:00 am",
                      style: TextStyle(color: appColors.onSecondary),
                    ),
                    onTap: () {
                      GoRouter.of(context).push('/tchattingview');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
