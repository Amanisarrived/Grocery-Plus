import 'package:flutter/material.dart';
// import 'package:my_project_first/provider/logic_provider.dart';
import 'package:my_project_first/provider/product_provider.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: (value) {
        Provider.of<ProductProvider>(
          context,
          listen: false,
        ).serchingItem(value);
      },
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
