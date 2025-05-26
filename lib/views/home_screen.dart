// lib/views/home_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_model/music_service_view_model.dart';
import '../widgets/service_card.dart';
import 'service_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MusicServiceViewModel>().loadServices();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18171C),
      body: Column(
        // spacing: 16,
        children: [
          // // Header
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Row(
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           // TODO: Implement drawer/menu functionality
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             const SnackBar(
          //               content: Text('Menu tapped'),
          //               duration: Duration(seconds: 1),
          //             ),
          //           );
          //         },
          //         icon: const Icon(Icons.menu, color: Colors.white),
          //       ),
          //       const Expanded(
          //         child: Text(
          //           'Assignment - Flutter',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 18,
          //             fontWeight: FontWeight.w600,
          //             letterSpacing: 0.5,
          //           ),
          //         ),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           // TODO: Implement more options functionality
          //           _showMoreOptions(context);
          //         },
          //         icon: const Icon(Icons.more_vert, color: Colors.white),
          //       ),
          //     ],
          //   ),
          // ),
          // Hero Section
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA90140), Color(0xFF550120)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFA90140),
                      blurRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 75.0,
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Search Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width - 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF2F2F39),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search "Punjabi Lyrics"',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF61616B),
                                ),
                                contentPadding: EdgeInsets.only(top: 15),
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xFFFFFFFF),
                                ),
                                suffixIcon: Container(
                                  width: 35,
                                  child: Row(
                                    children: [
                                      Divider(
                                        color: Color(0xFF45454F),
                                        thickness: 5,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.mic,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        onPressed: () {
                                          // TODO: Implement voice search
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Voice search not implemented yet',
                                              ),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onSubmitted: (value) {
                                if (value.isNotEmpty) {
                                  // TODO: Implement search functionality
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Searching for: $value'),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Color(0xFFEADDFF),
                            child: Icon(
                              CupertinoIcons.person,
                              size: 30,
                              color: Color(0xFF4F378A),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 36),

                      // Demo Section
                      Text(
                        'Claim your',
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Free Demo',
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'for custom Music Production',
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      ElevatedButton(
                        onPressed: () {
                          _showBookingDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 2,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // const Icon(Icons.calendar_today, size: 18),
                            // const SizedBox(width: 8),
                            Text(
                              'Book Now',
                              style: GoogleFonts.syne(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: -30,
                child: Image.asset(
                  "assets/images/circular_image.png",
                  width: 121,
                  height: 121,
                ),
              ),
              Positioned(
                bottom: 20,
                right: -40,
                child: Image.asset(
                  "assets/images/keyboard_image.png",
                  width: 135,
                  height: 135,
                ),
              ),
            ],
          ),

          // Services Section Header
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Hire hand-picked Pros for popular music services',
                    style: GoogleFonts.syne(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     // TODO: Navigate to all services screen
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('View all services'),
                //         duration: Duration(seconds: 1),
                //       ),
                //     );
                //   },
                //   child: const Text(
                //     'View All',
                //     style: TextStyle(color: Color(0xFFB91372)),
                //   ),
                // ),
              ],
            ),
          ),

          // Services List
          Expanded(
            child: Consumer<MusicServiceViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xFFB91372),
                          strokeWidth: 3,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Loading services...',
                          style: TextStyle(color: Colors.white54, fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }

                if (viewModel.error != null) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.red.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error: ${viewModel.error}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () => viewModel.loadServices(),
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB91372),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (viewModel.services.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.music_note_outlined,
                          size: 64,
                          color: Colors.white24,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No services available',
                          style: TextStyle(color: Colors.white54, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Check back later for updates',
                          style: TextStyle(color: Colors.white38, fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () => viewModel.loadServices(),
                          child: const Text(
                            'Refresh',
                            style: TextStyle(color: Color(0xFFB91372)),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  color: const Color(0xFFB91372),
                  onRefresh: () async {
                    await viewModel.loadServices();
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: viewModel.services.length,
                    itemBuilder: (context, index) {
                      final service = viewModel.services[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ServiceCard(
                          service: service,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ServiceDetailScreen(
                                      serviceName: service.title,
                                    ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2A2A2A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'More Options',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildOptionTile(Icons.settings, 'Settings', () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Settings tapped')),
                  );
                }),
                _buildOptionTile(Icons.help_outline, 'Help & Support', () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Help & Support tapped')),
                  );
                }),
                _buildOptionTile(Icons.info_outline, 'About', () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('About tapped')));
                }),
              ],
            ),
          ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              'Book Free Demo',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Would you like to book a free demo session for custom music production?',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Demo booking confirmed!'),
                      backgroundColor: Color(0xFFA90140),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA90140),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
    );
  }
}
