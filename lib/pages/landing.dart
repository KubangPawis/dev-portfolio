import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [LandingSection()],
            ),
          ),
        ),
      ),
    );
  }
}

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight * 0.7;

    return SizedBox(
      height: heroHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 64.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SlantedTag(label: 'Data Scientist'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Lance Alexander Ventura',
                    style: textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: 320,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFDFDFDF),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_pin, color: Colors.black),
                      const SizedBox(width: 8.0),
                      Text(
                        'Quezon Province, Philippines',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // PROFILE DESCRIPTION
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: IntroBlurb(),
                ),

                // RESUME BUTTON
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 16,
                    ),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Color(0xFF5F86E9),
                      width: 1.5,
                    ),
                    foregroundColor: const Color(0xFF5F86E9),
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: Text('View Resume'),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: CircleAvatar(
                  radius: 172,
                  backgroundImage: const AssetImage(
                    'assets/images/me_photo.jpg',
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github, size: 32),
                    onPressed: () {
                      launchExternalUrl('https://github.com/KubangPawis/');
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, size: 32),
                    onPressed: () {
                      launchExternalUrl(
                        'https://www.linkedin.com/in/vlancealexander',
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text('1060 total contributions', style: textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}

// ----- UTILITIES -----

Future<void> launchExternalUrl(String urlString) async {
  final uri = Uri.parse(urlString);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $urlString');
  }
}

class SlantedTag extends StatelessWidget {
  const SlantedTag({
    super.key,
    required this.label,
    this.color = const Color(0xFF5F86E9),
    this.textColor = Colors.white,
    this.horizontalPadding = 64,
    this.height = 64,
  });

  final String label;
  final Color color;
  final Color textColor;
  final double horizontalPadding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipPath(
        clipper: _SlantedTagClipper(),
        child: Container(
          color: color,
          padding: EdgeInsets.only(left: 12, right: horizontalPadding),
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _SlantedTagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cut = 30.0;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - cut, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class GridBackground extends StatelessWidget {
  const GridBackground({
    super.key,
    this.spacing = 80,
    this.lineWidth = 0.6,
    this.lineColor = const Color(0xFFD1D1D1),
  });

  final double spacing;
  final double lineWidth;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: _GridPainter(
            spacing: spacing,
            lineWidth: lineWidth,
            lineColor: lineColor,
          ),
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.spacing,
    required this.lineWidth,
    required this.lineColor,
  });

  final double spacing;
  final double lineWidth;
  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    // vertical lines
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // horizontal lines
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class IntroBlurb extends StatelessWidget {
  const IntroBlurb({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // vertical accent bar
          Container(
            width: 4,
            height: 80,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF5F86E9),
              borderRadius: BorderRadius.circular(999),
            ),
          ),

          // text
          Expanded(
            child: Text.rich(
              TextSpan(
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[700],
                  height: 2.1,
                ),
                children: [
                  const TextSpan(text: "Hi! I'm a "),
                  TextSpan(
                    text: 'BS Computer Science graduate',
                    style: TextStyle(
                      color: const Color(0xFF5F86E9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ' with expertise in building data solutions and end-to-end ML systems.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
