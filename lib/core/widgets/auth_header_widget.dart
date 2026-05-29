import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBackPressed;

  /// OPTIONAL TITLE
  final String? title;

  /// SHOW TITLE OR NOT
  final bool showTitle;

  /// SHOW BACK BUTTON OR NOT
  final bool showBackButton;

  const AuthHeaderWidget({
    Key? key,
    required this.imagePath,
    required this.onBackPressed,
    this.title,

    /// DEFAULT FALSE
    this.showTitle = false,

    /// DEFAULT TRUE
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Stack(
          children: [

            /// BACKGROUND
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0090FF),
                    Color(0xFF005699),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            /// BACK BUTTON
            if (showBackButton)
              Positioned(
                top: 24,
                left: 12,
                child: SafeArea(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: onBackPressed,
                  ),
                ),
              ),

            /// OPTIONAL TITLE
            if (showTitle && title != null)
              Positioned.fill(
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 260,
                        ),
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}