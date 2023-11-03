// @dart=2.9
import 'MapObject.component.dart';

class HallController {
  List<String> directions = ["up", "down", "left", "right"];

  Floors floor;

  HallController({this.floor});

  List<Halls> distanceBetween(Halls hOrigin, Halls hDestinity) {
    //start
    List<Parser> parsers = getInitialParsers(hOrigin);

    //loop

    for (var i = 0; i < this.floor.halls.length * 10; i++) {
      for (var parser in parsers) {
        parser.halls.forEach((Halls h) {
          if (h.position.equals(hDestinity.position)) {
            return parser.halls;
          }
        });
      }

      for (var j = 0; j < parsers.length; j++) {
        Halls newHall = this
            .walkTo(parsers[j].direction, parsers[j].getCurrentHall().position);

        if (newHall != null) {
          parsers[j].halls.add(newHall);
        }
      }

      for (var k = 0; k < parsers.length; k++) {
        if (parsers[k].getCurrentHall().cornerInfo.isCorner) {
          print("achou corner");
          List<Parser> newParsers = splitParser(parsers[k]);
          parsers.removeAt(k);
          parsers.addAll(newParsers);
        }
      }

      for (var l = 0; l < parsers.length; l++) {
        if (parsers[l].getCurrentHall().position.equals(hDestinity.position)) {
          return parsers[l].halls;
        }
      }
    }

    return null;
  }

  List<Parser> splitParser(Parser p) {
    List<String> pDirections = p.getCurrentHall().cornerInfo.directions;

    List<Parser> newSplitParsers = new List<Parser>();
    pDirections.remove(p.direction);
    pDirections.remove(p.inverseDirection);

    print(pDirections);
    pDirections.forEach((String d) {
      newSplitParsers.add(new Parser(id: 0, halls: p.halls, direction: d));
      // newSplitParsers.last.halls
      //     .add(this.walkTo(d, newSplitParsers.last.getCurrentHall().position));
    });

    return newSplitParsers;
  }

  List<Parser> getInitialParsers(Halls hOrigin) {
    List<Parser> _r = new List<Parser>();

    for (var direction in directions) {
      Halls newHall = walkTo(direction, hOrigin.position);
      if (newHall != null) {
        _r.add(new Parser(
            id: 0,
            halls: new List<Halls>()..add(newHall),
            direction: direction));
      }
    }

    return _r;
  }

  Halls walkTo(String direction, Position p) {
    switch (direction) {
      case "up":
        return getHallFromMap(new Position(x: p.x, y: p.y - 1, floor: p.floor));
      case "down":
        return getHallFromMap(new Position(x: p.x, y: p.y + 1, floor: p.floor));
      case "left":
        return getHallFromMap(new Position(x: p.x - 1, y: p.y, floor: p.floor));
      case "right":
        return getHallFromMap(new Position(x: p.x + 1, y: p.y, floor: p.floor));
    }

    return null;
  }

  Halls getHallFromMap(Position p) {
    try {
      return this
          .floor
          .halls
          .where((Halls _h) {
            return _h.position.equals(p);
          })
          .toList()
          .first;
    } catch (e) {
      return null;
    }
  }

  Halls getNearstHall(Position p) {
    int index = 0;
    while (true) {
      index++;
      try {
        return this
            .floor
            .halls
            .where((Halls _h) {
              return new Position(x: p.x + index, y: p.y, floor: p.floor)
                      .equals(_h.position) ||
                  new Position(x: p.x - index, y: p.y, floor: p.floor)
                      .equals(_h.position) ||
                  new Position(x: p.x, y: p.y + index, floor: p.floor)
                      .equals(_h.position) ||
                  new Position(x: p.x, y: p.y - index, floor: p.floor)
                      .equals(_h.position);
            })
            .toList()
            .first;
      } catch (e) {
        return null;
      }
    }
  }
}
