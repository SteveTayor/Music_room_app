import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 0.5),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF18171C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              assetPath: "assets/icons/home_icon.png",
              fallbackIcon: Icons.home_outlined,
              isSelected: false,
            ),
            activeIcon: _buildNavIcon(
              assetPath: "assets/icons/home_icon.png",
              fallbackIcon: Icons.home,
              isSelected: true,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              assetPath: "assets/icons/news_icon.png",
              fallbackIcon: Icons.newspaper_outlined,
              isSelected: false,
            ),
            activeIcon: _buildNavIcon(
              assetPath: "assets/icons/news_icon.png",
              fallbackIcon: Icons.newspaper,
              isSelected: true,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              assetPath: "assets/icons/music_icon.png",
              fallbackIcon: Icons.album_outlined,
              isSelected: false,
            ),
            activeIcon: _buildNavIcon(
              assetPath: "assets/icons/music_icon.png",
              fallbackIcon: Icons.album,
              isSelected: true,
            ),
            label: 'TrackBox',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              assetPath: "assets/icons/workspace_icon.png",
              fallbackIcon: Icons.work_outline,
              isSelected: false,
            ),
            activeIcon: _buildNavIcon(
              assetPath: "assets/icons/workspace_icon.png",
              fallbackIcon: Icons.work,
              isSelected: true,
            ),
            label: 'Projects',
          ),
        ],
      ),
    );
  }
}

Widget _buildNavIcon({
  required String assetPath,
  required IconData fallbackIcon,
  required bool isSelected,
}) {
  return Container(
    width: 24,
    height: 24,
    child: Image.asset(
      assetPath,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
      color: isSelected ? Colors.white : Colors.grey,
      colorBlendMode: BlendMode.srcIn,
      errorBuilder: (context, error, stackTrace) {
        // Fallback icon if image fails to load
        return Icon(
          fallbackIcon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24,
        );
      },
    ),
  );
}
