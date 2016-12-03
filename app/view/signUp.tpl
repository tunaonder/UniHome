<div class="wrapper">
    <!-- Main Content -->
    <div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">Sign Up</div>
            </div>
            <div class="panel-body">
                  <form id="save-user" class="form-horizontal"  action="<?= BASE_URL ?>/signUp/saveUser" method="POST" onSubmit="return userSignUp();">
                    <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                        </div>
                    <div class="form-group">
                        <label for="userName" class="col-md-3 control-label">Full Name</label>
                        <div class="col-md-9">
                            <input id="signUpNameInput" type="text" class="form-control" name="userName" placeholder="Firstname Lastname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userEmail" class="col-md-3 control-label">University Email</label>
                        <div class="col-md-9">
                            <input id="signUpEmailInput" type="text" class="form-control" name="userEmail" placeholder="University Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPhone" class="col-md-3 control-label">Phone Number</label>
                        <div class="col-md-9">
                            <input id="signUpPhoneInput" type="text" class="form-control" name="userPhone" placeholder="Phone Number">
                        </div>
                    </div>

                    <div class="form-group">
                      <label class="col-md-3 control-label">Univeristy: </label>
                      <div class="col-md-9">
                        <select class="selectpicker" name="userUniversity">
                          <option value="Virginia Tech">Virginia Tech</option>
                          <option value="Radford University">Radford University</option>
                          <option value="New River College">New River College</option>
                          <option value="Roanoke College">Roanoke College</option>
                        </select>
                    </div>
                  </div>

                    <div class="form-group">
                        <label for="userPassword" class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <input id="signUpPasswordInput" type="password" class="form-control" name="userPassword" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="icode" class="col-md-3 control-label">Confirm Password</label>
                        <div class="col-md-9">
                            <input id="signUpConfirmInput" type="text" class="form-control" name="icode" placeholder="Confirm Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                          <button class="btn btn-info" type="submit" >Sign Up</button>
                          <button class="btn btn-default" type="button" onClick="changePage('home');">Cancel</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
