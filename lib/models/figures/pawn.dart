import 'package:flutter_chess_game/models/cell.dart';
import 'package:flutter_chess_game/models/cell_calculator.dart';
import 'package:flutter_chess_game/models/figure.dart';
import 'package:flutter_chess_game/models/figure_types.dart';
import 'package:flutter_chess_game/models/game_colors.dart';

class Pawn extends Figure {
  bool _canDoubleMove = true;

  Pawn({required GameColors color, required Cell cell})
      : super(color: color, cell: cell, type: FigureTypes.pawn);

  @override
  onMoved(Cell to) {
    super.onMoved(to);
    _canDoubleMove = false;
  }

  @override
  bool availableForMove(Cell to) {
    // if (to.positionHash == '3-4' && cell.positionHash == '3-5') {
    //   final a = 'dd';
    // }

    if (!super.availableForMove(to)) {
      return false;
    }

    return CellCalculator.hasWayForPawn(cell, to, _canDoubleMove);
  }
}
