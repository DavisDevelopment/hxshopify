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

class ProductModel extends Model {
/* === Instance Methods === */

    /**
      * pull data onto [this] Model
      */
    override function __pull():Void {
        fwds(
            'id', 'handle', 'title',
            'fullDescription',
            'shortDescription',
            'htmlDescription',
            {property:'createdAt', transform: _date},
            {property:'publishedAt', transform: _date},
            {property:'updatedAt', transform: _date},
            'tags', 'productType',
            {property:'images', transform: _p2a(ImageModel)},
            {property:'thumbnails', transform: _p2a(ImageModel)},
            {property:'variants', transform: _p2a(ProductVariantModel)}
        );

        //fwd('images', 'images', _p2a( ImageModel ));
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x:Dynamic) s.serialize( x );

        w( id );
        w( handle );
        w( title );
        w( fullDescription );
        w( shortDescription );
        w( htmlDescription );
        w( createdAt );
        w( publishedAt );
        w( updatedAt );
        w( tags );
        w( productType );
        w( images );
        w( thumbnails );
        w( variants );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        id = v();
        handle = v();
        title = v();
        fullDescription = v();
        shortDescription = v();
        htmlDescription = v();
        createdAt = v();
        publishedAt = v();
        updatedAt = v();
        tags = v();
        productType = v();
        images = v();
        thumbnails = v();
        variants = v();
    }

/* === Instance Fields === */

    public var handle : String;
    public var title : String;
    public var fullDescription : String;
    public var shortDescription : String;
    public var htmlDescription : String;
    public var createdAt : Date;
    public var publishedAt : Date;
    public var updatedAt : Date;
    public var tags : Array<String>;
    public var productType : String;

    public var images : Array<ImageModel>;
    public var thumbnails : Array<ImageModel>;
    public var variants : Array<ProductVariantModel>;

/* === Static Methods === */

    public static function create(o : Obj):ProductModel {
        return new ProductModel( o );
    }
}
