// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require data-confirm-modal




$(document).ready(function( $ ) {

    // Smooth scroll for the menu and links with .scrollto classes
    $('.smoothscroll').on('click', function(e) {
        e.preventDefault();
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            if (target.length) {

                $('html, body').animate({
                    scrollTop: target.offset().top - 70
                }, 1500, 'easeInOutExpo');
            }
        }
    });

    $(".navbar-collapse a").on('click', function() {
        $(".navbar-collapse.collapse").removeClass('in');
    });

    // Javascript Chart
    if($('#javascript').length) {

        var doughnutData = [{
            value: 70,
            color: "#74cfae"
        },
            {
                value: 30,
                color: "#3c3c3c"
            }
        ];
        var myDoughnut = new Chart(document.getElementById("javascript").getContext("2d")).Doughnut(doughnutData);
    };

    // Bootstrap Chart
    if($('#bootstrap').length) {
        var doughnutData = [{
            value: 90,
            color: "#74cfae"
        },
            {
                value: 10,
                color: "#3c3c3c"
            }
        ];
        var myDoughnut = new Chart(document.getElementById("bootstrap").getContext("2d")).Doughnut(doughnutData);
    }

    // WordPress Chart
    if($('#wordpress').length) {
        var doughnutData = [{
            value: 55,
            color: "#74cfae"
        },
            {
                value: 45,
                color: "#3c3c3c"
            }
        ];
        var myDoughnut = new Chart(document.getElementById("wordpress").getContext("2d")).Doughnut(doughnutData);
    }

    // Photoshop Chart
    if($('#photoshop').length) {
        var doughnutData = [{
            value: 80,
            color: "#74cfae"
        },
            {
                value: 20,
                color: "#3c3c3c"
            }
        ];
        var myDoughnut = new Chart(document.getElementById("photoshop").getContext("2d")).Doughnut(doughnutData);
    }
});
