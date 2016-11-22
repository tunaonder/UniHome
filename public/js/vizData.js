
$(document).ready(function () {

var width = 960,
    height = 700,
    radius = (Math.min(width, height) / 2) - 10;

var formatNumber = d3.format(",d");  // d:decimal notation rounded to integer

var stratify = d3.stratify().parentId(function(d) { return d.id.substring(0, d.id.lastIndexOf(".")); });

var x = d3.scaleLinear()
    .range([0, 2 * Math.PI]);

var y = d3.scaleSqrt().range([0, radius]);

var color = d3.scaleOrdinal(d3.schemeCategory20);

var partition = d3.partition();

var arc = d3.arc()
    .startAngle(function(d) {  return Math.max(0, Math.min(2 * Math.PI, x(d.x0))); })
    .endAngle(function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x1))); })
    .innerRadius(function(d) { return Math.max(0, y(d.y0)); })
    .outerRadius(function(d) { return Math.max(0, y(d.y1)); });

var svg = d3.select(".wrapper").append("svg").classed("dataViz-container", true)
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + (height / 2) + ")");

d3.json(baseURL+'/post/vizData').get( function(error, root) {
  if (error) throw error;

    root = d3.hierarchy(root);
    console.log(root);
    
    root.sum(function(d){return d.size; });
  var path = svg.selectAll("path")
      .data(partition(root).descendants())
    .enter().append("g");
    path.append("path").attr("d", arc)
      .style("fill", function(d) { return  color((d ? d : d.parent).data.name); })//d.children
      .on("click", click);
    
    var text = path.append("text")
      .attr("transform", function(d) { return "rotate(" + computeTextRotation(d) + ")";})
      .attr("x", function(d){return y(d.y0);})
      .attr("dx","6")
      .attr("dy",".35em")
      .text(function(d) { return d.data.name;});
    
   var title= path.append("title")
      .text(function(d) { return d.data.name + "\n" + formatNumber(d.value); });

    function click(d) {
   // console.log(text);
   text.transition().attr("opacity", 0); 
    
  svg.transition()
      .duration(750)
      .tween("scale", function() {
        var xd = d3.interpolate(x.domain(), [d.x0, d.x1]),
            yd = d3.interpolate(y.domain(), [d.y0, 1]),
            yr = d3.interpolate(y.range(), [d.y0 ? 20 : 0, radius]);
        return function(t) { x.domain(xd(t)); y.domain(yd(t)).range(yr(t)); };

      })
    .selectAll("path")
      .attrTween("d", function(d) { return function() { return arc(d); }; })
      .on("end", function(e, i){
      console.log("e " + e.x0);
      console.log("d0 " + d.x0);
      console.log("d1 " + d.x1);
      console.log(e.data.name);
      console.log(d.data.name);
      if (e.x0 >= d.x0 && e.x0 < d.x1){
          
          var arcText = d3.select(this.parentNode).select("text");
          arcText.transition().duration(750)
          .attr("opacity", 1)
          .attr("transform", function() { return "rotate(" + computeTextRotation(e) + ")"})
          .attr("x", function(d) { return y(d.y0);})
          ;
      }
  });
}
});
    
    d3.select(self.frameElement).style("height", height + "px");
    function computeTextRotation(d)
    {
        var value = d.x0 + (d.x1 - d.x0)/2
        return (x(value) - Math.PI / 2) / Math.PI * 180;

    }
    
})