{if $purchase->wholesale_discount_value > 0}
    <link rel="stylesheet" href="{$rootUrl}/Okay/Modules/SimplaMarket/WholesalePrices/Backend/design/css/wholesale_price.css">
    <div class="tag-discount">{$btr->simplamarket__wholesale_discount_label}: {$purchase->wholesale_discount_value} {if $purchase->wholesale_discount_type == 'percentage'}%{else}{$currency->sign}{/if}</div>
{/if}