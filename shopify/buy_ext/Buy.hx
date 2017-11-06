package shopify.buy_ext;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

@:jsRequire('shopify-buy')
extern class Buy {
    static function buildClient(config : ConfigAttrs):Client;
}

typedef ConfigAttrs = {
    accessToken:String,
    appId:Int,
    domain:String
};
