
import 'package:crypt/slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Crypto Wallet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    bool data=false;
    int myAmount=0;
    final urlImage='https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/1200px-Ethereum-icon-purple.svg.png';
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Vx.gray300,
        body:
        ZStack([

          VxBox()
              .blue800
              .size(context.screenWidth,context.percentHeight*35)
              .bgImage(DecorationImage(image: NetworkImage(urlImage)))
              .make(),
          VStack([
            (context.percentHeight*10).heightBox, " Ethereum Wallet".text.xl4.white.bold.center.makeCentered().py16(),
            (context.percentHeight*5).heightBox,


            VxBox(
                child: VStack([
                "Balance".text.gray700.xl2.semiBold.makeCentered(),
                 10.heightBox,
                 data ?"\$1".text.bold.xl6.makeCentered()
                 :CircularProgressIndicator().centered()
              ])
            )
                .p16
                .white
                .size(context.screenWidth,context.percentHeight*30)
                .rounded
                .shadowXl
                .make()
                .p16(),


            SliderWidget(
              min: 0,
              max: 100,
              finalVal:(value)
                {
                  myAmount=(value*100).round();
                  print(myAmount);
                },

            ).centered(),




            HStack([

              FlatButton.icon(
              onPressed: () {},
              color: Colors.blue,
              shape: Vx.roundedLg,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: "Refresh".text.white.make(),
          ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.green,
                shape: Vx.roundedLg,
                icon: Icon(
                  Icons.call_made_outlined,
                  color: Colors.white,
                ),
                label: "Deposit".text.white.make(),
              ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.red,
                shape: Vx.roundedLg,
                icon: Icon(

                  Icons.call_received_outlined,
                  color: Colors.white,
                ),
                label: "Withdraw".text.white.make(),
              ).h(50),

        ],   alignment:MainAxisAlignment.spaceAround,
             axisSize: MainAxisSize.max,
            ).p16(),

            FlatButton.icon(
              onPressed: () {},
              color: Colors.deepPurple,
              shape: Vx.roundedLg,
              icon: Icon(
                Icons.call_made_outlined,
                color: Colors.white,
              ),
              label: "Transfer".text.white.make(),
            )
                .h(50)
                .centered(),


      ])

      ]),



      );
    }
}
