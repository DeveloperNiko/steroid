{$meta_title = $btr->simplamarket__wholesale_prices__title|escape scope=global}

{*Название страницы*}
<div class="row">
    <div class="col-lg-12 col-md-12">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->simplamarket__wholesale_prices__title|escape}
            </div>
        </div>
    </div>
</div>

<div class="alert alert--icon">
    <div class="alert__content">
        <div class="alert__title">{$btr->general_module_description|escape}</div>
        <p>{$btr->simplamarket__wholesale_prices__description_1}</p>
        <p>{$btr->simplamarket__wholesale_prices__description_2}</p>
        <p>{$btr->simplamarket__wholesale_prices__description_3}</p>
    </div>
</div>

<div class="alert alert--icon alert--info">
    <div class="alert__content">
        <div class="alert__title">{$btr->general_module_instruction|escape}</div>
        <p>{$btr->simplamarket__wholesale_prices__instruction}</p>
    </div>
</div>

<div class="row">
    <div class="col-xs-8">
        <div class="boxed">
            <div style="margin: 10px 0;">
                <a style="display: inline-block;vertical-align: middle;margin: 0 10px 10px 0;" href="{$rootUrl}/Okay/Modules/SimplaMarket/WholesalePrices/Backend/design/images/wholesale_discount.png">
                    <img style="max-height: 120px" src="{$rootUrl}/Okay/Modules/SimplaMarket/WholesalePrices/Backend/design/images/wholesale_discount.png">
                </a>
                <a style="display: inline-block;vertical-align: middle;margin: 0 10px 10px 0;" href="{$rootUrl}/Okay/Modules/SimplaMarket/WholesalePrices/Backend/design/images/wholesale_discount_front.png">
                    <img style="max-height: 120px" src="{$rootUrl}/Okay/Modules/SimplaMarket/WholesalePrices/Backend/design/images/wholesale_discount_front.png">
                </a>
            </div>
            <h3>{$btr->simplamarket__module__code|escape}:  <a href="" class="fn_clipboard hint-bottom-middle-t-info-s-small-mobile" data-hint="Click to copy" data-hint-copied="✔ Copied to clipboard">{literal}{wholesale_discount_list}{/literal}</a>
            </h3>
        </div>
    </div>
    <div class="col-xs-4">
        <div class="alert alert--icon alert--warning">
            <div class="alert__content">
                <div class="alert__title">{$btr->general_module_notice|escape}</div>
                <p>{$btr->simplamarket__wholesale_prices__notice}</p>
            </div>
        </div>
    </div>

</div>

<script>
    sclipboard();
</script>

