package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Client.ProductQueryModel;
import shopify.buy_ext.Client as EClient;
import shopify.buy_ext.CartModel;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Cart {
    /* Constructor Function */
    public function new(model : CartModel):Void {
        this.model = model;

        this.lineItems = model.lineItems.map.fn(new CartLineItem(_));
    }

/* === Instance Methods === */

    public function clearLineItems():Promise<Cart> {
        return pmap(model.clearLineItems());
    }

    public function createLineItemsFromVariants(items : Array<CartLineItemOpt>):Promise<Cart> {
        return pmap(Reflect.callMethod(model, model.createLineItemsFromVariants, items));
    }

    public function removeLineItem(id : String):Promise<Cart> {
        return pmap(model.removeLineItem( id ));
    }

    public function updateLineItem(id:String, quantity:Int):Promise<Cart> {
        return pmap(model.updateLineItem(id, quantity));
    }

    public function updateModel():Promise<Cart> {
        return pmap(model.updateModel());
    }

    /**
      * transform a js.Promise<CartModel> into a Promise<Cart>
      */
    private static function pmap(promise : js.Promise<CartModel>):Promise<Cart> {
        return Promise.fromJsPromise( promise ).transform.fn(new Cart(_));
    }

/* === Computed Instance Fields === */

    public var checkoutUrl(get, never):String;
    private inline function get_checkoutUrl() return model.checkoutUrl;

    public var id(get, never):String;
    private inline function get_id() return model.id;

    public var lineItemCount(get, never):Int;
    private inline function get_lineItemCount() return model.lineItemCount;

    public var subtotal(get, never):String;
    private inline function get_subtotal() return model.subtotal;

/* === Instance Fields === */

    public var lineItems : Array<CartLineItem>;

    private var model : CartModel;
}

typedef CartLineItemOpt = {variant:ProductVariant, quantity:Int};

//typedef Cart = shopify.buy_ext.CartModel;
