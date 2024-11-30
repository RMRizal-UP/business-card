import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const BusinessCard(),
    );
  }
}

class BusinessCard extends StatelessWidget {
  void launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'rizalreymarvin@gmail.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+639159343584',
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }

    void launchGithub() async {
    final Uri githubLaunchUri = Uri(
      scheme: 'https',
      path: "github.com/RMRizal-UP"
    );
    if (await canLaunchUrl(githubLaunchUri)) {
      await launchUrl(githubLaunchUri);
    }
  }
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Center(
        child: Card(
          elevation: 4,
          child: Container(
            width: screenWidth > 600 ? 600 :
            screenWidth * 0.9,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://scontent.fcgy2-1.fna.fbcdn.net/v/t39.30808-6/467762548_8964099946984297_8036390746785592958_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGgxXdR6RZ9y-p_kkHlO6grukyaSz43fie6TJpLPjd-J2ut-QEhkQXgA4B_I0lohPcf4vI8SobmO1SKizXF3AdV&_nc_ohc=FZjYSQ8YyTUQ7kNvgH9eH4m&_nc_zt=23&_nc_ht=scontent.fcgy2-1.fna&_nc_gid=AYMUN0juoq-vivNqQoPk0n9&oh=00_AYAzpro-MjBH3XA_EKtRlaa7QX43UOOIxMVRJqInRGb98A&oe=6750E095'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rey Marvin Rizal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Aspiring ML & AI Full-Stack Developer & Music Composer\n1BSCS @ UP Mindanao',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const Divider(height: 32, thickness: 1),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.yellow),
                  title: Text('rizalreymarvin@gmail.com'),
                  onTap: launchEmail,
                  hoverColor: Colors.yellow.withOpacity(0.1), 

                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.yellow),
                  title: Text('+63 915 934 3584'),
                  onTap: launchPhone,
                  hoverColor: Colors.yellow.withOpacity(0.1), 
                ),
                  ListTile(
                  leading: Icon(Icons.code, color: Colors.yellow),
                  title: Text('RMRizal-UP'),
                  onTap: launchGithub,
                  hoverColor: Colors.yellow.withOpacity(0.1), 
                ),                      
                const ListTile(
                  leading: Icon(Icons.location_on, color: Colors.yellow),
                  title: Text('Davao City, Philippines'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
