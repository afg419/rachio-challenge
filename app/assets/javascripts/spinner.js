var make_it_spin = function(id) {
  var opts = {
    lines: 7,
    length: 6,
    width: 14,
    radius: 0,
    scale: 1.75,
    corners: 1,
    color: 'rgb(0,0,0)',
    opacity: 0,
    rotate: 0,
    direction: 1,
    speed: 2.2,
    trail: 100,
    fps: 20,
    zIndex: 2e9,
    className: 'spinner',
    top: '0%',
    left: '30%',
    shadow: false,
    hwaccel: false,
    position: 'relative'
  };

  var target = document.getElementById(id);
  var spinner = new Spinner(opts).spin(target);
};

var stop_spins = function(id){
  $('#' + id).empty();
};
