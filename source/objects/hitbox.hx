package objects;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.ui.FlxButton;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;
import openfl.display.Shape;

class Hitbox extends FlxTypedSpriteGroup<FlxButton> {
    public var buttonLeft:FlxButton;
    public var buttonDown:FlxButton;
    public var buttonUp:FlxButton;
    public var buttonRight:FlxButton;

    public function new(hints:Bool = true) {
        super();

        var buttonWidth:Int = Std.int(FlxG.width / 4);
        var buttonHeight:Int = FlxG.height;

        buttonLeft = createHitbox(0, 0, buttonWidth, buttonHeight, 0xFFC24B99, hints);
        buttonDown = createHitbox(buttonWidth, 0, buttonWidth, buttonHeight, 0xFF00FFFF, hints);
        buttonUp = createHitbox(buttonWidth * 2, 0, buttonWidth, buttonHeight, 0xFF12FA05, hints);
        buttonRight = createHitbox(buttonWidth * 3, 0, buttonWidth, buttonHeight, 0xFFF9393F, hints);

        add(buttonLeft);
        add(buttonDown);
        add(buttonUp);
        add(buttonRight);

        scrollFactor.set();
    }

    private function createHitbox(x:Float, y:Float, width:Int, height:Int, color:Int, hints:Bool):FlxButton {
        var btn:FlxButton = new FlxButton(x, y);
        
        var shape:Shape = new Shape();
        shape.graphics.beginFill(color, hints ? 0.2 : 0.00001);
        shape.graphics.drawRect(0, 0, width, height);
        shape.graphics.endFill();

        var bitmap:BitmapData = new BitmapData(width, height, true, 0x00000000);
        bitmap.draw(shape);

        btn.loadGraphic(FlxGraphic.fromBitmapData(bitmap));
        btn.alpha = 0.6;
        return btn;
    }
}
