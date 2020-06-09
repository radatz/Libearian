import 'package:flutter/material.dart';
// TO DO LIST
/* Setup Routing, Back Button, Add Book Images, Import Data, Double check sizings, Button functionality  */



class BookDescription extends StatelessWidget {














    Widget cover() {
      return new Container( // Place book image object in container
        height: 350,
        color: Colors.black,

      );
    }

    Widget title() {
      return new Text('The Heart Of Hell', style: new TextStyle(fontSize: 24.0,
          fontWeight: FontWeight.bold),); // Requires a Font Style
    }

    Widget author() {
      return new Text('J.R.R Tolkien',
        style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),);
    }

    Widget description() {
      return new Text(
        'I have a story to tell and it is a great story if you listen to my story i think you will like it very much, please friend why dont you sit down and listen to my story if you give me this oppertunity to speak to you i promise you i will not disappoint you at this point i am talking a lot but do not stress'
        , style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
        textAlign: TextAlign.left,);
    }


    @override
    Widget build(BuildContext context) {
      return new Scaffold(

        // Sets background color of app
        backgroundColor: Color.fromRGBO(246, 245, 240, 1),


        body: SingleChildScrollView( // Allows you to scroll through the app

          child: new Container(

            padding: new EdgeInsets.fromLTRB(0, 23, 0, 0),
            // Change Edge padding for all children


            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  /*PreferredSize(
                  preferredSize: Size.fromHeight(10.0), < ==== Return Button In Progress Might require a stack
                  child: AppBar(
                    leading: new IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                        onPressed: null),
                  ),
                ),*/

                  Container(child: cover()),
                  //<==================Cover Picture Function
                  Container(
                      padding: new EdgeInsets.fromLTRB(20, 20, 20, 40),
                      child: Column(
                        children: <Widget>[
                          title(), //<===========================Title Function
                          new SizedBox(height: 5.0),
                          author() // <==========================Author Function
                        ],
                      )
                  ),
                  Container(
                    alignment: Alignment(-1.0, 0.0),
                    padding: new EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: new Text('Description: \n', style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w400),),
                  ),
                  Container(
                      alignment: Alignment(-1.0, 0.0),
                      padding: new EdgeInsets.fromLTRB(15, 0, 15, 25),
                      child: Row(
                        children: <Widget>[

                          Flexible( // This allows the text in the widget to wrap around


                            child: description(),)
                          //  <===============Description Function
                        ],
                      )
                  ),
                  Container(
                      padding: new EdgeInsets.all(30),
                      child: Row(
                        children: <Widget>[
                          new ButtonTheme(
                            height: 50.0,
                            minWidth: 170.0,
                            buttonColor: Colors.black,

                            child: new RaisedButton(
                              onPressed: null,
                              child: new Text('Favorite',
                                  style: new TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(181, 154, 87, 1),)),
                            ),
                          ),
                          new SizedBox(width: 10.0,),
                          // Space Inbetween Widgets, this avoids wrapping each one in a container.

                          new ButtonTheme(
                              height: 50.0,
                              minWidth: 170.0,
                              buttonColor: Color.fromRGBO(181, 154, 87, 1),

                              child: new RaisedButton(
                                  onPressed: null,
                                  child: new Text('Rent',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0,
                                        color: Colors.white,)
                                  )
                              )
                          ),
                        ],
                      )
                  ),

                ]

            ),
          ),
        ),

      );
    }
  }
