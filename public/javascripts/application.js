$(function() {
    $("#phrases td a, #phrases .pagination a").live("click", function() {
        $.getScript(this.href);
        return false;
    });
});