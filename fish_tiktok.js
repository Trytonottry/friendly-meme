function init() {
    document.addEventListener('mousemove', mousemove);
    setInterval(loop, 1000/fps);
}

function mousemove(e) {
    mouse = {x: e.clientX, y: e.clientY}
}

function loop() {
    for (var i = 0; i < parts.length; i++) {
        var params = {mouse:mouse, part:parts[i]};
        setTimeout(transform, parts[i].z2delay, params)
    };
    Element.innerHTML = svg();
}