package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;
import tannus.http.WebRequest as Request;

import graphql.ast.*;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Client {
    /* Constructor Function */
    public function new(storefrontName:String, accessToken:String):Void {
        this.storefrontName = storefrontName;
        this.accessToken = accessToken;
    }

/* === Instance Methods === */

    /**
      * execute a GraphQl query
      */
    public function sendgql<T>(query:String, ?extractor:String, ?transform:Obj->T, ?done:Cb<T>):Null<Promise<T>> {
        if (done != null) {
            _sendgql(query, extractor, transform, done);
            return null;
        }
        else {
            return new Promise(function(accept, reject) {
                _sendgql(query, extractor, transform, function(?error, ?data) {
                    if (error != null)
                        return reject( error );
                    else
                        return accept( data );
                });
            });
        }
    }
    
    /**
      * execute a GraphQl query
      */
    private function _sendgql<T>(query:String, extractor:Null<String>, transform:Null<Obj->T>, callback:Cb<T>):Void {
        var req:Request = new Request();
        req.open('POST', 'https://$storefrontName.myshopify.com/api/graphql');
        req.setRequestHeader('Content-Type', 'application/graphql');
        req.setRequestHeader('X-Shopify-Storefront-Access-Token', accessToken);
        req.onError(function(errorEvent) {
            callback('Error: Request failed', null);
        });
        req.onTimeout(function(event) {
            callback('Error: Request timed out', null);
        });
        req.loadAsObject(function(data : Obj) {
            if (data.exists('errors')) {
                return callback(data['errors'], null);
            }
            else {
                if (extractor != null) {
                    data = Obj.fromDynamic(data.extract( extractor ));
                }
                if (transform != null) {
                    return callback(null, transform( data ));
                }
                else {
                    return callback(null, data);
                }
            }
        });
        req.send( query );
    }

    /**
      * send a graphql Document
      */
    public function send<T>(document:Document, ?extractor:String, ?transform:Obj->T, ?done:Cb<T>):Null<Promise<T>> {
        var query:String = document.print( true );
        //tannus.html.Win.current.expose('lastGraphQlQuery', query);
        return sendgql(query, extractor, transform, done);
    }

    /**
      * create and send a Document
      */
    public function query<T>(builder:Operation->Void, ?extractor:String, ?transform:Obj->T, ?done:Cb<T>):Null<Promise<T>> {
        var doc = createDocument();
        var query = doc.query( builder );
        return send(doc, extractor, transform, done);
    }

    /**
      * create and send a Mutation
      */
    public function mutation<T>(name:String, oargs:Object, builder:Mutation->Void, ?extractor:String, ?transform:Obj->T, ?done:Cb<T>):Null<Promise<T>> {
        var doc = createDocument();
        var mut = doc.mutation(name, oargs, builder);
        return send(doc, extractor, transform, done);
    }

    /**
      * create and return a new Document
      */
    public function createDocument():Document {
        return new Document();
    }

/* === Instance Fields === */

    private var accessToken : String;
    private var storefrontName : String;
}
