import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import '../../../pages/signup_pages/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawerLeft(),
      // appBar: AppBar(
      //   backgroundColor: AppColors.greenGray,
      //   leading: IconButton(
      //     icon: const Icon(Icons.add),
      //     // alignment: Alignment.topRight,
      //     onPressed: () {
      //       // Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Center(
          child: Column(
        children: [
          headerWidget2(),
          Container(
      padding: const EdgeInsets.only(
              top:30,
            ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child:new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Container(
              child: Padding(
            padding: const EdgeInsets.only(
              top:10,
              left:15,
              bottom: 5,
            ),
              child:  new Text(
            'Hướng dẫn sử dụng thiết bị',
            style: AppStyle.mediumblack,
          ),),
            ),
          Container(
            child: Padding(
            padding: const EdgeInsets.only(
              top:4,
              left:15,
              bottom: 10,
            ),
            child: new Text(
            'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện ...',
            style: AppStyle.light1,
          ),),
          ),
          Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top:5,
              left:15,
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenGray,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                    minimumSize: const Size(74, 35),
                  ),
                  child: Text("View",
                      style: AppStyle.mediumwhite16),
                ),
              ],
            ),
          ),
        ),
            ],
          ),
          ),
          Expanded(
            child: new Container(
            child: const SizedBox(height: 170, width:200),
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      ), color: AppColors.gray,
      ), 
      ),
            ),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.only(
              top:30,
            ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child:new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Container(
              child: Padding(
            padding: const EdgeInsets.only(
              top:10,
              left:15,
              bottom: 5,
            ),
              child:  new Text(
            'Hướng dẫn tư thế ngồi đúng',
            style: AppStyle.mediumblack,
          ),),
            ),
          Container(
            child: Padding(
            padding: const EdgeInsets.only(
              top:4,
              left:15,
              bottom: 10,
            ),
            child: new Text(
            'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện ...',
            style: AppStyle.light1,
          ),),
          ),
          Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top:5,
              left:15,
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenGray,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                    minimumSize: const Size(74, 35),
                  ),
                  child: Text("View",
                      style: AppStyle.mediumwhite16),
                ),
              ],
            ),
          ),
        ),
            ],
          ),
          ),
          Expanded(
            child: new Container(
            child: const SizedBox(height: 170, width:200),
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      ), color: AppColors.gray,
      ), 
      ),
            ),
        ],
      ),
    )
          ],        
      )),
    );
  }
}

Widget headerWidget2() {
  const url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
  return Container(
    alignment: Alignment.bottomLeft,
    padding: EdgeInsets.only(top: 0, left: 0),
    height: 267,
    width: 800,
    color: AppColors.greenGray,
    child: Column(
      children: [
        Container(
                padding: const EdgeInsets.only(left: 20,top:10, bottom:10),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Devices",
                  style: AppStyle.semibold,
                  textAlign: TextAlign.left,
                )),
        const SizedBox(height: 20),
        Container(
          child: const SizedBox(height: 160, width:345),
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: AppColors.white ),
            // width: 250,
            // child: Image.network(
            //     'https://images.pexels.com/photos/34088/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
            )
      ],
    ),
  );
  // );
}
