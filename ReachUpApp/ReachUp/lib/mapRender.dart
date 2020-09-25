import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class MapRender extends Game {
  Size screenSize;
  @override
  void render(Canvas canvas) {
    Rect localRect = Rect.fromLTWH(left, top, width, height);
    Sprite image = Sprite('assets/localImages/localImage.png');

    const size = 0.00;
    var localImage = SpriteComponent.fromSprite(width, height, image);
    localImage.x = 0;
    localImage.y = 0;
    local.angle = 0;
    localImage.render(canvas);
  }

  @override
  void update(double t) {}
  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }
}
