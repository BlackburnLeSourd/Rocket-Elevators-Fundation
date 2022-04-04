function filterAll(){
    $(".corporate").attr("hidden", false);
    $(".residential").attr("hidden", false);
    $(".award").attr("hidden", false);

}

function filterCorporate(){
    $(".corporate").attr("hidden", false);
    $(".residential").attr("hidden", true);
    $(".award").attr("hidden", true);
}

function filterResidential(){
    $(".corporate").attr("hidden", true);
    $(".residential").attr("hidden", false);
    $(".award").attr("hidden", true);
}

function filterAward(){
    $(".corporate").attr("hidden", true);
    $(".residential").attr("hidden", true);
    $(".award").attr("hidden", false);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
  }

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("slide");
    var dots = document.getElementsByClassName("slider__navlink");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
  }