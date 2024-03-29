import 'package:flutter/material.dart';
import 'package:japaapp/core/constants.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final Widget child;

  const CustomAccordion({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _CustomAccordionState createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion>
  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: _toggleExpanded,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFB7C6CC)),
                borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                   
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
        // if (_isExpanded)
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 0.0),
        //     child: widget.child,
        //   ),

             SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1.0,
          child: AnimatedOpacity(
            opacity: _isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
