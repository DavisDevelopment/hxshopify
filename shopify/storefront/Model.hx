package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import haxe.extern.EitherType;

import Slambda.fn;
import Reflect.*;
import shopify.ShopifyGlobals._ as us;

import haxe.Serializer;
import haxe.Unserializer;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class Model implements Dynamic<Dynamic> {
    /* Constructor Function */
    public function new(data : Obj):Void {
        //this.d = data;
        _src = Pulled( data );

        id = '';
        fwds = makeVarArgs(untyped _fwds.bind(_));
        model = this;

        __pull();
    }

/* === Instance Methods === */

    /**
      * update [this] Model
      */
    public function update(o : Obj):Model {
        _src = Pulled( o );

        __pull();

        return this;
    }

    public function idNum():Int {
        if (this._idnum == null) {
            var gid:String = ((untyped __js__('atob')( id )) + '').afterLast('/');
            this._idnum = Std.parseInt( gid );
        }
        return cast this._idnum;
    }

    /**
      * pull data from [d] onto [this] upon instantiation
      */
    private function __pull():Void {
        //TODO
    }

    /**
      * forward a property from [d] onto [this]
      */
    private function forward(fieldName:String, ?propName:String, ?transform:Dynamic->Dynamic):Void {
        if (propName == null) {
            propName = fieldName;
        }

        if (transform == null) {
            transform = fn( _ );
        }

        var fn = new ObjectPath( fieldName );
        var pn = new ObjectPath( propName );

        pn.set(this, transform(d.extract( fieldName )));
    }
    private inline function fwd(fn:String, ?pn:String, ?f:Dynamic->Dynamic):Void forward(fn, pn, f);

    /**
      * underlying method for [fwds] magic
      */
    private function _fwds(fields : Iterable<EitherType<PropFwd, Iterable<PropFwd>>>):Void {
        for (field in fields) {
            inline function dv():Dynamic return (untyped field);
            if ((field is String)) {
                forward(cast field);
            }
            else if ((field is Array<PropFwd>)) {
                _fwds(untyped field);
            }
            else if (Reflect.isObject( field )) {
                forward(dv().property, dv().name, dv().transform);
            }
            else continue;
        }
    }

    /**
      * forward multiple properties
      */
    private function forwards(props : Array<PropertyForward>):Void {
        for (prop in props) {
            forward(prop.property, prop.name, prop.transform);
        }
    }

    /**
      * create and return a 'transform' function for mapping 'page'd data to arrays
      */
    private function _page2array<T>(f : Obj->T):Dynamic->Dynamic {
        return function(od : Dynamic) {
            var o:Obj = Obj.fromDynamic( od );
            var page = PageOf.create(o, f);
            return page.array();
        };
    }
    private function _p2a<T>(type : Class<T>):Dynamic->Dynamic {
        var create:Obj->T = (untyped type).create;
        if (create == null) {
            create = untyped makeVarArgs(Type.createInstance.bind(type, _));
        }
        return _page2array( create );
    }

    private function _date(s : String):Date {
        return (untyped __js__('new Date({0})', s));
    }

    /**
      * check whether [this] Model was built by Unserialization
      */
    public inline function isUnserialized():Bool {
        return modelSource.match( Unserialized );
    }

    /**
      * serialize [this]
      */
    @:keep
    private function hxSerialize(s : Serializer):Void {
        inline function w(x) s.serialize( x );
    }

    /**
      * unserialize [this]
      */
    @:keep
    private function hxUnserialize(u : Unserializer):Void {
        _src = Unserialized;
        fwds = makeVarArgs(untyped _fwds.bind(_));
    }

    /**
      * get [this]'s underlying Model
      */
    public inline function getDynamic():Dynamic {
        return (d != null ? d.toDyn() : null);
    }

/* === Computed Instance Fields === */

    public var modelSource(get, never):ModelSource;
    private inline function get_modelSource() return _src;

    public var d(get, never):Null<Obj>;
    private function get_d() {
        return (switch ( modelSource ) {
            case Pulled( o ): o;
            case _: null;
        });
    }

/* === Instance Fields === */

    public var id : String;
    public var fwds : Dynamic;

    //private var d : Obj;
    private var _src : ModelSource;
    private var model : Model;
}

typedef PropertyForward = {
    property: String,
    ?name: String,
    ?transform: Dynamic->Dynamic
};

typedef PropFwd = EitherType<String, PropertyForward>;

enum ModelSource {
    Unserialized;
    Pulled(o : Obj);
}
