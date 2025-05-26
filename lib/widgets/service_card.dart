import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/music_service.dart';

class ServiceCard extends StatelessWidget {
  final MusicService service;
  final VoidCallback onTap;

  const ServiceCard({Key? key, required this.service, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      // height: 80, // Fixed height for consistent card sizes
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // Background image based on service
        image: DecorationImage(
          image: AssetImage(_getBackgroundImage()),
          fit: BoxFit.fitWidth,
          // colorFilter: ColorFilter.mode(
          //   Color(0xFF202126),
          //   BlendMode.difference,
          // ),
        ),
      ),
      child: Container(
        // Overlay container with semi-transparent background
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF202126).withOpacity(0.9),

          // Dark overlay to ensure text readability
        ),

        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Custom Icon Container
                Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Color(0xFF2F2F39),
                    borderRadius: BorderRadius.circular(10),

                    // Add a subtle shadow for depth
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 32, 32, 33),
                        blurRadius: 0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: CachedNetworkImage(
                    imageUrl: service.iconPath,
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                    placeholder:
                        (context, url) => Container(
                          width: 32,
                          height: 32,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                    errorWidget: (context, error, stackTrace) {
                      // Fallback icon if image fails to load
                      return Image.asset(
                        _getIconImageByOrder(),
                        // color: Colors.white,
                        fit: BoxFit.contain,
                        width: 32,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        service.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          // Add shadow for better readability over image
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  CupertinoIcons.arrowtriangle_right_fill,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to get background image based on service
  String _getBackgroundImage() {
    switch (service.title.toLowerCase()) {
      case 'music production':
        return "assets/images/first_image_background.png";
      case 'mixing & mastering':
        return "assets/images/second_background.png";
      case 'lyrics writing':
        return "assets/images/3rd_background.png";
      case 'vocals':
        return "assets/images/4th_background.png";
      default:
        return "assets/images/4th_background.png";
    }
  }

  // Alternative method
  String _getIconImageByOrder() {
    switch (service.order) {
      case 1:
        return "assets/icons/tune_vector1.png";
      case 2:
        return "assets/icons/vector_2.png";
      case 3:
        return "assets/icons/writing_vector_3.png";
      case 4:
        return "assets/icons/mic_vector4.png";
      default:
        return "assets/icons/mic_vector4.png";
    }
  }

  Color _getIconBackgroundColor() {
    // You can customize colors based on service title or iconPath
    switch (service.title.toLowerCase()) {
      case 'music production':
        return Colors.orange;
      case 'mixing & mastering':
        return Colors.green;
      case 'lyrics writing':
        return Colors.yellow;
      case 'vocals':
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }

  IconData _getFallbackIcon() {
    // Fallback icons if image fails to load
    switch (service.title.toLowerCase()) {
      case 'music production':
        return Icons.audiotrack;
      case 'mixing & mastering':
        return Icons.equalizer;
      case 'lyrics writing':
        return Icons.edit;
      case 'vocals':
        return Icons.mic;
      default:
        return Icons.music_note;
    }
  }
}
