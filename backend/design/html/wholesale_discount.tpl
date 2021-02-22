<div class="boxed col-md-6" style="padding: 10px;">
    <div class="heading_box" style="margin-bottom: 30px;">
        <div style="display: inline-block">{$btr->wholesale_discounts_title|escape}</div>

        <label class="switch_label">
            {$btr->wholesale_discounts_enable|escape}
            <i class="fn_tooltips" title="{$btr->tooltip_wholesale_discounts_enable|escape}">
                {include file='svg_icon.tpl' svgId='icon_tooltips'}
            </i>
        </label>
        <label class="switch switch-default">
            <input class="switch-input" name="wholesale_discount_enabled" value='1' type="checkbox" id="visible_checkbox" {if $product->wholesale_discount_enabled}checked=""{/if}/>
            <span class="switch-label"></span>
            <span class="switch-handle"></span>
        </label>

        <button type="submit" class="btn btn_small btn_blue float-md-right">
            {include file='svg_icon.tpl' svgId='checked'}
            <span>{$btr->general_apply|escape}</span>
        </button>
    </div>
    <div class="fn_card">
        <div class="boxed boxed_attention" style="margin-top: 15px">
            {$btr->discounts_warning}
        </div>
        <div class="heading_label">
            <select class="selectpicker" id="change_discount" >
                <option value="0">{$btr->order_print_product}</option>
                {foreach $product_variants as $v}
                    <option value="{$v->id}">{if $v->name}{$v->name|escape}{else}{$btr->discounts_variant} {$v->sku}{/if}</option>
                {/foreach}
            </select>
        </div>
        <div class="toggle_body_wrap on fn_card fn_discount active" id="discount_0" style="margin-top: 15px;">
            <div class="okay_list" style="padding: 10px;margin-bottom: 15px;">
                <div class="heading_box"><span style="font-size: 16px;">{$btr->discounts_settings_for_product}</span></div>
                <div class="okay_list_row" style="justify-content: space-around;">
                    <div class="okay_list_boding" style="padding: 3%;">
                        <div class="heading_label">{$btr->discounts_limit}</div>
                        <div class="input-group">
                            <select class="selectpicker  fn_discount_limit" name="wholesale_product_discount_limit_type" data-variant="0">
                                <option value="count" {if $product->wholesale_discount_limit_type == 'count'}selected=""{/if}>Количество {if $settings->units}({$settings->units|escape}){/if}</option>
                                <option value="total" {if $product->wholesale_discount_limit_type == 'total'}selected=""{/if}>Сумма({$currency->sign|escape})</option>
                            </select>
                        </div>
                    </div>
                    <div class="okay_list_boding" style="padding: 3%;">
                        <div class="heading_label">{$btr->discounts_type}</div>
                        <div class="input-group">
                            <select class="selectpicker fn_discount_type" name="product_discount_type" data-variant="0">
                                <option value="percentage" {if $discounts[0]->discount_type == 'percent'}selected="" {elseif !$discounts}selected=""{/if}>%</option>
                                <option value="absolute" {if $discounts[0]->discount_type == 'absolute'}selected=""{/if}>{$currency->sign|escape}</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" fn_discount_wrap">
                {foreach $discounts as $discount}
                    <div class="row discount_row clearfix fn_discount_list">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="discount_30 discount_left discount_part">
                                <span>{$btr->discounts_from}</span>
                            </div>
                            <div class="discount_35 discount_middle discount_part">
                                <input type="hidden" name="discounts[id][]" value="{$discount->id}">
                                <input class="discount_input" type="text" name="discounts[products_count][]" value="{$discount->products_count}"/>
                            </div>
                            <div class="discount_20 discount_right discount_part">
                                <span class="fn_text_discount_limit">{if $product->wholesale_discount_limit_type == 'total'}{$currency->sign|escape}{else}{$settings->units|escape}{/if}</span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="discount_30 discount_left discount_part">
                                <span>{$btr->general_discount}</span>
                            </div>
                            <div class="discount_35 discount_middle discount_part">
                                <input class="discount_input" type="text" name="discounts[discount_value][]" value="{$discount->discount_value}"/>
                            </div>
                            <div class="discount_20 discount_right discount_part">
                                <span class="fn_text_discount_type">{if $discount->discount_type == 'absolute'}{$currency->sign|escape}{else}%{/if}</span>
                            </div>
                        </div>
                        <span class="fn_delete_discount btn_close delete_discount ">
                        {include file='svg_icon.tpl' svgId='delete'}</span>
                    </div>
                {/foreach}
                <div class="fn_new_discount" data-variant="0">
                    <div class="row discount_row clearfix">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="discount_30 discount_left discount_part">
                                <span>{$btr->discounts_from}</span>
                            </div>
                            <div class="discount_35 discount_middle discount_part">
                                <input type="hidden" name="discounts[id][]" value="">
                                <input class="discount_input" type="text" name="discounts[products_count][]" value=""/>
                            </div>
                            <div class="discount_20 discount_right discount_part">
                                <span class="fn_text_discount_limit">{if $product->wholesale_discount_limit_type == 'total'}{$currency->sign|escape}{else}{$settings->units|escape}{/if}</span>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="discount_30 discount_left discount_part">
                                <span>{$btr->general_discount}</span>
                            </div>
                            <div class="discount_35 discount_middle discount_part">
                                <input class="discount_input" type="text" name="discounts[discount_value][]" value=""/>
                            </div>
                            <div class="discount_20 discount_right discount_part">
                                <span class="fn_text_discount_type">{if $discounts[0]->discount_type == 'absolute'}{$currency->sign|escape}{elseif !$discounts}%{else}%{/if}</span>
                            </div>
                        </div>
                        <span class="fn_delete_discount btn_close delete_discount ">
                            {include file='svg_icon.tpl' svgId='delete'}
                        </span>
                    </div>
                </div>
            </div>
            <div class="box_btn_heading mt-1">
                <button type="button" class="btn btn_mini btn-info fn_add_discount" data-variant="0">
                    {include file='svg_icon.tpl' svgId='plus'}
                    <span>{$btr->wholesale_discounts_add|escape}</span>
                </button>
            </div>
        </div>

        {foreach $product_variants as $variant}
            <div class="toggle_body_wrap on fn_card fn_discount" id="discount_{$variant->id}" style="margin-top: 15px;display: none;">
                <div class="okay_list" style="padding: 10px;margin-bottom: 15px;">
                    <div class="heading_box"><span style="font-size: 16px;">{$btr->discounts_settings_for_variant} {$variant->name}</span></div>
                    <div class="okay_list_row" style="justify-content: space-around;">
                        <div class="okay_list_boding" style="padding: 3%;">
                            <div class="heading_label">{$btr->discounts_limit}</div>
                            <div class="input-group">
                                <select class="selectpicker fn_discount_limit" name="variants_discounts[{$variant->id}][discount_limit_type][]"  data-variant="{$variant->id}">
                                    <option value="count" {if $variant->wholesale_discount_limit_type == 'count'}selected=""{/if}>Количество {if $variant->units}({$variant->units|escape}){elseif $settings->units|escape}({$settings->units}){/if}</option>
                                    <option value="total" {if $variant->wholesale_discount_limit_type == 'total'}selected=""{/if}>Сумма({$currency->sign|escape})</option>
                                </select>
                            </div>
                        </div>
                        <div class="okay_list_boding" style="padding: 3%;">
                            <div class="heading_label">{$btr->discounts_type}</div>
                            <div class="input-group">
                                <select class="selectpicker fn_discount_type" name="variants_discounts[{$variant->id}][discount_type]" data-variant="{$variant->id}">
                                    <option value="percentage" {if $variants_discounts[$variant->id][0]->discount_type == 'percentage'}selected=""{elseif !$variants_discounts}selected=""{/if}>%</option>
                                    <option value="absolute" {if $variants_discounts[$variant->id][0]->discount_type == 'absolute'}selected=""{/if}>{$currency->sign|escape}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fn_discount_wrap">
                    {foreach $variants_discounts[$variant->id] as $variant_discount}
                        <div class="row discount_row clearfix fn_discount_list">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="discount_30 discount_left discount_part">
                                    <span>{$btr->discounts_from}</span>
                                </div>
                                <div class="discount_35 discount_middle discount_part">
                                    <input type="hidden" name="variants_discounts[{$variant->id}][id][]" value="{$variant_discount->id}">
                                    <input class="discount_input" type="text" name="variants_discounts[{$variant->id}][variants_count][]" value="{$variant_discount->variants_count}"/>
                                </div>
                                <div class="discount_20 discount_right discount_part">
                                    <span class="fn_text_discount_limit">{if $variant->wholesale_discount_limit_type == 'total'}{$currency->sign|escape}{else}{$variant->units|escape}{/if}</span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="discount_30 discount_left discount_part">
                                    <span>{$btr->general_discount}</span>
                                </div>
                                <div class="discount_35 discount_middle discount_part">
                                    <input class="discount_input" type="text" name="variants_discounts[{$variant->id}][discount_value][]" value="{$variant_discount->discount_value}"/>
                                </div>
                                <div class="discount_20 discount_right discount_part">
                                    <span class="fn_text_discount_type">{if $variant_discount->discount_type == 'absolute'}{$currency->sign|escape}{else}%{/if}</span>
                                </div>
                            </div>
                            <span class="fn_delete_discount btn_close delete_discount">
                                {include file='svg_icon.tpl' svgId='delete'}
                            </span>
                        </div>
                    {/foreach}
                    <div class="fn_new_discount" data-variant="{$variant->id}">
                        <div class="row discount_row clearfix">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="discount_30 discount_left discount_part">
                                    <span>{$btr->discounts_from}</span>
                                </div>
                                <div class="discount_35 discount_middle discount_part">
                                    <input type="hidden" name="variants_discounts[{$variant->id}][id][]" value="">
                                    <input class="discount_input" type="text" name="variants_discounts[{$variant->id}][variants_count][]" value=""/>
                                </div>
                                <div class="discount_20 discount_right discount_part">
                                    <span class="fn_text_discount_limit">{if $variant->discount_limit_type == 'total'}{$currency->sign|escape}{else}{$variant->units|escape}{/if}</span>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="discount_30 discount_left discount_part">
                                    <span>{$btr->general_discount}</span>
                                </div>
                                <div class="discount_35 discount_middle discount_part">
                                    <input class="discount_input" type="text" name="variants_discounts[{$variant->id}][discount_value][]" value=""/>
                                </div>
                                <div class="discount_20 discount_right discount_part">
                                    <span class="fn_text_discount_type">{if $variants_discounts[$variant->id][0]->discount_type == 'absolute'}{$currency->sign|escape}{else}%{/if}</span>
                                </div>
                            </div>
                            <span class="fn_delete_discount btn_close delete_discount">
                                {include file='svg_icon.tpl' svgId='delete'}
                            </span>
                        </div>
                    </div>
                </div>
                <div class="box_btn_heading mt-1">
                    <button type="button" class="btn btn_mini btn-info fn_add_discount" data-variant="{$variant->id}">
                        {include file='svg_icon.tpl' svgId='plus'}
                        <span>{$btr->wholesale_discounts_add|escape}</span>
                    </button>
                </div>
            </div>
        {/foreach}
    </div>
