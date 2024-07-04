import 'package:clean_architecture/resources/res.dart';
import 'package:flutter/material.dart';

// Super useful for handle paginated lists!
class PaginatedList extends StatefulWidget {
  const PaginatedList({
    required this.initFunction,
    required this.showPageLoader,
    required this.cardsLength,
    required this.maxCardsLenght,
    required this.scrollNextPageFunc,
    required this.externalScrollController,
    required this.itemBuilder,
    super.key,
    this.physics,
  });

  /// Function to init the cards list
  final Future<dynamic> Function() initFunction;
  final bool showPageLoader;

  /// The lenght of the current fetched cards
  final int cardsLength;

  /// The maximum fetchable cards
  final int maxCardsLenght;

  /// Function that is triggered when you reach the end of the current fetched cards list
  final Future<dynamic> Function() scrollNextPageFunc;

  /// Creates a scrollable, linear array of widgets that are created on demand with pagination.
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollPhysics? physics;
  final ScrollController? externalScrollController;

  @override
  State<PaginatedList> createState() {
    return _PaginatedListState();
  }
}

class _PaginatedListState extends State<PaginatedList> {
  @override
  void initState() {
    widget.initFunction();
    widget.externalScrollController!.addListener(() async {
      if (widget.externalScrollController!.position.pixels ==
              widget.externalScrollController!.position.maxScrollExtent &&
          !widget.showPageLoader &&
          (widget.cardsLength < widget.maxCardsLenght)) {
        await widget.scrollNextPageFunc();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.externalScrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: [
        const SizedBox(height: Dimension.padding),
        ListView.builder(
          shrinkWrap: true,
          //scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: widget.itemBuilder,
          itemCount: widget.cardsLength,
        ),
        if (widget.cardsLength < widget.maxCardsLenght)
          const Padding(
            padding: EdgeInsets.only(bottom: Dimension.padding),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
