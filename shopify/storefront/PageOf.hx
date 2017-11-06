package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import Slambda.fn;

import haxe.Serializer;
import haxe.Unserializer;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class PageOf<T> extends Model {
    /* Constructor Function */
    public function new(data:Obj, pullItem:Obj->T):Void {
        super( data );

        this.pullItem = pullItem;

        __pullitems();
    }

/* === Instance Methods === */

    /**
      * pull [this]'s items
      */
    override function __pull():Void {
        forward( 'pageInfo' );
    }

    /**
      * extract [items] from [o]
      */
    private function __pullitems():Void {
        var node : Obj;
        var item : T;
        var edges:Array<Dynamic> = d['edges'];
        items = new Array();
        cursors = new Array();
        for (e in edges) {
            node = e.node;
            item = pullItem( node );
            items.push( item );
            cursors.push( e.cursor );
        }
    }

    /**
      * iterate over [this]'s items
      */
    public function iterator():Iterator<T> {
        return items.iterator();
    }

    /**
      * serialize [this]
      */
    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x:Dynamic) s.serialize( x );

        w( items.length );
        for (item in items) {
            w( item );
        }

        w( cursors.length );
        for (cursor in cursors) {
            w( cursor );
        }

        w( pageInfo.hasNextPage );
        w( pageInfo.hasPreviousPage );
    }

    /**
      * unserialize [this]
      */
    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );

        inline function v():Dynamic return u.unserialize();

        var len:Int = v();
        items = [for (i in 0...len) v()];
        len = v();
        cursors = [for (i in 0...len) v()];
        pageInfo = {
            hasNextPage: v(),
            hasPreviousPage: v()
        };
    }

/* === Instance Fields === */

    public var items : Array<T>;
    public var cursors : Array<String>;
    public var pageInfo : {hasNextPage:Bool, hasPreviousPage:Bool};

    private var pullItem : Obj -> T;

/* === Static Methods === */

    /**
      * create a thing
      */
    public static inline function create<T>(o:Obj, pull:Obj->T):PageOf<T> {
        return new PageOf(o, pull);
    }

    /**
      * create and return a PageOf<T> generator function
      */
    public static function creator<T>(pull : Obj->T):Obj->PageOf<T> {
        return function(o : Obj) {
            return create(o, pull);
        };
    }
}
