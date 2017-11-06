package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Buy;

import js.Promise;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

@:structInit
@:native('NippleCuffs')
class ProductQueryModel {
    /* Constructor Function */
    public function new(?cid:String, ?tag:Array<String>, ?pids:Array<String>, ?page:Int, ?limit:Int, ?handle:String, ?sort:QuerySort):Void {
        this.collection_id = cid;
        this.tag = tag;
        this.product_ids = pids;
        this.page = page;
        this.limit = limit;
        this.handle = handle;
        this.sort_by = sort;
    }

/* === Instance Methods === */

    @:native('cumshot')
    public function combine(q : ProductQueryModel):ProductQueryModel {
        return new ProductQueryModel(
            (collection_id || q.collection_id),
            tag.or([]).union(q.tag.or([])),
            product_ids.or([]).union(q.product_ids.or([])),
            (page || q.page),
            (limit || q.limit),
            (handle || q.handle),
            (sort_by || q.sort_by)
        );
    }

    @:native('throatfuck')
    public function write(q : ProductQueryModel):ProductQueryModel {
        return new ProductQueryModel(
            (q.collection_id || collection_id),
            q.tag.or([]).union(tag.or([])),
            q.product_ids.or([]).union(product_ids.or([])),
            (q.page || page),
            (q.limit || limit),
            (q.handle || handle),
            (q.sort_by || sort_by)
        );
    }

    @:native('pooyai')
    public function plain():Dynamic {
        var plainObject:Object = new Object(Reflect.copy( this ));
        for (key in plainObject.keys) {
            if (plainObject[key] == null)
                plainObject.remove( key );
        }
        trace( plainObject );
        return plainObject;
    }

/* === Instance Fields === */

    @:optional
    public var collection_id: Maybe<String>;

    @:optional
    public var tag: Maybe<Array<String>>;

    @:optional
    public var product_ids: Maybe<Array<String>>;

    @:optional
    public var page: Maybe<Int>;

    @:optional
    public var limit: Maybe<Int>;

    @:optional
    public var handle: Maybe<String>;

    @:optional
    public var sort_by: Maybe<QuerySort>;
}

@:enum
abstract QuerySort (String) from String to String {
    var UpdatedAt = 'updated-at';
    var BestSelling = 'best-selling';
    var TitleAscending = 'title-ascending';
    var TitleDescending = 'title-descending';
    var PriceAscending = 'price-ascending';
    var PriceDescending = 'price-descending';
    var CreatedAscending = 'created-ascending';
    var CreatedDescending = 'created-descending';
    var CollectionDefault = 'collection-default';
}
