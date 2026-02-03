import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/helper/app_text_style.dart';
import 'package:ticket/core/utils/app_colors.dart';
import 'package:ticket/core/widgets/card_widgets.dart' show CustomCard;
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ticket App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Scaffold(
            backgroundColor: AppColors.brandPrimary,
            body: Center(
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const CustomCard(
                            icon: Icon(Icons.access_alarm),
                            title: 'Title',
                            subtitle: 'Subtitle',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
