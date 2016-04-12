var bBoxer = {};

bBoxer.getDocBBox = function getDocBBox(selector) {
  var nodeList = document.querySelectorAll(selector);
  return Array.prototype.slice.call(nodeList).reduce(function(memo, node) {
    if (!node.getBBox) { return memo; }
    return bBoxer.getBBoxUnion(memo, node.getBBox());
  }, { xMin: Number.MAX_VALUE, yMin: Number.MAX_VALUE, xMax: Number.MIN_VALUE, yMax: Number.MIN_VALUE });
};

bBoxer.getBBoxUnion =function getBBoxUnion(memo, bBox) {
  var union = {};
  union.xMin = Math.min(memo.xMin, bBox.x);
  union.yMin = Math.min(memo.yMin, bBox.y);
  union.xMax = Math.max(memo.xMax, bBox.x + bBox.width);
  union.yMax = Math.max(memo.yMax, bBox.y + bBox.height);
  return union;
};

bBoxer.setViewBoxToBBox =function setViewBoxToBBox(node, bBox) {
  var newViewBox = [
    bBox.xMin,
    bBox.yMin,
    bBox.xMax - bBox.xMin,
    bBox.yMax - bBox.yMin
  ].join(" ");

  node.setAttribute("viewBox", newViewBox);
  node.setAttribute("preserveAspectRatio", "xMidYMid meet");
  node.setAttribute("width", "100%");
  node.setAttribute("height", "100%");
};

bBoxer.run = function run() {
  var bbox = bBoxer.getDocBBox("svg *");
  var svg = document.querySelector("svg");
  bBoxer.setViewBoxToBBox(svg, bbox);
};

bBoxer.run();
