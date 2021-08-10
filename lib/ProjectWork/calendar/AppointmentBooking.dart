import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_stepper/stepper.dart';
import 'state.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pw/style.dart';
class appointment extends ConsumerWidget {
  @override
  String ?_dropdownvalue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context,watch) {
    var step = watch(currentstep).state;
    var place = watch(selectedplace).state;
    var datewatch = watch(selecteddate).state;
    var timewatch = watch(selectedtime).state;
    var type = watch(selecttype).state;
    var reminder = watch(selectremind).state;
    showsuccess(BuildContext context){
      return SizedBox(
        height : 500,
        width : 300,
        child: Image.asset("images/success.png"),
      );
    }
    showdetails(BuildContext context){
      return Container(
        child :ListView(
          children: [
            Text("Please confirm your appointment"),
            Text("You have selected ${place} donation center \nDate: ${datewatch} \nTime: ${timewatch}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    context.read(currentstep).state--;
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),

                  child: Text('Previous',style:TextStyle(color:Colors.black)),
                ),

                ElevatedButton(
                  onPressed: (){
                    context.read(currentstep).state++;
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  child: Text('Confirm',style:TextStyle(color:Colors.black)),
                ),
              ],
            )
          ],
        )
      );
    }
    Widget _dropdown(){
      return DropdownButton(
        hint: context.read(selecttype).state == ''
            ? Text('Choose Type of Donation')
            : Text(
          context.read(selecttype).state as String,
          style: TextStyle(color: Colors.blue),
        ),
        isExpanded: true,
        iconSize: 30.0,
        style: TextStyle(color: Colors.blue),
        items: ["Whole Blood","Plasmapheresis","Plateletpheresis"].map(
              (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          },
        ).toList(),
        onChanged: (val) {
          context.read(selecttype).state = val.toString();
        },
      );
    }
    Widget _dropdown1(){
      return DropdownButton(
        hint: context.read(selectremind).state == ''
            ? Text('Please select preferred mode of notification')
            : Text(
          context.read(selectremind).state as String,
          style: TextStyle(color: Colors.blue),
        ),
        isExpanded: true,
        iconSize: 30.0,
        style: TextStyle(color: Colors.blue),
        items: ['SMS',"E-mail"].map(
              (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          },
        ).toList(),
        onChanged: (val) {
          context.read(selectremind).state = val.toString();
        },
      );
    }
    showtrivial(BuildContext context){
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Declare your type of donation",
                    style:TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height:50),
                _dropdown(),
                SizedBox(height:50),
                Text("Declare the mode of notification",
                    style:TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height:50),
                _dropdown1(),

                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        context.read(currentstep).state--;
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.yellow),

                      child: Text('Previous',style:TextStyle(color:Colors.black)),
                    ),

                    ElevatedButton(
                      onPressed: (){
                        context.read(currentstep).state++;
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.yellow),
                      child: Text('Confirm',style:TextStyle(color:Colors.black)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

    }
    displaytimeslots(BuildContext context){
      var now = context.read(selecteddate).state;
      return Column(
        children : [
          Container(
            color: Colors.cyan,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  // child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text("${DateFormat.MMMM().format(now)}",style:TextStyle(fontSize: 15)),
                        Text("${now.day}",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                        Text("${DateFormat.EEEE().format(now)}",style:TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),

                ),
                GestureDetector(
                  onTap: (){
                    DatePicker.showDatePicker(context,
                        showTitleActions:true,
                        minTime: now,
                        maxTime: now.add(Duration(days:31)),
                        onConfirm: (date)=> context.read(selecteddate).state = date);
                  },
                  child:Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.calendar_today,color: Colors.white,),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: TimeSlots.length,
                itemBuilder: (context,index)=>GestureDetector(
                  onTap: (){
                    context.read(selectedtime).state= TimeSlots.elementAt(index);
                  },
                    child:Card(
                    color:  context.read(selectedtime).state == TimeSlots.elementAt(index) ? Colors.white54: Colors.white,
                  child: GridTile(
                    header: context.read(selectedtime).state == TimeSlots.elementAt(index) ?Icon(Icons.check) : null,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${TimeSlots.elementAt(index)}"),
                          Text("Available")
                        ],
                      ),
                    ),
                  ),

                ))),
          )
        ],
      );
    }
    return SafeArea(
        child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Appointment registration"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body:Column(

            children: [
              NumberStepper(
                activeStep: step-1,
                direction: Axis.horizontal,
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                numbers: [1,2,3,4,5],
                stepColor: Colors.black,
                activeStepBorderColor: Colors.red,
                numberStyle: TextStyle(color: Colors.white),
              ),
              Flexible(
                flex: 10,
                  child: step==1? ListView(

                children: <Widget>[
                  SizedBox(
                    child: Text("Select your donation center",style: TextStyle(fontSize: 20),),
                  ),

              SizedBox(child:InkWell(
                onTap: (){
                  context.read(selectedplace).state = "Health Science Authority";
                  context.read(currentstep).state++;

                },
                child: Image.asset('images/220px-Health_Sciences_Authority_2008.jpg',width:130,height:130),
              ),),
              SizedBox(child:Text("Health Science Authority"),),
              SizedBox(child:InkWell(
                onTap: (){
                  context.read(selectedplace).state = "Health Science Authority";
                  context.read(currentstep).state++;

                },
                child: Image.asset('images/genimage.jpg',width:130,height:130),
              ),),
              SizedBox(child:Text("Dhoby Xchange"),),
              SizedBox(
                child:InkWell(
                onTap: (){
                  context.read(selectedplace).state = "Dhoby Xchange";
                  context.read(currentstep).state++;
                },
                child: Image.asset('images/woodlands-civic-centre-singapore.jpg',width:130,height:130),
              ),),
              Text("Woodlands Civic Center"),
              SizedBox(child:InkWell(
                onTap: (){
                  context.read(selectedplace).state = "Woodlands Civic Center";
                  context.read(currentstep).state++;

                },
                child: Image.asset('images/Westgate-cls-up-view-L16-R-773x1030.jpg',width:130,height:130),
              ),),
              Text("Westgate Tower")
    ]):step==2 ? displaytimeslots(context):step==3 ?showtrivial(context): step==4? showdetails(context): showsuccess(context)),
              BottomAppBar(
                  child: (step==2)?Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            context.read(currentstep).state--;
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.yellow),

                          child: Text('Previous',style:TextStyle(color:Colors.black)),
                      ),

                      ElevatedButton(
                          onPressed: (){
                            context.read(currentstep).state++;
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.yellow),
                          child: Text('Confirm',style:TextStyle(color:Colors.black)),
                      ),
                    ],
                  ): step==5? ElevatedButton(onPressed: (){Navigator.pop(context);}, style: ElevatedButton.styleFrom(primary: Colors.red),child: Text('Homepage')):null,
              ),
              // Flexible(
              //     child: step==2 ? displaytimeslots(context):Container()),
            ],

          ),

    )
    );
  }

}
const TimeSlots = {
  "9:00-9.30",
  "9:30-10.00",
  "10:00-10.30",
  "10:30-11.00",
  "11:00-11.30",
  "11:30-12.00",
  "12:00-12.30",
  "12:30-13.00",
  "13:00-13.30",
  "13:30-14.00",
  "14:00-14.30",
  "14:30-15.00",
  "15:00-15.30",
  "15:30-16.00",
  "16:00-16.30",
  "16:30-17.00",
};