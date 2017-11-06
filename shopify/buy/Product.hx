package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Client.ProductQueryModel;
import shopify.buy_ext.Client as EClient;
import shopify.buy_ext.ProductModel;
import shopify.buy_ext.ProductOptionModel;
import shopify.buy_ext.ProductVariantModel;
import shopify.buy_ext.ImageModel;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Product {
    /* Constructor Function */
    public function new(client:Client, model:ProductModel):Void {
        this.client = client;
        this.model = model;

        /*
        created_at = model.created_at;
        updated_at = model.updated_at;
        id = model.id;
        width = model.width;
        height = model.height;
        position = model.position;
        product_id = model.product_id;
        src = model.src;
        variant_ids = model.variant_ids;
        variants = model.variants;
        */
        title = model.title;
        description = model.description;
        id = model.id;
        images = model.images;
        options = model.options;
        selections = model.selections;
        selectedVariant = model.selectedVariant;
        variants = model.variants;
    }

/* === Instance Fields === */

    /*
    public var created_at : String;
    public var updated_at : String;
    public var id : Int;
    public var width : Int;
    public var height : Int;
    public var position : Int;
    public var product_id : Int;
    public var src : String;
    public var variant_ids : Array<Int>;
    public var variants : Array<ImageVariantModel>;
    */
    public var title : String;
    public var description : String;
    public var id : String;
    public var images : Array<ImageModel>;
    public var options : Array<ProductOptionModel>;
    public var selections : Array<String>;
    public var selectedVariant : ProductVariantModel;
    public var variants : Array<ProductVariantModel>;

    private var client : Client;
    private var model : ProductModel;
}
