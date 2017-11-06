package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import haxe.Serializer;
import haxe.Unserializer;

import Slambda.fn;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class CartLineItemModel extends Model {
/* === Instance Methods === */

    override function __pull():Void {
        fwds('quantity', 'title', 'id');
        forward('variant', 'variant', function(od : Dynamic) {
            return ProductVariantModel.dcreate( od );
        });
        if (variant != null) {
            var sprice:String = variant.price;
            if (sprice.has('$$')) {
                sprice = sprice.after('$$');
            }
            line_price = (Std.parseFloat( sprice ) * quantity);
        }
    }

    /**
      * serialize [this]
      */
    @:keep
    override function hxSerialize(s : Serializer):Void {
        super.hxSerialize( s );

        inline function w(x:Dynamic) s.serialize( x );

        w( id );
        w( title );
        w( quantity );
        w( line_price );
        w( variant );
    }

    /**
      * unserialize [this]
      */
    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );

        inline function v():Dynamic return u.unserialize();

        id = v();
        title = v();
        quantity = v();
        line_price = v();
        variant = v();
    }

/* === Instance Fields === */

    public var quantity : Int;
    public var title : String;
    public var line_price : Float;
    public var variant : Null<ProductVariantModel>;

/* === Statics === */

    public static function create(o : Obj):CartLineItemModel {
        return new CartLineItemModel( o );
    }
}
