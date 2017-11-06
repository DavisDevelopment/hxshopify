package shopify.buy;

import tannus.ds.*;
import tannus.ds.promises.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Client.ProductQueryModel;
import shopify.buy_ext.Client as EClient;

import shopify.buy.Tools.*;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

@:allow( shopify.buy.Buy )
class Client {
    private function new(c : EClient):Void {
        this.c = c;
    }

/* === Instance Methods === */

    public function createCart():Promise<Cart> {
        return promise(c.createCart()).transform.fn(new Cart(_));
    }

    public function fetchAllCollections():ArrayPromise<Collection> {
        return promise(c.fetchAllCollections()).transform(function(cms) {
            return cms.map.fn(new Collection(_));
        }).array();
    }

    public function fetchAllProducts():ArrayPromise<Product> {
        return promise(c.fetchAllProducts()).array().map(function(product_model) {
            return new Product(this, product_model);
        });
    }

    public function fetchCart(id : String):Promise<Cart> {
        return promise(c.fetchCart( id )).transform.fn(new Cart(_));
    }

    public function fetchCollection(id : String):Promise<Collection> {
        return promise(c.fetchCollection( id )).transform.fn(new Collection(_));
    }

    public function fetchProduct(id : String):Promise<Product> {
        return promise(c.fetchProduct( id )).transform(function(product_model) {
            return new Product(this, product_model);
        });
    }

    public function fetchRecentCart():Promise<Cart> {
        return promise(c.fetchRecentCart()).transform.fn(new Cart(_));
    }

    public function fetchQueryProducts(query : ProductQueryModel):ArrayPromise<Product> {
        return promise(c.fetchQueryProducts(query.plain())).array().map(function(product_model) {
            return new Product(this, product_model);
        });
    }

/* === Instance Fields === */

    private var c : EClient;
}
