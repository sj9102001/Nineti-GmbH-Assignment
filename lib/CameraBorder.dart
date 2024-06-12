import 'package:flutter/material.dart';

// CameraBorder is a custom widget that creates a border around the given child widget.
class CameraBorder extends StatelessWidget {
  // Constructor for CameraBorder, requiring a child widget
  CameraBorder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive UI
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: screenSize.height * 0.15),
      height: screenSize.height * 0.39,
      width: screenSize.height * 0.39,
      child: Stack(
        children: [
          // Position the child widget in the center
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: child,
            ),
          ),
          // Top-left corner decoration
          Positioned(
            top: 0,
            left: 0,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: 0.6,
                heightFactor: 0.6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                      left: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Top-left corner decoration
          Positioned(
            top: 0,
            right: 0,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topRight,
                widthFactor: 0.6,
                heightFactor: 0.6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                      right: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Bottom-left corner decoration
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomLeft,
                widthFactor: 0.6,
                heightFactor: 0.6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                      left: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Bottom-right corner decoration
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomRight,
                widthFactor: 0.6,
                heightFactor: 0.6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                      right: BorderSide(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
