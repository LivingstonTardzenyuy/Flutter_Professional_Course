
import 'package:flutter/material.dart';
import 'package:mountain_apps/widgets/app_large_text.dart';

import '../appResources/appcolors.dart';
import '../appResources/strings.dart';
import '../widgets/app_text.dart';
import '../widgets/explore_more.dart';
import '../widgets/tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20),
              child: Row(
                children: <Widget>[
                  Icon(Icons.menu, size:30, color:Colors.black54),

                  Expanded(child: Container()),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)
                    ),
                  )
                ],
              )
          ),

          SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(size: 25, text: 'Discover', colour: Colors.black54, isBold: true),
          ),

          SizedBox(height: 25,),
          //tabBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(

                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(colour: AppColors.mainColor, radius: 5),

                tabs: [
                  Tab(text: AppStrings.places),
                  Tab(text: AppStrings.inspiration),
                  Tab(text: AppStrings.emotions),

                ]
              ),
            )
          ),

          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('images/mountains/mount1.jpg'),
                            fit: BoxFit.cover,
                          )
                      ),
                    );
                  },

                ),
                Text('There'),
                Text('Bye'),

              ],
            )
          ),

          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                  child: AppLargeText(size: 20, text:"Explore More", colour: Colors.black, isBold: true)),

              Expanded(child: Container()),

              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Text('See all', style: TextStyle(color: Colors.grey, fontSize: 18),),
              ),
            ],
          ),


          SizedBox(height: 10,),
          Container(
            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('images/mountains/mount3.jpg'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),

                    Container(
                      child: AppText(label: "Kayaking", colour: AppColors.textColor2,)
                    )
                  ],
                ),
              );
            },)
          )


            ],
          )

    );
  }
}



class CircleTabIndicator extends Decoration{


  CircleTabIndicator({required this.colour, required this.radius});
  late Color colour;
  late double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(colour: colour, radius: radius);
  }


}

class _CirclePainter extends BoxPainter{


  _CirclePainter({required this.colour, required this.radius});
  late Color colour;
  late double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint _paint = Paint();
    _paint.color = colour;
    _paint.isAntiAlias= true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}

