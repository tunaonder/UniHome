<!-- PS4 IMAGE SOURCE: http://money.cnn.com/video/technology/2013/12/06/t-sony-playstation-4-ps4-review.cnnmoney/
VTTSHIRT IMAGE SOURCE: http://basketballchoices.com/?cat=40
IPHONE IMAGE SOURCE: http://truza.com/technology
Coffe Machine Image Source: http://arbtalk.co.uk/forum/general-chat/51766-what-s-best-home-coffee-machine-8.html
Drawer Image Source: http://home.50kz.com/second-hand-furniture-cork/
Shoe Image Source: http://winnischneider.com/textil-recycling/blog/shoes-grade-a/ -->


<div class = "wrapper item-list">

  <!-- Main Content -->
  
      
      <?php if($pageName == 'For Sale'): ?>

<form id="editItemForm" method="POST" action="<?= BASE_URL ?>/post/editTitle/">
  <label>Edit Title: <input type="text" id="editTitle" name="title" value=""></label>
  <input  type="hidden" id="editID" name="postID" value="">
  <input  id="editButton" class="clickable" type="submit" name="submit" value="Edit">
  <button id ="deleteButton" class="clickable" type="submit" name="delete" value="">Delete</button>
  <button id="createButton" class="clickable" type="submit" name="create" >Create</button>
  <button id="cancelEdit" class="clickable" type="button" name="cancel">Cancel</button>
  </form>
  <form action="<?= BASE_URL ?>/yourPosts/delete/<?= $row['id'] ?>" method="POST" onsubmit="return deleteConfirmation();">
  
 



       <div class="dataViz-container">
         <script type="text/javascript" src="<?= BASE_URL ?>/public/js/vizData.js"></script>
      </div>
  
  
  <?php endif; ?>
  <div id="listContent" >

 
    
       
    <!-- Fetch each row from the result and create div and its components for each post in the database -->
    <?php while($row = mysql_fetch_assoc($result)): ?>


      <a href="<?= BASE_URL ?>/forSale/view/<?= $row['id'] ?>">
        <div class="col-1">
          <img src="<?= BASE_URL ?>/app/uploads/<?= $row['photoInfo'] ?>" alt="<?= $row['title'] ?>" />

          <div class = "listItemInfo">
            <label class="listItemTitle clickable"><?= $row['title'] ?></label>
            <label class="listItemPrice clickable">$<?= $row['price'] ?></label>
          </div>
        </a>

      </div>

    <?php endwhile; ?>


  </div>

</div>