</div>

{literal}
<script>

    // Добавление новой оптовой скидки
    let new_discounts = $(".fn_new_discount").clone(true),
        new_discount = {};

    $(".fn_new_discount").remove();
    new_discounts.each(function(){
        let id = $(this).data('variant');
        new_discount[id] = $(this);
        $(this).removeClass("fn_new_discount");
    });
    $(document).on("click",".fn_discount.active .fn_add_discount",function () {
        let id = $(this).data('variant');
        $(new_discount[id]).clone(true).appendTo(".fn_discount.active .fn_discount_wrap").fadeIn('slow');
        return false;
    });
    $(document).on("click",".fn_delete_discount",function () {
        $(this).parent().remove();
    });


    //Удаление оптовой скидки
    $(document).on("click",".fn_delete_discount",function () {
        $(this).closest(".fn_discount_list ").fadeOut(200);
        $(this).closest(".fn_discount_list ").remove();
    });
    $(document).on('change','#change_discount', function() {
        $('.fn_discount').hide().removeClass("active");
        $('#discount_'+$(this).find("option:selected").val()).show().addClass('active');
    });
    $(document).on('change','.fn_discount.active .fn_discount_type', function() {
        let variant = $(this).data('variant'),
            type;

        if ($(this).find("option:selected").val()=="absolute"){
            type = "{/literal}{$currency->sign|escape}{literal}";
        } else {
            type = "%";
        }

        $('.fn_discount.active').find('.fn_text_discount_type').text(type);
        $(new_discount[variant]).find('.fn_text_discount_type').text(type);
    });
    $(document).on('change','.fn_discount.active .fn_discount_limit', function() {
        let variant = $(this).data('variant'),
            limit;

        if ($(this).find("option:selected").val()=="total"){
            limit = "{/literal}{$currency->sign|escape}{literal}";
        } else {
            limit = "{/literal}{if $settings->units}{$settings->units|escape}{else}шт{/if}{literal}";
        }
        $('.fn_discount.active').find('.fn_text_discount_limit').text(limit);
        $(new_discount[variant]).find('.fn_text_discount_limit').text(limit);
    });

