// var primary_domain=window.location.hostname.split(".").splice(-2,2).join(".");
// console.log("I'm being called")
//  if (cookies[:id_rb]){
//     document.cookie = 'id_js=<%= cookies[:id_rb] %>; domain='+primary_domain+';path=/; expires=<%= (Time.zone.now + 30.days).utc.strftime("%a, %d %b %Y %H:%M:%S UTC") %>';
//  }
console.log("I'm being called");
(function(){
    function c(a){
        if (document.cookie.length > 0) {
            console.log("I'm being invoked.");
        }
        return ""
    }
})();