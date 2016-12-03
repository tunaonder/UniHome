<div class="wrapper">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">Sign In</div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="login" action="<?= BASE_URL ?>/login/process" onSubmit="return userLogin();" method="POST">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="emailInput" type="text" class="form-control" name="uEmail" value="" placeholder="Email">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="passwordInput" type="password" class="form-control" name="uPw" placeholder="Password">
                    </div>

                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">

                            <button id="headerButton1" class="btn btn-success" type="submit">Login</button>
                            <button id="headerButton2" class="btn btn-default" type="button" onClick="changePage('home');">Cancel</button>

                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
