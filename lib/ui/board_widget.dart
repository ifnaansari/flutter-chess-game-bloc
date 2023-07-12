import 'package:flutter/material.dart';
import 'package:flutter_chess_game/models/board.dart';
import 'package:flutter_chess_game/models/cell.dart';
import 'package:flutter_chess_game/ui/cell_widget.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final Cell? selectedCell;
  final Set<String> availablePositionsHash;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.selectedCell,
    required this.availablePositionsHash,
  }) : super(key: key);

  List<CellWidget> _buildCells(BuildContext context) {
    final List<CellWidget> cellWidgets = [];

    for (var cellList in board.cells) {
      for (var cell in cellList) {
        cellWidgets.add(CellWidget(
          cell: cell,
          isSelected: selectedCell != null && selectedCell! == cell,
          isAvailable: availablePositionsHash.contains(cell.positionHash),
        ));
      }
    }

    return cellWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cellSize = screenWidth / boardSize;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.brown, width: 16),
          bottom: BorderSide(color: Colors.brown, width: 16),
        ),
      ),
      constraints: BoxConstraints(maxHeight: cellSize * boardSize),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(), // Avoid scrolling
        padding: const EdgeInsets.all(0),
        crossAxisCount: boardSize,
        childAspectRatio: 1,
        children: _buildCells(context),
      ),
    );
  }
}