</script>
{/literal}

<style>

    .discount_20 {
        width: 20%;
    }
    .discount_30 {
        width: 30%;
    }
    .discount_35 {
        width: 35%;
    }

    .discount_part {
        display: inline-block;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        height: 34px;
        font-size: 14px;
        font-weight: 400;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .discount_right {
        padding: 5px 10px;
        color: #ffffff;
        background-color: rgba(118, 118, 118, 0.7);
        border-bottom-right-radius: 5px;
        border-top-right-radius: 5px;
        margin-right: 5px;
    }
    .discount_left {
        padding: 5px 10px;
        color: #ffffff;
        background-color: rgba(118, 118, 118, 0.7);
        border-bottom-left-radius: 5px;
        border-top-left-radius: 5px;
        margin-left: 5px;
    }
    .discount_middle {
        display: inline-block;
    }
    .discount_middle .discount_input {
        padding: 5px 10px;
        width: 100%;
        font-size: 14px;
        color: #607d8b;
        transition: border-color ease-in-out 0.15s,
        box-shadow ease-in-out 0.15s;
        background: #f7f7f7;
        height: 34px;
        font-weight: 400;
        border: 1px solid transparent;
    }
    .discount_input:focus {
        border-color: rgba(118, 118, 118, 0.7);
        background: #fff;
        border-radius: 0px 5px 5px 0px;
    }
    .discount_row {
        position:relative;
    }
    .delete_discount {
        position:absolute;
        top: 0;
        right: 20px;
    }
    .btn_close.delete_discount svg{
        margin-top: 10px;
        height: 10px;
        width: 10px;
        color: #848484;
    }

</style>