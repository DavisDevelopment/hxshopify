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

class ProductVariantModel extends Model {
    public var title : String;
    public var image : ImageModel;
    public var price : String;

    override function __pull():Void {
        fwds('id', 'title', 'price');
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x) s.serialize( x );

        w( id );
        w( title );
        w( price );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        id = v();
        title = v();
        price = v();
    }

    public static function create(o : Obj):ProductVariantModel return new ProductVariantModel( o );
    public static function dcreate(o : Dynamic):ProductVariantModel return new ProductVariantModel( o );
}
