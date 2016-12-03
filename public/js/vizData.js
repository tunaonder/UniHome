
$(document).ready(function () {



    //Get Used Id From HTML hidden value to set as a json request parameter
    var userId = $('#userId').val();
    var userType= $('#userType').val();


    if (userType == 'Admin')
    {

        drawSunBrust(baseURL+'/post/vizData');
        $('#post-item').hide();
        $('#post-item').submit(function(e)
        {
            e.preventDefault();
            var category = $('#category').val();
            var title = $('#createTitle').val();
            var describtion = $('#createDescription').val();
            var price = $('#createPrice').val();
            var type = $('#createItemType').val();
            var condition = $('#condition').val();
            console.log(category + title + describtion+ +price+ condition + type);
            $.post(
                baseURL+'/post/createTitle/process/',
                {
                    'category': category,
                    'title': title,
                    'description': describtion,
                    'price': price,
                    'type': type,
                    'conditionInfo': condition
                },
                function(data)
                {
                    if(data.postCreated == 'true')
                        {
                            drawSunBrust(baseURL+'/post/vizData'); // redraw viz
                            $('#createButton').text("Create");
                            $('#post-item').hide(); // hide create panel

                        } else if (data.error != '')
                        {
                            alert(data.error); // show error as popup
                        }
                },
                "json"
                );
        });


        $('#editItemForm').submit(function(e)
        {
            e.preventDefault(); // don't submit the form
            var title = $('#editTitle').val();
            var id = $('#editID').val();
            var describtion = $('#descriptionInput').val();
            var price = $('#priceInput').val();
            var type = $('#postItemType').val();
           $.post(
            baseURL+'/post/editTitle/process/',
            {
                'postTitle': title,
                'postID': id,
                'postDesc': describtion,
                'postPrice': price,
                'postType': type
            },
            function(data) {
                if(data.postEdited == 'true')
                {
                    drawSunBrust(baseURL+'/post/vizData'); // redraw viz
                    $('#editContainer').hide(); // hide edit panel
                } else if (data.error != '') {
                    alert(data.error); // show error as popup
                }
            },
            "json"
           );

        });

         //if delete button clicked delete Item
            $('#deleteItemForm').submit(function(e)
                {
                    e.preventDefault(); // don't submit the form

                    if (confirm("Are you sure you want to delete this post?") )
                    {
                        var id = $('#editID').val();
                        console.log(id);
                        $.post(
                            baseURL+'/post/delete/',
                            {
                                'pid': id
                            },
                            function(data)
                            {
                                if(data.postDeleted == 'true')
                                {
                                    // Edit successful
                                    $('#editContainer').hide(); // hide edit panel
                                    drawSunBrust(baseURL+'/post/vizData'); // redraw viz
                                } else if (data.error != '') {
                                    alert(data.error); // show error as popup
                                }
                            },
                            "json"
                        );
                      }
                        else
                      {
                        return false;
                      }
                });


        //enable save and cacel when button pushed
        $('#editButton').click(function ()     {
        if ($('.hidden-item').is(':visible'))
            {
               $('.hidden-item').hide();
               $('.disabled').attr("disabled", true);
            }
        else {
            $('.hidden-item').show();
               $('.disabled').attr("disabled", false);
        }


    }  );

        $('#createButton').click(function(){
            if ($('#post-item').is(':visible'))
                {
                   $('#createButton').text("Create");
                   $('#post-item').hide();
                }
            else {
                $('#createButton').text("Cancel");
                $('#post-item').show();
            }

        });
    }


function drawSunBrust(jsonURL) {

    $('svg').remove();

    var width  = 720,
        height = 525,
        radius = (Math.min(width, height) / 2) - 10;

    var formatNumber = d3.format(",d");  // d:decimal notation rounded to integer

    var stratify = d3.stratify().parentId(function(d) { return d.id.substring(0, d.id.lastIndexOf(".")); });

    var x = d3.scaleLinear()
        .range([0, 2 * Math.PI]);

    var y = d3.scaleSqrt().range([0, radius]);

    var color = d3.scaleOrdinal(d3.schemeCategory20);

    var partition = d3.partition();

    var arc = d3.arc()
        .startAngle (function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x0))); })
        .endAngle   (function(d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x1))); })
        .innerRadius(function(d) { return Math.max(0, y(d.y0)); })
        .outerRadius(function(d) { return Math.max(0, y(d.y1)); });

    var svg = d3.select(".wrapper").append("svg").classed("dataViz-container", true)
        .attr("width", width)
        .attr("height", height)
        .append("g")
        .attr("transform", "translate(" + width / 2 + "," + (height / 2) + ")");

    d3.json(jsonURL).get( function(error, root) {
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

        var text = path.append("a")
           .on("mouseover", function(d) { if (d.data.canEdit == 1) d3.select(this).classed("hovered", true);})
           .on("mouseout", function(d) { if (d.data.canEdit == 1) d3.select(this).classed("hovered", false);})
           .on("click", edit)
          .append("text")
          .attr("transform", function(d) { return "rotate(" + computeTextRotation(d) + ")";})
          .attr("x", function(d){return y(d.y0);})
          .attr("dx","6")
          .attr("dy",".35em")
          .text(function(d) { return d.data.name;})
           .classed("clickable", true);
        var title= path.append("title")
          .text(function(d) { if (d.data.canEdit == 1) return d.data.name; else return d.data.name + "\n" + formatNumber(d.value) });



        function edit(d) {
            if(d.data.canEdit == 1) {
                                if($('#editContainer').is(':visible')) {
                                  $('#editContainer').hide();
                                } else {
                                    $('#editTitle').val(d.data.name);
                                    $('#editID').val(d.data.postID);
                                    $('#descriptionInput').val(d.data.description);
                                    $('#postItemType').val(d.data.parent);
                                    $('#priceInput').val(d.data.price);
                                    $('#editContainer').show();
                                    $('.disabled').attr("disabled", true);
                                    if ($('.hidden-item').is(':visible')) {
                                        $('.hidden-item').hide();
                                    }
                                }
                            }
        }

        function click(d) {
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

    }
})
