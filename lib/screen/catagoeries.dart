import 'package:demo/models/c_model.dart';
import 'package:demo/screen/home_screen.dart';
import 'package:demo/services/c_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  
  var _employeeNameController = TextEditingController();
  var _employeeEmailController = TextEditingController();
  var _employeePhoneController = TextEditingController();
  var _employeeCompanyController = TextEditingController();

  var _category =Catagory();
  var _categoryService = CategoryService();

  _showFormDialog(BuildContext){
    return showDialog(context: context,barrierDismissible: true, builder: (param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
                  color: Colors.blue,
                  onPressed: ()async {
                    _category.name = _employeeNameController.text;
                    _category.email = _employeeEmailController.text;
                    _category.number = _employeePhoneController.text;
                    _category.company = _employeeCompanyController.text;
                    var result =await _categoryService.saveCategory(_category);
                    print(result);
                  },
                   child: Text('Save')),
           FlatButton(
                  color: Colors.blue,
                  onPressed: ()=>Navigator.pop(context),
                  child: Text('Cancel'))
        ],
        title:Text('Employee Form'),
        content: SingleChildScrollView(child: Column(
          children: [
             Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _employeeNameController,
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Name";
                  }if(msg.length<3){
                    return "Name is Less than 3 character";
                  }
        //           if (!RegExp(
        //         r"(/^[A-Za-z]+$/)")
        //     .hasMatch(msg)) {
        //   return 'Name Should be characeter';
        // }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                controller: _employeeEmailController,
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Email";
                  }if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(msg)) {
          return 'Please enter a valid email Address';
        }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                ),
                ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _employeePhoneController,
                  validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Number";
                  }if(msg.length!=10){
                    return "Please Enter 10 digit Number";
                  }if (!RegExp(
                r"(^[0-9]{10}$)")
            .hasMatch(msg)) {
          return 'Phone Number Should be Number';
        }
                  return null;
                },
                  keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Mobile Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _employeeCompanyController,
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Company Name";
                  }if(msg.length<3){
                    return "Name is Less than 3 character";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Company Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
             
                ),
                // ignore: deprecated_member_use
            //  FlatButton(
            //     child: Text("Show Time Picker"),
            //     color: Colors.blue,
            //     textColor: Colors.white, 
            //     onPressed: (){
            //       selectTimePicker(context);
            //     },
            //   ),
            //   Text(date.toString())  
          ],
        ),),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: RaisedButton(onPressed: ()=>Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=>HomeScreen())),
                    elevation: 0.0, 
                    child: Icon(Icons.arrow_back,color: Colors.white,),
                    color: Colors.blue,
                    ),
          title: Text('Catagegories'),
        ),
        body: Center(
          child: Text('Welcome'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
                              _showFormDialog(context);
                             },
                              child: Icon(Icons.add),
                              ),
    );
  }
}