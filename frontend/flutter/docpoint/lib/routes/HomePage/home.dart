import 'package:flutter/material.dart';
import '../base.dart';

class HospitalLandingPage extends StatelessWidget {
  const HospitalLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Home",
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
        children: [
              // Hero Section
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/family.jpg'),
              fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Center(
            child: Container(
                        padding: EdgeInsets.all(20),
                        constraints: BoxConstraints(
                          maxWidth: 600,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Best Multi Speciality Hospital in Tolichowki Hyderabad",
                                style: TextStyle(
                                  color: primaryColor, // Using primaryColor from base.dart
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Health, Our\nPassion",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Muslim General Hospital Tolichowki consists of a highly trained team of medical experts, "
                                "advanced facilities, and unwavering commitment to the welfare of our patients.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor, // Using primaryColor from base.dart
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                navigateToPage(context, 'appointment');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor, // Using primaryColor from base.dart
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 4,
                              ),
                              child: Text(
                                "Book An Appointment",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Why Choose Us Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Why Choose Us",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildWhyChooseItem(
                            Icons.medical_services,
                            "Advanced Medical Equipment",
                            "State-of-the-art facilities and cutting-edge technology for accurate diagnosis and treatment",
                          ),
                          SizedBox(height: 25),
                          _buildWhyChooseItem(
                            Icons.people,
                            "Expert Medical Team",
                            "Highly qualified and experienced doctors dedicated to providing the best care",
                          ),
                          SizedBox(height: 25),
                          _buildWhyChooseItem(
                            Icons.access_time,
                            "24/7 Emergency Care",
                            "Round-the-clock emergency services with immediate response and care",
                          ),
                          SizedBox(height: 25),
                          _buildWhyChooseItem(
                            Icons.health_and_safety,
                            "Patient-Centered Care",
                            "Personalized treatment plans and compassionate care for every patient",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Message from Director Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Message from Director",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/director.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr. Mohammed Ali",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Director, Muslim General Hospital",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Welcome to Muslim General Hospital, where we combine cutting-edge medical technology with compassionate care. Our commitment to excellence in healthcare has made us a trusted name in the community for over two decades. We strive to provide the highest quality medical services while maintaining the human touch that makes healthcare personal and effective.",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 16,
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.format_quote,
                                  color: primaryColor,
                                  size: 30,
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    "Our mission is to provide exceptional healthcare services with compassion, integrity, and excellence.",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Patient Experiences Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Patient Experiences",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "What our patients say about us",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 25,
                      childAspectRatio: 0.8,
                      children: [
                        _buildReviewCard(
                          "Ahmed Khan",
                          "The care I received was exceptional. The doctors were very attentive and the staff was extremely helpful.",
                          5,
                          "assets/patient1.jpg",
                        ),
                        _buildReviewCard(
                          "Fatima Begum",
                          "Clean facilities and professional staff. My treatment was successful and I'm very satisfied with the service.",
                          5,
                          "assets/patient2.jpg",
                        ),
                        _buildReviewCard(
                          "Mohammed Ali",
                          "The hospital has state-of-the-art equipment and the doctors are highly skilled. Highly recommended!",
                          4,
                          "assets/patient3.jpg",
                        ),
                        _buildReviewCard(
                          "Ayesha Siddiqui",
                          "Very impressed with the level of care and attention to detail. The staff made me feel comfortable throughout my stay.",
                          5,
                          "assets/patient4.jpg",
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Handle view all reviews
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        "View All Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Specialties Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Our Top Specialities",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Quality and Affordability Combined",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Specialty Cards Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 25,
                      childAspectRatio: 0.85,
                      children: [
                        _buildSpecialtyCard(
                          "Cardiology",
                          "Expert heart care and treatment",
                          Icons.favorite,
                        ),
                        _buildSpecialtyCard(
                          "Neurology",
                          "Advanced brain and nerve care",
                          Icons.psychology,
                        ),
                        _buildSpecialtyCard(
                          "Orthopedics",
                          "Bone and joint specialists",
                          Icons.medical_services,
                        ),
                        _buildSpecialtyCard(
                          "Pediatrics",
                          "Specialized care for children",
                          Icons.child_care,
                        ),
                        _buildSpecialtyCard(
                          "Dermatology",
                          "Skin care and treatment",
                          Icons.face,
                        ),
                        _buildSpecialtyCard(
                          "ENT",
                          "Ear, Nose & Throat specialists",
                          Icons.hearing,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Latest News Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Latest News & Updates",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Stay updated with our latest healthcare news and hospital updates",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          _buildNewsCard(
                            "New Advanced MRI Machine",
                            "We have installed a state-of-the-art MRI machine to enhance our diagnostic capabilities.",
                            "assets/news1.jpg",
                            "May 15, 2024",
                          ),
                          SizedBox(width: 20),
                          _buildNewsCard(
                            "Free Health Camp",
                            "Join our free health check-up camp this weekend. All are welcome!",
                            "assets/news2.jpg",
                            "May 10, 2024",
                          ),
                          SizedBox(width: 20),
                          _buildNewsCard(
                            "COVID-19 Vaccination Drive",
                            "Special vaccination drive for senior citizens and high-risk groups.",
                            "assets/news3.jpg",
                            "May 5, 2024",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Handle view all news
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        "View All News",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Who Are We Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Who Are We",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Muslim General Hospital is a premier healthcare institution in Tolichowki, Hyderabad, dedicated to providing exceptional medical care to our community. With over two decades of service, we have built a reputation for excellence in healthcare delivery.",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildFeatureItem(Icons.medical_services, "Advanced\nFacilities"),
                              SizedBox(width: 30),
                              _buildFeatureItem(Icons.people, "Expert\nTeam"),
                              SizedBox(width: 30),
                              _buildFeatureItem(Icons.access_time, "24/7\nService"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Enhanced Divider
              Container(
                height: 8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[200]!,
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
                  ),
                ),
              ),

              // Our Hospitals Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Our Hospitals",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Quality healthcare across multiple locations",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 400, // Fixed height for the scrollable area
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            SizedBox(width: 10), // Initial padding
                            _buildHospitalCard(
                              "Muslim General Hospital",
                              "Tolichowki, Hyderabad",
                              "assets/hospital1.jpg",
                              "24/7 Emergency, ICU, OPD",
                            ),
                            SizedBox(width: 20),
                            _buildHospitalCard(
                              "Muslim General Hospital",
                              "Mehdipatnam, Hyderabad",
                              "assets/hospital2.jpg",
                              "Specialty Clinics, Diagnostics",
                            ),
                            SizedBox(width: 20),
                            _buildHospitalCard(
                              "Muslim General Hospital",
                              "Banjara Hills, Hyderabad",
                              "assets/hospital3.jpg",
                              "Advanced Surgery, Maternity",
                            ),
                            SizedBox(width: 20),
                            _buildHospitalCard(
                              "Muslim General Hospital",
                              "Secunderabad",
                              "assets/hospital4.jpg",
                              "Multi-specialty, Rehabilitation",
                            ),
                            SizedBox(width: 10), // End padding
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Handle view all hospitals
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        "View All Locations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavItems: defaultBottomNavItems,
      onBottomNavTap: (index) {
        if (index == 1) {
          navigateToPage(context, 'appointment');
        } else if (index == 2) {
          navigateToPage(context, 'payment');
        } else {
          navigateToPage(context, 'home');
        }
      },
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: primaryColor,
            size: 32,
          ),
        ),
        SizedBox(height: 12),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialtyCard(String title, String description, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // Handle specialty tap
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: primaryColor,
                    size: 32,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhyChooseItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: primaryColor,
            size: 28,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(String title, String description, String imagePath, String date) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(String name, String review, int rating, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              review,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalCard(String name, String location, String imagePath, String features) {
    return Container(
      width: 300, // Fixed width for horizontal cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: primaryColor,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    features,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
