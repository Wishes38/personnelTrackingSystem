import 'package:flutter/material.dart';
import 'package:untitled/models/staff.dart';
import 'package:untitled/screens/staff_add.dart';
import 'package:untitled/screens/staff_edit.dart';

void main() {
  runApp(MaterialApp(
      /* Material = Android için uyumlu */
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String hood = "Personel Takip Sistemi";

  Staff selectedStaff=Staff.withId(0,"","","");

  List<Staff> staffs = [
    Staff.withId(1,"Serkan", "Özdemir", "E"),
    Staff.withId(2,"Taha", "Alper", "E"),
    Staff.withId(3,"Çağla", "Yüce", "K")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* home = kod yazacağımız blok, Scaffold = Menüler,İkonlar eklemek için kullanılır. */
      appBar: AppBar(
        /* AppBar = başlık yazdırılmasını sağlayan widget'tır. */
        title: Text(hood),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: staffs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // Hangi elemanın nereye yerleşeceğini yapar.
                    leading: Avatar(staffs[index].gender),
                    /*CircleAvatar(
                      backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/987/520/png-clipart-computer-icons-employee-icon-cdr-desktop-wallpaper-thumbnail.png"),
                    ),*/
                    title: Text(staffs[index].firstName +
                        " " +
                        staffs[index].lastName),
                    subtitle: Text("Cinsiyet : " +
                        staffs[index].gender),
                    trailing: buildStatusIcon(staffs[index].gender),
                    onTap: () {
                      setState(() {
                        selectedStaff = staffs[index];
                      });
                      print(selectedStaff.firstName);
                    },
                  );
                })),
        Text("Seçili Personel : " + selectedStaff.firstName + " " + selectedStaff.lastName),
        Row(
          children: <Widget>[

            /*Container(),
            Expanded (
              padding: EdgeInsets.all(8.0), // alt widgeti verilen değer kadar iter
              child: Container(),
            ),
            Container()*/

            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.green,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Icon(Icons.add),),
                      SizedBox(width: 5.0,),
                      Text("Yeni Personel"),


                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffAdd(staffs)));
                  },
                ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffEdit(selectedStaff)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Sil"),


                  ],
                ),
                onPressed: () {
                  setState(() {
                    staffs.remove(selectedStaff);
                  });
                  staffs.remove(selectedStaff);
                  var mesaj = "Silindi : " + selectedStaff.firstName;
                  mesajGoster(context, mesaj);
                },
              ),

            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(String gender) {
    if (gender == "E" || gender == "e" || gender=="Erkek" || gender=="erkek" || gender=="ERKEK") {
      return Icon(Icons.male);
    } else if (gender == "K" || gender == "k" || gender=="Kadın" || gender=="kadın" || gender=="KADIN") {
      return Icon(Icons.female);
    } else {
      return Icon(Icons.question_mark);
    }
  }

  Widget Avatar(String gender){
    if (gender == "E" || gender == "e" || gender=="Erkek" || gender=="erkek" || gender=="ERKEK") {
      return CircleAvatar(
        backgroundImage: NetworkImage("https://flyclipart.com/thumb2/avatar-business-businessman-male-man-silhouette-user-icon-19795.png"),
      );
    } else if (gender == "K" || gender == "k" || gender=="Kadın" || gender=="kadın" || gender=="KADIN") {
      return CircleAvatar(
        backgroundImage: NetworkImage("http://www.hagikader.com/dimg/yonetim/9222725012727-60-img_504781.png"),
      );
    } else {
      return CircleAvatar(
          backgroundImage: NetworkImage("https://www.freeiconspng.com/thumbs/question-icon/question-icon-5.jpg"),
      );
    };

  }
}