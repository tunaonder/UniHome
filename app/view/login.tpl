  <!-- All content is wrapped in a div -->
  <div class="mainContent">


      <div class="centeredContent" >

        <form id="login" action="<?= BASE_URL ?>/login/process" onSubmit="return userLogin();" method="POST">

          <div class="lineContainer">
            <label>Email: </label>
            <input id="emailInput" type="text" name="uEmail">
          </div>

          <div class="lineContainer">
            <label>Password: </label>
            <input id="passwordInput" type="password" name="uPw">
          </div>


          <button id="headerButton1" class="contentButton" type="submit" >Login!</button>
          <button id="headerButton2" class="contentButton" type="button" onClick="changePage('home');">Cancel</button>

        </form>





      </div>

      <div id="alertContainer" ></div>


  </div>
