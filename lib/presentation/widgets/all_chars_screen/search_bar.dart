import 'dart:async';

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  late TextEditingController controller;

  final Function onChange;
  Timer? _debounceTimer;
  final _searchTimeDelayMillis = const Duration(milliseconds: 300);

  SearchBarWidget(
      {TextEditingController? controller, required this.onChange, super.key}) {
    controller == null
        ? this.controller = TextEditingController()
        : this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 1,
              controller: controller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  onChanged: (text) {
                    _onSearchChanged(text);
                  },
                ),
              ),
          ],
        ),
    );
  }

  void _onSearchChanged(String searchText) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(_searchTimeDelayMillis, () {
      onChange(searchText);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
  }
}
