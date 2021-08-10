
import 'package:flutter/material.dart';

import 'package:pw/ProjectWork/Infopage/widgets/stories_items.dart';
import 'package:pw/ProjectWork/Infopage/widgets/notification.dart';
import 'package:pw/ProjectWork/Infopage/widgets/slide_item.dart';
import 'trending.dart';
import 'package:pw/ProjectWork/Infopage/utils/qnapage.dart';
class Home extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.question_answer, color: Colors.black),
        label: Text(
            'FAQ',
            style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => qnapage()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            buildRestaurantRow('News', context),
            SizedBox(height: 20.0),
            buildNewsList(context),
            SizedBox(height: 10.0),
            buildNotificationRow('Notification', context),
            SizedBox(height:20.0),
            buildNotification(context),
            SizedBox(height: 20.0,),
            buildStoriesRow('Stories', context),
            SizedBox(height: 20.0),
            buildStoriesList(context),
            SizedBox(height: 20.0),
            // buildCategoryRow('Friends', context),
            // SizedBox(height: 10.0),
            // buildFriendsList(),
            // SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
  buildNotification(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height /3,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = Notifications[index];
          return Notification_item(
            cat: cat,
          );
        },
      ),
    );
  }
  buildNotificationRow(String title, BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$title",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$restaurant",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // TextButton(
        //   child: Icon(Icons.inbox),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) {
        //           return Trending();
        //         },
        //       ),
        //     );
        //   },
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 8.0),
          child: GestureDetector(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Icon(
                  Icons.mark_email_unread,
                  size: 36.0,
                ),
                // if (_cartList.length > 0)
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // if (_cartList.isNotEmpty) {
              //   print(Totalprice);
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Trending();
                          },
                        ),
                      );
              // }
            },
          ),
        )

      ],
    );
  }

  buildStoriesRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  buildStoriesList(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 0.01,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Stories == null ? 0 : Stories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = Stories[index];
          return StoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildNewsList(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.4,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: news.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map cat = news[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SlideItem(
                        cat
                      ),
                    );
                  },
                ));
  }

  // buildFriendsList() {
  //   return Container(
  //     height: 50.0,
  //     child: ListView.builder(
  //       primary: false,
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       itemCount: friends == null ? 0 : friends.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         String img = friends[index];
  //
  //         return Padding(
  //           padding: const EdgeInsets.only(right: 5.0),
  //           child: CircleAvatar(
  //             backgroundImage: AssetImage(
  //               img,
  //             ),
  //             radius: 25.0,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
List Notifications =[
{
  'image': "images/220px-Health_Sciences_Authority_2008.jpg",
  'Title' : "Upcoming Appointment",
  'details' : "You have an upcoming blood donation appointment.",
  'date' : "2 October 2021 4.30pm",
  "place" : """Health Sciences Authority
    (Opposite Outram Park MRT Station)
  11 Outram Road
  Singapore 169078"""
},
  {
    'image': "images/woodlands-civic-centre-singapore.jpg",
    'Title' : "Upcoming Appointment",
    'details' : "You have an upcoming blood donation appointment.",
    'date' : "20 December 2021 5.30pm",
    "place" : """Woodlands Civic Centre
(Opposite Causeway Point)
900 South Woodlands Drive
#05-07 Singapore 730900"""
  }
];

List Stories = [
  {
    'route' : '/1',
    "image" : 'images/story1.png',
    "Title" : 'Family thanks eight strangers who saved their young son’s life',
    "details": "Thank you for saving our boy. Devra Schwartz, and her husband, Jeff, recently had a chance to express their gratitude to eight of the 100 strangers whose blood donations provided a lifeline for their son, Judah, now 4. The Santa Monica youngster nearly died last year when his kidneys failed due to foodborne E. coli infection.",
  },
  {
    'route' : '/2',
    "image" : 'images/story2.png',
    "Title" : 'Father of two thanks blood donors who saved his life',
    "details": """Tyler Bacon met some of the people who donated blood and platelets while he was being treated for cancer at UCLA
  As Tyler Bacon gripped the lectern in Carnesale Commons and scanned the crowd gazing at him expectantly, he struggled to hold back tears.
  The 39-year-old father of two from Thousand Oaks was finally meeting some of the more than two dozen people whose blood and platelet donations sustained his life during cancer treatment at Ronald Reagan UCLA Medical Center.""",
  },
  {
    'route' : '/3',
    "image" : 'images/story3.png',
    "Title" : 'Brave toddler meets 24 strangers who saved her life',
    "details": """Blood and platelet donations sustained 2-year-old as she fought two rare cancers at UCLA Mattel Children’s Hospital
It took a team of UCLA medical professionals and the generosity of 71 strangers to save 2-year-old Skye Savren-McCormick’s life.
The toddler from Ventura, California, required frequent blood and platelet transfusions, often on a daily basis, while undergoing three grueling bone-marrow transplants, surgery to remove her swollen spleen and seven rounds of chemotherapy for leukemia and lymphoma. She received 77 units of blood and platelets during a 10-month stay at UCLA Mattel Children’s Hospital. """,
  },
  {
    'route' : '/4',
    "image" : 'images/story4.png',
    "Title" : 'Jorge’s story',
    "details": """Jorge Sincuir, a frequent donor at the UCLA Blood & Platelet Center, who found himself in need of multiple blood transfusions following a near-fatal car accident. 
As UCLA undergraduates, brothers Jorge and Andrew Sincuir donated blood and platelets often. In fact, after Andrew learned that a patient responded well to his platelets, he began donating every two weeks, racking up 67 donations over four years.  """,
  },
];

List news = [
  {
    "img" : 'images/new1.png',
    'title': 'Singapore Red Cross introduces refreshed Blood Buddy ‘BB’',
    'route': '/5',
  },
  {
    "img" : 'images/new2.png',
    'title': 'Community Blood Drives',
    'route': '/6',
  },
  {
    "img" : 'images/news3.png',
    'title': 'BLOOD DONATION COVID-19 UPDATES',
    'route': '/7',
  },

];