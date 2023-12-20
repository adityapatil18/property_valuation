import 'package:flutter/material.dart';

import '../custom_widgets/text_widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(1, 66, 75, 95).withOpacity(1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF38C0CE),
        centerTitle: true,
        title: TextWidget(
            text: 'About Us',
            textcolor: Colors.white,
            textsize: 20,
            textweight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextWidget(
                  text: 'WHO WE ARE',
                  textcolor: Colors.black,
                  textsize: 20,
                  textweight: FontWeight.w700),
              SizedBox(
                height: 30,
              ),
              Text(
                'M/s. Amol Bora & Co. was established in the year 1989 as Specialized Engineering Service Provider in the field of Insurance Survey and Loss Assessment in Fire, Engineering & Marine Departments. The organization further expanded into Valuation Services as Government Registered Valuers in Categories i.e. Land & Buildings and Plant & Machinery.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We also provide Chartered Engineer Certifications, Techno Economic Viability (TEV) Reports, Lenders Independent Engineer (LIE) Services, Due Diligence Services, Certification as Competent Person under Factory Act etc.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "The specialization in providing Engineering Services is backed with the experience and knowledge acquired over a period of more than 30 years.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Dr. Amol Indrakumar Bora is a Mechanical & Civil Engineering Degree holder. He is Fellow Member of the following Institutions –",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "1. Fellow Member of The Institution of Engineers (India), Kolkata",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "2. Fellow Member of Institution of Valuers, New Delhi",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "3. Fellow Member of Indian Institute of Surveyors & Loss Adjusters",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "4. Member of Institution of Mechanical Engineers (India), Mumbai",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "5.Member of Indian Institution of Industrial Engineering, Navi Mumbai",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                  "6.Member of The Association of Consulting Engineers (India), Delhi",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              Text("7.Member of Indian Society of Structural Engineers, Mumbai",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Dr. Bora has been awarded doctorate degree as in “Doctor of Philosophy (Entrepreneurship Honoris Causa)” at Colombo, Sri Lanka in June 2016, Reg. No. 062016345MA.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 20,
              ),
              Text(
                  "In 1989, Dr. Amol Bora started working as an independent Insurance Surveyor & Loss Assessor and Valuer in Ahmednagar. In 1997, started office in Pune and in the year 2003, in Mumbai.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Dr. Amol Bora was the Hon. Secretary of Institution of Engineers (India) of Ahmednagar Local Centre for the period 1993-95. Associated with the Institution of Valuer’s and was Chairman of Pune Unit in the year 2000-2004. Associated with the Institution of Engineers (I) Maharashtra State Centre, Mumbai & was Hon. Secretary of the Centre for the session 2002-2004. He was also the Chairman of Institution of Engineers (I) of Pune Local Centre for the period 2010-12. Organized, Indian Engineering Congress at Hotel Grand Hyatt, Mumbai in 2003 in which the speakers were Mr. Nandan Nilekani,Mr. Bharti Mittal, Ms. Leela Poonawala, Mr. K.V. Kamath, Mr. Sam Pitroda & the Congress was Inaugurated by Mr. S.M. Krishna (Then Governor of Maharashtra).",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}
