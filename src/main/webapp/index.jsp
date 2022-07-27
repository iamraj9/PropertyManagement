<%@page contentType="text/html" pageEncoding="UTF-8" %> <%
if(session.getAttribute("ActiveUser")!=null){
response.sendRedirect("userPage.jsp"); } %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Infinite Project 8</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="style.css" />
    <script src="script.js"></script>
  </head>
  <body>
    <input type="hidden" id="SignUpStatus" value="<%=
    request.getAttribute("signupstatus") %>" > <input type="hidden"
    id="signInStatus" value="<%= request.getAttribute("signInStatus") %>" >
    <div style="min-height: 100%">
      <div class="row stranger">
        <div class="col-md-5">
          <h1 class="text-danger">Online Property Management System</h1>

          <h4>
            We are here to provide you Genuine verified Property in your
            preffered location. Millions of users across india trust us.
          </h4>
          <h3>Buy , Sell, Rent, Lease .</h3>
        </div>
        <div class="col-md-4">
          <div class="card login shadow p-3 mb-5 bg-white rounded">
            <div class="card-body">
              <form method="post" action="signIn">
                <div>Login Using Email ID</div>
                <hr />
                <div class="form-group">
                  <input
                    class="form-control"
                    formControlName="email"
                    name="email"
                    placeholder="xyz@gmail.com"
                    style="width: 100%"
                  />
                </div>
                <br />
                <div class="form-group">
                  <input
                    type="password"
                    class="form-control"
                    formControlName="password"
                    name="password"
                    placeholder="Password"
                    style="width: 100%"
                  />
                </div>
                <br />
                <input
                  type="submit"
                  style="width: 100%"
                  class="btn btn-lg align-center btn-danger"
                  value="Login"
                />
              </form>
              <hr />
              <button
                style="margin: 0 auto; display: block"
                onclick="close_signup()"
                class="btn btn-lg align-center btn-primary"
              >
                Create Account
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- ============   Sign Up Pop up  ================ -->
      <div id="signup_pop" class="signup_page hide">
        <div style="width: 500px">
          <div class="card login shadow p-3 mb-5 bg-white rounded">
            <div class="card-body">
              <form method="post" action="loginServlet">
                <div style="display: flex; justify-content: space-between">
                  <div>
                    <h2>Sign Up</h2>
                    <p>It's quick and easy.</p>
                  </div>
                  <div>
                    <button
                      type="button"
                      class="btn-close"
                      onclick="close_signup()"
                      aria-label="Close"
                    ></button>
                  </div>
                </div>
                <hr />

                <div class="form-group flex">
                  <input
                    class="form-control"
                    type="text"
                    name="Cfname"
                    style="width: 48%"
                    required
                    placeholder="First Name"
                  />
                  <input
                    class="form-control"
                    required
                    type="text"
                    name="Clname"
                    style="width: 48%"
                    placeholder="Last Name"
                  />
                </div>
                <div class="form-group">
                  <input
                    required
                    class="form-control"
                    style="width: 100%"
                    type="tel"
                    name="Ccontact"
                    placeholder="Mobile no."
                  />
                </div>
                <div class="form-group">
                  <input
                    required
                    class="form-control"
                    formControlName="email"
                    type="email"
                    name="email"
                    placeholder="xyz@gmail.com"
                    style="width: 100%"
                  />
                </div>

                <div class="form-group" placeholder="dfgfh">
                  <select
                    class="form-control"
                    name="Cgender"
                    style="width: 100%"
                    required
                  >
                    <option disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                <div class="form-group">
                  <input
                    required
                    class="form-control"
                    style="width: 100%"
                    type="text"
                    name="Ccity"
                    placeholder="Preffered City"
                  />
                </div>

                <div class="form-group">
                  <input
                    required
                    type="password"
                    class="form-control"
                    type="password"
                    name="password"
                    formControlName="password"
                    placeholder="Password"
                    style="width: 100%"
                  />
                </div>
                <div class="form-group" placeholder="dfgfh">
                  <select
                    required
                    class="form-control"
                    name="utype"
                    style="width: 100%"
                  >
                    <option disabled selected>Select User Type</option>
                    <option value="1">Customer</option>
                    <option value="2">Owner</option>
                    <option value="3">Agent</option>
                  </select>
                </div>
                <br />
                <input
                  type="submit"
                  style="width: 100%"
                  class="btn btn-lg align-center btn-danger"
                  value="Create account"
                />
              </form>
              <hr />
              <button
                style="margin: 0 auto; display: block"
                onclick="close_signup()"
                class="btn btn-lg align-center btn-primary"
              >
                Log in
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css" />
    <script type="text/javascript">
      var Signupstatus = document.getElementById("SignUpStatus").value;
      if (Signupstatus == "success") {
        swal("Congrats", "Account Created Successfully", "success");
      }

      // =============login failed ===============
      var SignInstatus = document.getElementById("signInStatus").value;
      if (SignInstatus == "failed") {
        swal("Sorry", "Wrong Email Id or Password", "error");
      }
    </script>
  </body>
</html>
