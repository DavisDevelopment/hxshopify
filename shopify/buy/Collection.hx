package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy.ProductQueryModel.QuerySort;
import shopify.buy_ext.ImageModel;
import shopify.buy_ext.CollectionModel;

import Std.*;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Collection {
    public function new(cm : CollectionModel):Void {
        this.model = cm;
        var a = model.attrs;

        id = string(a.collection_id);
        handle = a.handle;
        title = a.title;
        publishedAt = Type.createInstance(Date, [a.published_at]);
        updatedAt = Type.createInstance(Date, [a.updated_at]);
        sortOrder = a.sort_order;
    }

    public var id : String;
    public var handle : String;
    public var title : String;
    public var publishedAt : Date;
    public var updatedAt : Date;
    public var sortOrder : QuerySort;

    private var model : CollectionModel;
}
