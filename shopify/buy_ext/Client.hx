package shopify.buy_ext;

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

@:jsRequire('shopify-buy', 'shop-client')
extern class Client {
    public function new(config : Dynamic):Void;
    public function createCart():Promise<CartModel>;
    public function fetchAllCollections():Promise<Array<CollectionModel>>;
    public function fetchAllProducts():Promise<Array<ProductModel>>;
    public function fetchCart(id : String):Promise<CartModel>;
    public function fetchCollection(id : String):Promise<CollectionModel>;
    public function fetchProduct(id : String):Promise<ProductModel>;
    public function fetchRecentCart():Promise<CartModel>;
    public function fetchQueryProducts(query : ProductQueryModel):Promise<Array<ProductModel>>;
}

typedef ProductQueryModel = shopify.buy.ProductQueryModel;
typedef QuerySort = shopify.buy.ProductQueryModel.QuerySort;

/*
typedef ProductQueryModel = {
    ?collection_id: String,
    ?tag: Array<String>,
    ?product_ids: Array<String>,
    ?page: Int,
    ?limit: Int,
    ?handle: String,
    ?sort_by: QuerySort
};
*/
