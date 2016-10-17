
<div class = "wrapper">

  <!-- Main Content -->
  <div class="itemContent">

    <!-- Extra navigation to go back -->
    <div class="backContainer">
      <a id="backNavigator" href="../">For Sale</a>
      <p id="itemPageItemTitle">> <?= $post['title'] ?></p>
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

      <h3> Description </h3>

      <p id="itemDescription" class="itemDescription"><?= $post['description'] ?> </p>


      <div id="contactContainer">
        <p id="itemContactPerson1" class="itemContactPerson"> <?= $contactInfo['name'] ?>  </p>
        <p id="itemContactPerson2" class="itemContactPerson"> <?= $contactInfo['email'] ?>  </p>
        <p id="itemContactPerson3" class="itemContactPerson"> <?= $contactInfo['phone'] ?>  </p>
      </div>

    </div>

  </div>

</div>

</div>