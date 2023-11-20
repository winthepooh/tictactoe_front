import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe/common/styles/app_text_style.dart';

class PlayBoard extends StatelessWidget {
  final List<List<int>> moves;
  final void Function(int index) clickBoard;
  const PlayBoard({super.key, required this.moves, required this.clickBoard});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Piece(
              index: 0,
              move: moves[0][0],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 1,
              move: moves[0][1],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 2,
              move: moves[0][2],
              onClick: (index) {
                clickBoard(index);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Piece(
              index: 3,
              move: moves[1][0],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 4,
              move: moves[1][1],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 5,
              move: moves[1][2],
              onClick: (index) {
                clickBoard(index);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Piece(
              index: 6,
              move: moves[2][0],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 7,
              move: moves[2][1],
              onClick: (index) {
                clickBoard(index);
              },
            ),
            _Piece(
              index: 8,
              move: moves[2][2],
              onClick: (index) {
                clickBoard(index);
              },
            ),
          ],
        )
      ],
    );
  }
}

class _Piece extends StatelessWidget {
  final int move;
  final int index;
  final void Function(int index) onClick;

  const _Piece(
      {required this.move, required this.index, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        onClick(index);
      },
      child: Container(
        width: 180.r,
        height: 180.r,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
            child: move != 0
                ? Text(
                    move == 1 ? "X" : "O",
                    style: AppTextStyle.popBlackSemiBoldTextStyle.copyWith(
                        fontSize: 100.sp,
                        color: move == 1 ? Colors.red : Colors.blue),
                  )
                : Container()),
      ),
    );
  }
}
