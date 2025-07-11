import 'package:flutter/material.dart';

class ProfileAvatarCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final bool isOnline;
  final VoidCallback? onTap;
  final double avatarSize;
  final Widget? trailing;

  const ProfileAvatarCard({
    Key? key,
    required this.name,
    required this.role,
    required this.imageUrl,
    this.isOnline = false,
    this.onTap,
    this.avatarSize = 48.0,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundImage: NetworkImage(imageUrl),
                    backgroundColor: Colors.grey[200],
                  ),
                  if (isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      role,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
