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

class CustomerAccessTokenModel extends Model {
/* === Instance Methods === */

    override function __pull():Void {
        fwds('accessToken', {property:'expiresAt', transform:_date});
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x:Dynamic) s.serialize( x );

        w( accessToken );
        w( expiresAt );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        accessToken = v();
        expiresAt = v();
    }

/* === Instance Fields === */

    public var accessToken : String;
    public var expiresAt : Date;

/* === Statics === */

    public static function create(o : Obj):CustomerAccessTokenModel {
        return new CustomerAccessTokenModel( o );
    }
}
