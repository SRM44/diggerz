$("#md-sub-one").click(function () {

    $("#md-section-one").show();
    $("#md-section-two").hide();
    $(this).toggleClass('active-deals').siblings().removeClass('active-deals');

});

$("#md-sub-two").click(function () {

    $("#md-section-two").show();
    $("#md-section-one").hide();
    $(this).toggleClass('active-deals').siblings().removeClass('active-deals');
});
