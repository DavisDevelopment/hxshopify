package shopify.buy;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy_ext.Buy.ConfigAttrs;
import shopify.buy_ext.Buy.buildClient as bc;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Buy {
    public static function buildClient(config : ConfigAttrs):Client {
        return new Client(bc( config ));
    }
}
