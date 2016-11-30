
<div class = "wrapper">

  <!-- Main Content -->
  <div class="itemContent">

    <!-- Extra navigation to go back -->
    <div class="backContainer">
      <a id="backNavigator" href="../">For Sale></a>
      <p id="itemPageItemTitle"> <?= $post['title'] ?></p>
    </div>

    <div class="itemTitleContainer">
      <h2><?= $post['title'] ?></h2>
    </div>

    <!-- Item Image Will be displayed on the left side -->
    <img id="itemImage" src="<?= BASE_URL ?>/app/uploads/<?= $post['photoInfo'] ?>" alt="Image Does not Exist" >


    <!-- Other content will be on the right -->
    <div class="rightBlockContainer">

      <div class="itemFeaturesContainer">

        <!-- Left side of the item Feature area showing static content -->
        <div class="innerFeaturesContainer">
          <div class="itemLineContainer">
            <label>Price: </label>
          </div>

          <div class="itemLineContainer">
            <label>Condition: </label>
          </div>

          <div class="itemLineContainer">
            <label>Type: </label>
          </div>

        </div>
        <!-- Right side of the item Feature are display dynamic content that chanes according to item -->
        <div class="innerFeaturesContainer2">
          <div class="itemLineContainer">
            <label id="itemPrice"> $<?= $post['price'] ?> </label>
          </div>

          <div class="itemLineContainer">
            <label id="itemCondition"> <?= $post['conditionInfo'] ?> </label>
          </div>

          <div class="itemLineContainer">
            <label id="itemDelivery"> <?= $post['type'] ?> </label>
          </div>

        </div>
      </div>

      <h3> Description: </h3>
      <p id="itemDescription" class="itemDescription"><?= $post['description'] ?> </p>

      <h3> Address: </h3>
      <p id="itemAddress" class="itemDescription"><?= $post['address'] ?> </p>


      <div id="map"></div>
      <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvzbGNUXp2lX_QOiX8LjIW144pggtYcQ8&callback=initMap">
      </script>

      <input type="hidden" id="postId" value="<?= $post['id'] ?>">

      <p id="favInfo" style="display: none"> Item is in Your Favorite List </p>

      <button id="favButton" type="button" onClick="addToFavs();" style="display: <?= $favButtonStyle ?>">Add to Favorites</button>


      <div id="contactContainer">
        <?php
        if(isset($_SESSION['userEmail'])) {
          $contactId = $p->get('creator_id');
          $contact =   User::loadById($contactId);
          $contactEmail = $contact->get('email');

        } else {
          $contactEmail = null;
        }

        $followButton = getFollowButton($contactEmail);
        ?>
        <p id="itemContactPerson1" class="itemContactPerson"> <?= $contactInfo['name'] ?>  </p>
        <p id="itemContactPerson2" class="itemContactPerson"> <?= $contactInfo['email'] ?>  </p>
        <p id="itemContactPerson3" class="itemContactPerson"> <?= $contactInfo['phone'] ?>  </p>

      </div>

      <p id="follow" >
        <?= $followButton ?>
        <p id="followInfo" style="display: none"> You're following <?= $contactEmail ?>  </p>

      </p>

    </div>

  </div>

</div>

</div>
