<div class = "wrapper">
  <div class="content">


    
    
    
    <h1 id="featuresTitle"> </h1>
    <div id="featureContainer" >
      <p id="featuresLabel1">  </p>
      <p id="featuresLabel2">  </p>
      <p id="featuresLabel3">  </p>
      <p id="featuresLabel4">  </p>
       

       
        <?php if(isset($events)): ?>
        <div>
           
            <h2>Recent Activity</h2>

              <?php if(count($events) == 0): ?>
            <p >No recent activity.</p>
              <?php else: ?>

            <ul class="list-holder">
              <?php foreach($events as $event): ?>
                <li><?= formatEvent($event) ?></li>
              <?php endforeach; ?>
            </ul>

              <?php endif; ?>

             <?php else: ?>

            <?php endif; ?>

        </div>
    </div>

    <img id="mainImage" src="" alt="UniHome"></img>

  </div>

</div>
