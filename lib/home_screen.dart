import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/mode_theme.dart';
import 'package:timelines/timelines.dart';
import 'package:enhanced_url_launcher/enhanced_url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool themeMode;
  List experience = [
    {
      'title': 'Social Immersion Internship',
      'company': "Library and Learning Center, Atmiya University",
      'duration': 'Jan 2021 - Present',
    }
  ];
  List education = [
    {
      'title': 'B.Tech - Computer Engineering',
      'company': 'Atmiya University',
      'duration': '2021 - Present',
    },
    {
      'title': 'HSC - Computer Engineering',
      'company': 'Shree Swastik School of Science',
      'duration': '2019 - 2021',
    },
    {
      'title': 'SSC',
      'company': 'V.P. Ghetiya',
      'duration': '2018 - 2019',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        themeMode = themeNotifier.isDark;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bhavy Ukani'),
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_4),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _myContainer(context, _buildAboutSection(context)),
                _myContainer(context, _buildSAboutMeSection(context)),
                _myContainer(context, _buildSkillsSection(context)),
                _myContainer(context, _buildExperienceSection(context)),
                _myContainer(context, _buildEducationSection(context))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _myContainer(BuildContext context, Widget child) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: themeMode ? Colors.black26 : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26.withAlpha(20),
                  blurRadius: 5,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer)
            ],),
        child: child,
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Hero(
            tag: 'avtar',
            child: Image.asset(
              'assets/avtar/my_avtar.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const VerticalDivider(
          width: 15,
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Bhavy N. Ukani',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text(
              'Multiplatform App Developer',
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18,
                ),
                Text(
                  "  bhavycnt@gmail.com",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.language_outlined,
                  size: 18,
                ),
                Text(
                  "  https://coderbhavy.in",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 18,
                ),
                Text(
                  " +91 63555 77329",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSkillsSection(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Skills',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/icon/android.png',
                  width: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Android'),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icon/flutter.png',
                  width: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Flutter'),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icon/kotlin.png',
                  width: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Kotlin'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSAboutMeSection(BuildContext context) {
    return const Column(
      children: [
        Text(
          'About Me',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'I am a Flutter Developer ( Beginner ) developing cross-platform mobile applications.I am a quick learner and a team player. I am always ready to learn new things and implement them in my work.',
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Experience',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: Timeline.tileBuilder(
            physics: const NeverScrollableScrollPhysics(),
            theme: TimelineTheme.of(context).copyWith(
              nodePosition: 0,
              connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                    thickness: 1.0,
                  ),
              indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                    size: 10.0,
                    position: 0.5,
                  ),
            ),
            builder: TimelineTileBuilder(
              indicatorBuilder: (_, index) =>
                  true ? Indicator.outlined(borderWidth: 1.0) : null,
              startConnectorBuilder: (_, index) => Connector.transparent(),
              endConnectorBuilder: (_, index) => Connector.dashedLine(),
              contentsBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      "${experience[index]['title']} \n${experience[index]['company']} \n${experience[index]['duration']}"),
                );
              },
              itemCount: experience.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Education',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Timeline.tileBuilder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          theme: TimelineTheme.of(context).copyWith(
            nodePosition: 0,
            connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                  thickness: 1.0,
                ),
            indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                  size: 10.0,
                  position: 0.5,
                ),
          ),
          builder: TimelineTileBuilder(
            indicatorBuilder: (_, index) =>
                true ? Indicator.outlined(borderWidth: 1.0) : null,
            startConnectorBuilder: (_, index) => Connector.solidLine(),
            endConnectorBuilder: (_, index) => Connector.dashedLine(),
            contentsBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "${education[index]['title']} \n${education[index]['company']} \n${education[index]['duration']}"),
              );
            },
            itemCount: education.length,
          ),
        ),
      ],
    );
  }
}
