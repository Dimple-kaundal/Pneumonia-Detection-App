
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Colors/colors.dart';

class MySearchableDropdownenroll extends StatefulWidget {
  final List<String> dropdownItems;
  final String hintText;
  final TextEditingController controller; // Ensure it's a TextEditingController
  final String? Function(String?) validator;
  final ValueChanged<String>? onChanged;

  const MySearchableDropdownenroll({
    super.key,
    required this.dropdownItems,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.onChanged,
  });

  @override
  State<MySearchableDropdownenroll> createState() =>
      _MySearchableDropdownenrollState();
}

class _MySearchableDropdownenrollState
    extends State<MySearchableDropdownenroll> {
  final _link = LayerLink();
  final _overlayController = OverlayPortalController();
  final GlobalKey _textFieldKey = GlobalKey(); // Key for TextFormField

  String? selectedItem; // Variable to store selected item
  String tempInput = ''; // Temporary input variable

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: SizedBox(
        width: double.infinity, // ✅ instead of Expanded
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (BuildContext context) {
            return CompositedTransformFollower(
              link: _link,
              targetAnchor: Alignment.bottomLeft,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: dropdown(),
              ),
            );
          },
          child: textField(),
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        key: _textFieldKey,
        child: Stack(
          children: [
            const ListTile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                style: const TextStyle(color: Colors.blueGrey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  } else if (!widget.dropdownItems.any(
                      (item) => item.toLowerCase() == value.toLowerCase())) {
                    return 'Select item from the list';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey ),
                  border: InputBorder.none,
                ),
                controller: widget.controller,
                onTap: () {
                  _overlayController.show();
                },
                onChanged: (value) {
                  setState(() {
                    tempInput = value;
                  });
                  _overlayController.show();
                },
                onFieldSubmitted: (value) {
                  final match = widget.dropdownItems.firstWhere(
                    (item) => item.toLowerCase() == value.toLowerCase(),
                    orElse: () => '',
                  );

                  if (match.isNotEmpty) {
                    setState(() {
                      selectedItem = match;
                      widget.controller.text = match;
                    });
                    widget.onChanged?.call(match);
                    _overlayController.hide();
                    FocusScope.of(context).unfocus();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Select an item from the list')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdown() {
    final renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    final width =
        renderBox?.size.width ?? MediaQuery.of(context).size.width * 0.9;

    final filteredItems = widget.dropdownItems
        .where((item) =>
            item.toLowerCase().contains(tempInput.toLowerCase()))
        .toList();

    final double dropdownHeight =
        (filteredItems.length * 48.0).clamp(0.0, 200.0);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      width: width,
      height: dropdownHeight,
      child: TextFieldTapRegion(
        onTapOutside: (p) {
          _overlayController.hide();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < filteredItems.length; i++)
                HoverableListTile(
                  title: filteredItems[i],
                  onTap: () {
                    _overlayController.hide();
                    setState(() {
                      selectedItem = filteredItems[i];
                      widget.controller.text = filteredItems[i];
                    });
                    widget.onChanged?.call(filteredItems[i]);
                    FocusScope.of(context).unfocus();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverableListTile extends StatefulWidget {
  final String title;
  final Function() onTap;

  const HoverableListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  _HoverableListTileState createState() => _HoverableListTileState();
}

class _HoverableListTileState extends State<HoverableListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        color: isHovered ? AppColors.headingColor : Colors.white,
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: isHovered ? Colors.white : Colors.black,
            ),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
