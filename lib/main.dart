import 'package:flutter/material.dart';

const Color deepOlive = Color(0xFF3F4A36);
const Color softSage = Color(0xFFA8B5A2);
const Color lightSage = Color(0xFFDDE5D8);
const Color warmCream = Color(0xFFF7F5EF);
const Color darkOliveText = Color(0xFF293026);

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: deepOlive,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: warmCream,
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool showAcademicInfo = false;

  // PERSONAL INFORMATION
  final String fullName = "Angel B. Baniago";
  final String nickname = "Gel";
  final String age = "20 years old";
  final String birthday = "March 09, 2006";
  final String address = "Cabuyao, Laguna, Philippines";
  final String hobby = "Watching movies and series";
  final String motto = "I came, I saw, I conquered";
  final String course = "Bachelor of Science in Information Technology";
  final String yearLevel = "3rd Year";
  final String section = "3IT-A";

  // ACADEMIC INFORMATION
  final String favoriteSubject = "Mobile Application Development";
  final String programmingLanguage = "Dart";
  final String technicalSkill = "UI/UX Design";
  final String careerGoal = "Software Developer";
  final String academicInterest = "UI/UX Design and Mobile App Development";

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        title: const Text(
          "Student Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: deepOlive,
        foregroundColor: lightSage,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showMessage("Welcome to my Student Profile!");
            },
          ),
        ],
      ),

      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 35),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [deepOlive, softSage],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage("assets/profile.jpg"),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    fullName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    nickname,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      course,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // PERSONAL AND SCHOOL INFORMATION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 600;

                  final personalCard = Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle(Icons.person, "Personal Information"),
                          const Divider(height: 25, color: lightSage),
                          profileItem(
                            Icons.cake_outlined,
                            "Birthday",
                            birthday,
                          ),
                          profileItem(
                            Icons.calendar_today_outlined,
                            "Age",
                            age,
                          ),
                          profileItem(
                            Icons.location_on_outlined,
                            "Address",
                            address,
                          ),
                          profileItem(
                            Icons.sports_esports_outlined,
                            "Hobby",
                            hobby,
                          ),
                          profileItem(Icons.format_quote, "Motto", motto),
                        ],
                      ),
                    ),
                  );

                  final schoolCard = Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle(
                            Icons.school_outlined,
                            "School Information",
                          ),
                          const Divider(height: 25, color: lightSage),
                          profileItem(
                            Icons.menu_book_outlined,
                            "Program",
                            course,
                          ),
                          profileItem(
                            Icons.stairs_outlined,
                            "Year Level",
                            yearLevel,
                          ),
                          profileItem(
                            Icons.groups_outlined,
                            "Section",
                            section,
                          ),
                        ],
                      ),
                    ),
                  );

                  if (isMobile) {
                    return Column(
                      children: [
                        personalCard,
                        const SizedBox(height: 16),
                        schoolCard,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: personalCard),
                      const SizedBox(width: 12),
                      Expanded(child: schoolCard),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // ACADEMIC INFORMATION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle(
                        Icons.auto_stories_outlined,
                        "Academic Information",
                      ),
                      const Divider(height: 25, color: lightSage),
                      if (showAcademicInfo) ...[
                        profileItem(
                          Icons.favorite_outline,
                          "Favorite Subject",
                          favoriteSubject,
                        ),
                        profileItem(
                          Icons.code,
                          "Programming Language",
                          programmingLanguage,
                        ),
                        profileItem(
                          Icons.computer_outlined,
                          "Technical Skill",
                          technicalSkill,
                        ),
                        profileItem(
                          Icons.work_outline,
                          "Career Goal",
                          careerGoal,
                        ),
                        profileItem(
                          Icons.lightbulb_outline,
                          "Academic Interest",
                          academicInterest,
                        ),
                      ] else
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Academic information is hidden. "
                            "Tap the button below to view it.",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              showAcademicInfo = !showAcademicInfo;
                            });
                          },
                          icon: Icon(
                            showAcademicInfo
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          label: Text(
                            showAcademicInfo
                                ? "Hide Academic Information"
                                : "Show Academic Information",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // PROFILE IMAGE / VISUAL SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/technologybg.jpg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.photo_camera_outlined,
                            color: deepOlive,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Exploring my interests through creativity and technology.",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
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

            const SizedBox(height: 20),

            // INTERACTIVE BUTTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 600;

                  final contactButton = ElevatedButton.icon(
                    onPressed: () {
                      showMessage(
                        "You can reach me through my email: "
                        "angelbaniago@gmail.com",
                      );
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const Text("Contact Me"),
                  );

                  final goalButton = TextButton.icon(
                    onPressed: () {
                      showMessage(
                        "My goal is to become a successful Software Developer!",
                      );
                    },
                    icon: const Icon(Icons.flag_outlined),
                    label: const Text("My Goal"),
                  );

                  if (isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        contactButton,
                        const SizedBox(height: 8),
                        goalButton,
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(child: contactButton),
                      const SizedBox(width: 10),
                      Expanded(child: goalButton),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // FOOTER
            Text(
              "© 2026 $fullName",
              style: TextStyle(color: deepOlive, fontSize: 13),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // REUSABLE SECTION TITLE
  Widget sectionTitle(IconData icon, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: softSage.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: deepOlive),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: deepOlive,
            ),
          ),
        ),
      ],
    );
  }

  // REUSABLE PROFILE ITEM
  Widget profileItem(IconData icon, String title, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: softSage.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: deepOlive, size: 21),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          value,
          style: const TextStyle(
            color: darkOliveText,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
