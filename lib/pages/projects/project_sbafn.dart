import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectSBAFN extends StatelessWidget {
  const ProjectSBAFN({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFAFAFA)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  TitleHeader(
                    projectImagePath:
                        'assets/images/project_sbafn/docu_banner.png',
                    projectTitle: 'Project SBAFN',
                    projectSubtitle:
                        'Explainable, street-level flood-risk mapping for Philippine cities.',
                    projectUrl: 'https://github.com/KubangPawis/project-sbafn',
                  ),

                  // ----- BUTTON LINKS -----
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ----- GITHUB -----
                      OutlinedButton(
                        onPressed: () => launchExternalUrl(
                          'https://github.com/KubangPawis/project-sbafn/',
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
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.github,
                              size: 18,
                              color: const Color(0xFF5F86E9),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'GitHub',
                              style: textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF5F86E9),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 24),

                      // ----- WEBSITE -----
                      OutlinedButton(
                        onPressed: () => launchExternalUrl(
                          'https://project-sbafn.vercel.app',
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 18,
                              color: const Color(0xFF5F86E9),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Visit Site',
                              style: textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF5F86E9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // ----- PROJECT OVERVIEW -----
                  SectionHeader(
                    title: 'Project Overview',
                    subtitle: 'What is it about.',
                  ),
                  SectionBody(
                    sectionText:
                        'Project SBAFN is an explainable, street-level flood-proneness visualization and decision-support app for Philippine cities. It visually communicates per-street, evidence-backed flood insights that planners can act on.',
                  ),
                  SectionBody(
                    sectionText:
                        'This project aims to supersede Project NOAH, the Philippines\' state-of-the-art initiative that provides area-based hazard overview, highlighting flood hazard zones at the national level. SBAFN offers the next step by covering the existing gaps of NOAH, by showing the street-level specifics of why floods happen, and give the explainability that was long needed for actual, effective decision making.',
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/images/project_sbafn/docu_map.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 64),

                  // ----- PROJECT FEATURES -----
                  SectionHeader(
                    title: 'Project Features',
                    subtitle: 'What does this project provide.',
                  ),

                  SectionBody(
                    sectionText: '''
• Street-Level Granularity - scores every road segment (green/yellow/red) instead of broad barangay/city polygons.
\n• Explainability - shows why a specific street scores that way. It includes insights about street-level physical flood proneness indicators, topography data, road data, all mapped to historical flood events as basis.
\n• Scenario + Prioritization - stress-test each street segment based on previous reported rainfall events (30/50/100 mm/hr rain).
\n• Actionable Insights - Upon full release of Project SBAFN, outputs can be used for LGU planning, work orders, and DRRM briefings.
                        ''',
                  ),

                  // ----- PROJECT METHODOLOGY DIAGRAM -----
                  SectionHeader(
                    title: 'Methodology Diagram',
                    subtitle: 'Behind the scenes.',
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/images/project_sbafn/methods_diagram.png',
                      ),
                    ),
                  ),

                  const SizedBox(height: 64),

                  // ----- DEVELOPMENT PROCESS SUMMARY -----
                  const SectionHeader(
                    title: 'Development Process Summary',
                    subtitle: 'How I built it.',
                  ),
                  const SizedBox(height: 24),

                  const SubsectionTitle('Methodology used'),
                  const BulletList(
                    items: [
                      'Problem framing & scoping – defined the goal as producing street-level, explainable flood-risk scores for each road segment in Philippine cities instead of coarse barangay-level polygons.',
                      'Data collection & preprocessing – ingested ~440k Mapillary street-view images plus open geospatial data (road networks, elevation/topography, historical flood reports) and joined them into a per-street-segment dataset.',
                      'Computer vision stage – trained a YOLOv11 model on Mapillary imagery to detect physical flood-proneness indicators such as drainage grates, curb inlets, vegetation strips, and infrastructure cues along streets.',
                      'Risk-scoring stage – built a Positive–Unlabeled LightGBM model to score flood risk per street segment using elevation, width, land context, and CV-detected infrastructure features, supervised by historical flood reports.',
                      'Explainability & UX – designed the scoring so each segment’s risk can be decomposed into contributing factors and surfaced as human-readable explanations in the map UI.',
                      'Iterative validation – ran sanity checks and rainfall scenarios to see whether model outputs align with known flood-prone streets and expert expectations, then refined features and thresholds.',
                    ],
                  ),

                  const SizedBox(height: 24),

                  const SubsectionTitle('Tools used during development'),
                  const BulletList(
                    items: [
                      'Core stack – Python for data pipelines and experimentation, with Jupyter Notebooks for exploratory analysis.',
                      'Computer vision & ML – YOLOv11 (Ultralytics) for object detection on Mapillary images, and LightGBM for the Positive–Unlabeled flood-risk model, with NumPy / Pandas / scikit-learn for preprocessing and metrics.',
                      'Geospatial & data – Mapillary API/exports for street-view imagery and OSM-based tools (e.g., OSMnx / GeoPandas) for road-network extraction and geospatial joins.',
                      'Application & delivery – a web frontend deployed on Vercel to present the interactive flood-risk map, with Git + GitHub for version control, collaboration, and issue tracking.',
                    ],
                  ),

                  const SizedBox(height: 24),

                  const SubsectionTitle('My role and contributions'),
                  const BulletList(
                    items: [
                      'Project lead & pipeline architect – led a 4-person team and designed the end-to-end architecture from data ingestion → CV model → PU LightGBM scoring → interactive map UI.',
                      'Computer vision & modeling engineer – implemented the YOLOv11 training pipeline on ~440k Mapillary images and designed/trained the Positive–Unlabeled LightGBM model, including feature selection and tuning.',
                      'Geospatial data engineer & product shaper – built the per-street-segment dataset by joining imagery-derived features with elevation, road geometry, and flood records, and defined the explainability scheme for each street.',
                      'Documentation & communication – authored technical documentation and project narrative, and prepared demos showing how LGUs can use SBAFN outputs for planning, work orders, and DRRM briefings.',
                    ],
                  ),

                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ),
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

class SectionBody extends StatelessWidget {
  const SectionBody({super.key, required this.sectionText});

  final String sectionText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(sectionText, style: textTheme.bodyLarge),
    );
  }
}

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    super.key,
    required this.projectImagePath,
    required this.projectTitle,
    required this.projectSubtitle,
    required this.projectUrl,
  });

  final String projectImagePath;
  final String projectTitle;
  final String projectSubtitle;
  final String projectUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          width: 800,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(projectImagePath, fit: BoxFit.cover),
          ),
        ),
        // const SizedBox(height: 32.0),
        // Text(projectTitle, style: textTheme.displayLarge),
        // const SizedBox(height: 16.0),
        // Text(projectSubtitle, style: textTheme.bodyLarge),
      ],
    );
  }
}

class SubsectionTitle extends StatelessWidget {
  const SubsectionTitle(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        label,
        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  '),
              Expanded(child: Text(item, style: textTheme.bodyLarge)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
