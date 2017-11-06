package shopify.buy_ext;

import shopify.buy.ProductQueryModel.QuerySort;

typedef CollectionModel = {
    attrs: CollectionModelAttrs
}

typedef CollectionModelAttrs = {
    body_html: String,
    collection_id: Int,
    handle: String,
    published_at: String,
    updated_at: String,
    sort_order: QuerySort,
    title: String
}
