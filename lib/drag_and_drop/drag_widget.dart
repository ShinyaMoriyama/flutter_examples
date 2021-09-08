import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './game_score.dart';
import './even_number.dart';
import './odd_number.dart';
import './number_container.dart';

class DragWidget extends StatelessWidget {
  const DragWidget();

  @override
  Widget build(BuildContext context) {
    print("rebuild");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Consumer<GameScore>(
              builder: (context, game, _) {
                print("rebuild total");
                return Text(
                  "Total: ${game.score}",
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 18),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              EvenContainer(),
              NumberContainer(),
              OddContainer(),
            ],
          ),
        ],
      ),
    );
  }
}
