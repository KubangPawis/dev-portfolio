import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_icons/simple_icons.dart';

import 'projects/project_sbafn.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFAFAFA)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LandingSection(),
                TechStackSection(),
                ProjectsSection(),
              ],
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
                  onPressed: () => launchExternalUrl(
                    'https://drive.google.com/file/d/1olHYgjHiz4-InvH_l5N997FPhQH1Rt-e/view?usp=sharing',
                  ),
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

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});
  static const accent = Color(0xFF5F86E9);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
        children: [
          // TITLE BAR
          SectionHeader(title: 'Tech Stack', subtitle: 'What I use to build.'),
          const SizedBox(height: 32.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- LEFT COLUMN -----
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TechCategory(
                    title: 'Languages',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.python,
                        label: 'Python',
                        color: accent,
                      ),
                      TechChip(icon: SimpleIcons.r, label: 'R', color: accent),
                      TechChip(
                        icon: SimpleIcons.postgresql,
                        label: 'SQL',
                        color: accent,
                      ),
                    ],
                  ),
                  TechCategory(
                    title: 'Data Wrangling',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.pandas,
                        label: 'Pandas',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.numpy,
                        label: 'NumPy',
                        color: accent,
                      ),
                    ],
                  ),
                  TechCategory(
                    title: 'Data Visualization',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.plotly,
                        label: 'Matplotlib',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.plotly,
                        label: 'Seaborn',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.plotly,
                        label: 'Plotly',
                        color: accent,
                      ),
                    ],
                  ),
                ],
              ),

              // ----- RIGHT COLUMN -----
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TechCategory(
                    title: 'Machine Learning',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.scikitlearn,
                        label: 'Scikit-learn',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.tensorflow,
                        label: 'TensorFlow',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.pytorch,
                        label: 'PyTorch',
                        color: accent,
                      ),
                    ],
                  ),

                  TechCategory(
                    title: 'RAG',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.langchain,
                        label: 'LangChain',
                        color: accent,
                      ),
                      TechChip(
                        icon: SimpleIcons.langgraph,
                        label: 'LangGraph',
                        color: accent,
                      ),
                    ],
                  ),

                  TechCategory(
                    title: 'MLOps',
                    chips: [
                      TechChip(
                        icon: SimpleIcons.flask,
                        label: 'Flask',
                        color: accent,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        children: [
          SectionHeader(
            title: 'Featured Projects',
            subtitle: 'What I\'ve been working on',
          ),
          const SizedBox(height: 32.0),
          Wrap(
            spacing: 24,
            runSpacing: 32,
            children: [
              FeaturedProjectTile(
                imagePath: 'assets/images/project_sbafn/sbafn_code_card.png',
                title: 'Project SBAFN',
                description:
                    'Explainable, street-level flood-risk mapping for Philippine cities.',
                tags: const [
                  'python',
                  'pytorch',
                  'osmnx',
                  'mapillary',
                  'geospatial',
                ],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ProjectSBAFN()),
                  );
                },
              ),
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

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(title, style: textTheme.titleLarge),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(height: 3.0, color: const Color(0xFF5F86E9)),
          ),
        ),
        Text(
          subtitle,
          style: textTheme.bodyLarge?.copyWith(color: Color(0xFF929292)),
        ),
      ],
    );
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

class TechChip extends StatelessWidget {
  const TechChip({
    super.key,
    required this.icon,
    required this.label,
    this.color = const Color(0xFF5F86E9),
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color, width: 1.4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class TechCategory extends StatelessWidget {
  const TechCategory({super.key, required this.title, required this.chips});

  final String title;
  final List<Widget> chips;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(spacing: 16, runSpacing: 12, children: chips),
        ],
      ),
    );
  }
}

class ProjectImageCard extends StatelessWidget {
  const ProjectImageCard({
    super.key,
    required this.assetPath,
    this.onTap,
    this.aspectRatio = 16 / 9,
  });

  final String assetPath;
  final VoidCallback? onTap;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(assetPath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class FeaturedProjectTile extends StatefulWidget {
  const FeaturedProjectTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tags,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback? onTap;

  @override
  State<FeaturedProjectTile> createState() => _FeaturedProjectTileState();
}

class _FeaturedProjectTileState extends State<FeaturedProjectTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),

      // scale + shadow animation
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: widget.onTap,
              child: Container(
                width: 520,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                    color: const Color(0xFFE3E1E1),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- TOP: your PNG terminal card ---
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                      ),
                    ),

                    // --- BOTTOM: text + tags ---
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.description,
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: [
                              for (final tag in widget.tags) TagChip(tag),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xFF5F86E9);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.6), width: 1),
      ),
      child: Text(
        label,
        style: textTheme.bodyMedium?.copyWith(
          color: color.withOpacity(0.9),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
