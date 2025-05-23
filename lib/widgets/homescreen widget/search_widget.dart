import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search Essesntials",
      hintStyle: WidgetStatePropertyAll<TextStyle>(
        TextStyle(fontWeight: FontWeight.w100, color: Colors.grey[500]),
      ),
      elevation: WidgetStatePropertyAll<double>(0),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      leading: Icon(Icons.search),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}

