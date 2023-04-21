import 'package:flutter/material.dart';
import 'package:yupo_daktari/pages/login_page.dart';
import 'package:yupo_daktari/utils/specialist_item.dart';
import 'package:yupo_daktari/utils/doctor_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black54,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Maple Caramel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage("assets/images/pm.png"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16
                ),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 200, 228),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/surgeon.png",
                      width: 40,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "How do you feel?",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),

                        ),
                        const SizedBox(height: 2,),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            "Fill out your Medical right now",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12
                            ),
                          ),
                        ),
                        const SizedBox(height: 2,),
                        Container(
                          width: 120,
                          height: 20,
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 32,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(95, 179, 173, 173),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 16,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 6,),
                    Text(
                      "How can we help you?",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SpecialistItem(
                        imagePath: "assets/images/clean.png",
                        imageName: "Dentist"),
                    SizedBox(width: 4,),
                    SpecialistItem(
                        imagePath: "assets/images/knife.png",
                        imageName: "Surgeon"
                    ),
                    SizedBox(width: 4,),
                    SpecialistItem(
                        imagePath: "assets/images/lungs.png",
                        imageName: "Therapy"
                    ),
                    SizedBox(width: 4,),
                    SpecialistItem(
                        imagePath: "assets/images/hormones.png",
                        imageName: "Physiologist"
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Doctor list",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DoctorItem(
                        image: "assets/images/1.png",
                        name: "Nycta Gina",
                        specialist: "Pedetrician"),
                    DoctorItem(
                        image: "assets/images/3.png",
                        name: "Reisa Broto Asmoro",
                        specialist: "Surgeon"),
                    DoctorItem(
                        image: "assets/images/2.png",
                        name: "Indah Kusumaningrum",
                        specialist: "Odontologist"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );  }
}
