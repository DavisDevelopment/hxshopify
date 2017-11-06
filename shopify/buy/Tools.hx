package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Client.ProductQueryModel;
import shopify.buy_ext.Client as EClient;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Tools {
    public static function promise<T>(promise : js.Promise<T>):Promise<T> {
        return Promise.fromJsPromise( promise );
    }
}
