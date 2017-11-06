package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Client.ProductQueryModel;
import shopify.buy_ext.Client as EClient;
import shopify.buy_ext.CartLineItemModel;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class CartLineItem {
    /* Constructor Function */
    public function new(i : CartLineItemModel):Void {
        this.i = i;

        this.id = i.id;
        this.compareAtPrice = i.compareAtPrice;
        this.grams = i.grams;
        this.image = i.image;
        this.imageVariant = i.imageVariant;
        this.line_price = i.line_price;
        this.price = i.price;
        this.product_id = i.product_id;
        this.quantity = i.quantity;
        this.title = i.title;
        this.variant_id = i.variant_id;
        this.variant_title = i.variant_title;
    }

/* === Methods === */

    public static function fromClimJsPromise(p : js.Promise<CartLineItemModel>):Promise<CartLineItem> {
        return Promise.fromJsPromise( p ).transform.fn(new CartLineItem(_));
    }
    private static inline function pm(p : js.Promise<CartLineItemModel>):Promise<CartLineItem> return fromClimJsPromise( p );

/* === Instance Fields === */

    public var id : String;
    public var compareAtPrice: String;
    public var grams : Float;
    public var image : Dynamic;
    public var imageVariant : Array<Dynamic>;
    public var line_price : String;
    public var price : String;
    public var product_id : String;
    public var quantity : Int;
    public var title : String;
    public var variant_id : String;
    public var variant_title : String;

    private var i : CartLineItemModel;
}
