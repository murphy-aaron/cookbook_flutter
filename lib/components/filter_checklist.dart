import 'package:cookbook_flutter/components/titled_checklist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/recipe_data.dart';

class FilterChecklist extends StatefulWidget {
  const FilterChecklist({required this.tags});

  final Map<String, bool> tags;

  @override
  State<FilterChecklist> createState() => _FilterChecklistState();
}

class _FilterChecklistState extends State<FilterChecklist> {
  @override
  Widget build(BuildContext context) {

    final List<String> keys = List.of(widget.tags.keys);

    return ListView.builder(
      itemBuilder: (context, index) {
        final String tag = keys[index];
        final bool isActive = widget.tags[tag]!;
        return ChecklistItem(
            label: tag,
            isChecked: isActive,
            checkboxCallback: (checkboxState) {
              setState(() {
                Provider.of<RecipeData>(context, listen: false).updateFilter(tag);
              });
            }
        );
      },
      itemCount: widget.tags.length,
      shrinkWrap: true,
      primary: false,
    );
  }
}
