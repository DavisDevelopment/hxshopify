package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import shopify.ShopifyGlobals._ as us;
import Slambda.fn;

import haxe.Serializer;
import haxe.Unserializer;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class ImageModel extends Model {
    public var altText : Null<String>;
    public var src : String;

    override function __pull():Void {
        fwds('id', 'altText', 'src');
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x:Dynamic) s.serialize( x );

        w( id );
        w( altText );
        w( src );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        id = u.unserialize();
        altText = u.unserialize();
        src = u.unserialize();
    }

    public static function create(o : Obj):ImageModel return new ImageModel( o );
}
