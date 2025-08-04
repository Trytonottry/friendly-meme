moveTo(x, y) ;{
    this.nodes[0].updateRelative(true,true);
    let dist = ((x - this.end.x)**2+(y-this.end.y)**2)**0.5;
    let len = Math.max(0, dist - this.speed);
    for (let i = this.nodes.length - 1; i >= 0; i--) {
        let node = this.nodes[i];
        let ang = Math.atan2(node.y - y, node.x - x);
        node.x = x+len*Math.cos(ang);
        node.y = y+len*Math.sin(ang);
        x=node.x; y=node.y; len=node.size;
    }
update(); {this.moveTo(Input.mouse.x, Input.mouse.y)}
}