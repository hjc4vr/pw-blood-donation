import 'package:flutter/material.dart';
class qnapage extends StatefulWidget {
  @override
  _qnapageState createState() => _qnapageState();
}

class _qnapageState extends State<qnapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context:context, delegate: search());
            },
          )
        ],
        title: Text("FAQ"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),

      body: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context,index){
            var question = questions[index];
            return Card(child:ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return buildpage(context,question);
                    },
                  ),
                );
              },
              title: Text("${question['question']}"),

            ));
          },
      )
    );
  }
  buildpage(BuildContext context, Map question){
    return Scaffold(
        appBar: AppBar(
          title: Text("Answer",
            style:TextStyle(color:Colors.black),),
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context);
            },
          ),

        ),
        body: ListView(
          children: <Widget>[
            new Text(
              '${question["question"]}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 10.0),
              child: new Divider(
                height: 1.0,
                color: Colors.black,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Text("2021/20/21"),
                )
              ],
            ),
            new Flexible(

              child: new Image.asset(
                "${question["img"]}",
                fit: BoxFit.cover,
              ),
            ),
            new Text(
              "${question['details']}",
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        )
    );
  }
}

class search extends SearchDelegate<String>{
  @override
  final Questions = ["Donating Blood is Painful!","If I donate blood I won't have enough","There are enough donors. So I don't need to donate","I will gain weight after donating blood","Blood donation Process","Eligibility to donate blood","Blood donation safety","Planning your donation schedule","others"];
  final recentquestions = ["Donating Blood is Painful!","If I donate blood I won't have enough","There are enough donors. So I don't need to donate","I will gain weight after donating blood","Blood donation Process","Eligibility to donate blood","Blood donation safety","Planning your donation schedule","others"];
  List<Widget> buildActions(BuildContext context) => [
     IconButton(
       icon: Icon(Icons.clear),
       onPressed: (){
         if (query.isEmpty){
            close(context,"");
         }else {
           query = '';
         }
       },
     )
  ];

  @override
  Widget buildLeading(BuildContext context) =>IconButton(
    onPressed: () => close(context,''),
    icon: Icon(Icons.arrow_back),
  );

  @override
  Widget buildResults(BuildContext context){
    int index = int.parse(query);
    Map question = questions[index];
    return Scaffold(
      appBar: AppBar(
        title: Text("${question["question"]}",
          style:TextStyle(color:Colors.black),),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),
      body: ListView(
        children: <Widget>[
          new Text(
            '${question["question"]}',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Divider(
              height: 1.0,
              color: Colors.black,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              new Padding(
                padding: new EdgeInsets.symmetric(horizontal: 10.0),
                child: new Text("2021/20/21"),
              )
            ],
          ),
          new Flexible(

            child: new Image.asset(
              "${question["img"]}",
              fit: BoxFit.cover,
            ),
          ),
          new Text(
         "${question['details']}",
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      )
  );}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty ? recentquestions : Questions.where((question){
      final questionlower = question.toLowerCase();
      final querylower = query.toLowerCase();
      return questionlower.startsWith(querylower);

    }).toList();
    return buildSuggestionsSuccess(suggestion);
  }
  buildSuggestionsSuccess(List<String> suggestions){
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context,index){
          final suggestion = suggestions[index];
          return ListTile(
            onTap: (){
              query = index.toString();
              showResults(context);
            },
            leading: Icon(Icons.info_outlined),
            title: Text("${suggestion}"),

          );
        }

    );
  }

}

List questions = [
{"question": "Donating Blood is Painful!",
  'img' : "images/question1.png",
  "details" : ""
}
,{"question":"If I donate blood I won't have enough",
    'img' : "images/question2.png",
    "details" : ""
  }
,{"question":"There are enough donors. So I don't need to donate",
    'img' : "images/question3.png",
    "details" : ""}
,{"question":"I will gain weight after donating blood",
    'img' : "images/question4.png",
    "details" : ""}
,{"question":"Blood donation Process",
    'img' : "images/question5.png",
    "details" : """How does the blood donation process work?
Before making an appointment to donate, it is important to be aware of some of the common reasons that could lead to a deferral or unsuccessful donation, and of how donating blood could affect your ability to carry out some activities later.

When Not To Donate
In general, if you’re currently undergoing treatment for a major illness or surgery, or (for women) if you’re pregnant or experiencing heavy menstrual flow, you’re advised to delay your blood donation for the time being.

For donors who have recently travelled overseas, there are also certain restrictions depending on the location you travelled to.

Visit the Health Sciences Authority’s website to learn more about the different factors that could affect your next donation date."""}
,{"question":"Eligibility to donate blood",
    'img' : "images/question6.png",
    "details" : """I'm 16 years old. I want to donate blood. Do I have to submit the consent form? Can I choose not to?
For individuals aged 16 or 17 who wish to donate blood, they are required to submit a signed parental consent form. This is a necessary first step for anyone aged 16 or 17 before they are allowed to register for blood donation."""}
,{"question":"Blood donation safety",
    'img' : "images/question7.png",
    "details" : """What tests are done to ensure my blood is safe for patients?
To ensure all patients receive the safest possible blood, the Health Sciences Authority (HSA) screens and processes all donated blood before it is transfused to patients.

Blood component processing
To optimise blood usage and to benefit more patients, every bag of donated blood is processed into different components:
Red Blood Cells: used to treat severe anaemia or during surgery, childbirth
Platelets: used for dengue fever, leukaemia and cancer patients
Fresh Frozen Plasma: used to help manage blood clots during bleeding or infection.
Infectious diseases testing
All donated blood is screened for infectious diseases, including HIV, hepatitis B, hepatitis C, and syphilis. Selected components or units may also be tested for malaria or bacterial contamination.

Blood group testing
This ensures that the donated blood is given to a patient with a compatible blood type.

Antibody screen
This is to ensure that there is no high level of abnormal antibodies in the donated blood that may be harmful to a patient following a transfusion.

Storage of blood products
All blood products must be stored under carefully monitored and controlled temperatures and conditions. This ensures that they are in an optimal state when transfused to patients."""}
,{"question":"Planning your donation schedule",
    'img' : "images/question8.png",
    "details" : """When can I donate blood?
Before making an appointment to donate, it is important to be aware of some of the common reasons that could lead to a deferral or unsuccessful donation, and of how donating blood could affect your ability to carry out some activities later.

When Not To Donate
In general, if you're currently undergoing treatment for a major illness or surgery, or (for women) if you're pregnant or experiencing heavy menstrual flow, you're advised to delay your blood donation for the time being.

For donors who have recently travelled overseas, there are also certain restrictions depending on the location you travelled to.

Visit the Health Sciences Authority's website to learn more about the different factors that could affect your next donation date."""}
  ,{"question":"Others",
    'img' : "images/question9.png",
    "details" : """What happens to my blood after donation?
Your blood is sent for screening and separated into three components - red blood cells, platelets, and fresh frozen plasma - before being placed in carefully monitored and controlled conditions to make sure it's in an optimal state when transfused. Red blood cells can be stored for up to 6 weeks, but most of the blood is usually transfused within 2 weeks."""}
];
