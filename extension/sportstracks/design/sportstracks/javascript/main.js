
$(function(){
   prependDate($(".job-message div span"));
});



function prependDate(elementToPrependDateTo){
    var event = new Date();
    var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    elementToPrependDateTo.prepend(''+event.toLocaleDateString($('body').data('locale'))+' ');
    //console.log(event.toLocaleDateString($('body').data('locale'), options));
}

