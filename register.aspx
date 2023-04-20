<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Instagram</title>
       <link rel="stylesheet" href="./assets/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' ></script>
        <style>
            ul{
                  list-style: none;
                  text-align: center;
                  margin-bottom: 10px;
            }
            ul > li{
                 display: inline;
                 color: #8e9096;
            }

            ul > li >a{
                text-decoration: none;
                font-weight: bold;
                color: #8e9096;
            }
            .fb-logo {
                font-size:20px;
                width: inherit;
                padding: 0px 0px;
                border-radius: 5px;
                border: none;
                background-color: #ffffff;
                color: #0099f6;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <main class="flex align-items-center justify-content-center">
            <section id="mobile" class="flex">
            </section>
            <section id="auth" class="flex direction-column">
                <div class="panel login flex direction-column">
                    <h1 title="Instagram" class="flex justify-content-center">
                        <img src="./assets/imgs/instagram-logo.png" alt="Instagram logo" title="Instagram logo" />
                    </h1>
                    <form>
                        <label for="name" class="sr-only">Name</label>
                        <asp:TextBox ID="TextBox1" runat="server" name="name" placeholder="Name" ></asp:TextBox>

                        <label for="number" class="sr-only">Phone Number</label>
                        <asp:TextBox ID="TextBox2" runat="server" name="number" placeholder="Phone Number" ></asp:TextBox>

                        <label for="username" class="sr-only">Username</label>
                        <asp:TextBox ID="TextBox3" runat="server" name="username" placeholder="Username" ></asp:TextBox>

                        <label for="email" class="sr-only">Email</label>
                        <asp:TextBox ID="TextBox4" runat="server" name="email" placeholder="Email" ></asp:TextBox>

                        <label for="password" class="sr-only">Password</label>
                        <asp:TextBox ID="TextBox5" runat="server" name="password" type="password" placeholder="Password" ></asp:TextBox>

                        <asp:Button class="form-button" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click"></asp:Button>
                        <br />
                        <ul>
                          <li>By signing up, you agree to our</li>
                          <li><a href="">Terms</a></li>
                          <li><a href="">Data Policy</a></li>
                          <li>and</li>
                          <li><a href="">Cookies Policy</a> .</li>
                       </ul>
      
                    </form>
                    <br />
                    <div class="flex separator align-items-center">
                        <span></span>

                        <div class="or">OR</div>
                        <span></span>
                    </div>
                    <div class="login-with-fb flex direction-column align-items-center">
                        <div>
                            <img />
                            <i class="fab fa-facebook-square fb-logo" ></i>
                            <a>Log in with Facebook</a>
                        </div>
                    </div>
                </div>
                <div class="panel register flex justify-content-center">
                    <p>Already have an account?</p>
                    
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Log In</asp:LinkButton>
                </div>
                <div class="app-download flex direction-column align-items-center">
                    <p>Get the app.</p>
                    <div class="flex justify-content-center">
                        <img src="./assets/imgs/apple-button.png"      alt="Imagem com a logo da Apple Store" title="Imagem com a logo da Apple Store" />
                        <img src="./assets/imgs/googleplay-button.png" alt="Imagem com a logo da Google Play" title="Imagem com a logo da Google Play" />
                    </div>
                </div>
            </section>
        </main>
        <footer>
            <ul class="flex flex-wrap justify-content-center">
                <li><a href="#">About us</a></li>
                <li><a href="#">Support</a></li>
                <li><a href="#">Press</a></li>
                <li><a href="#">Api</a></li>
                <li><a href="#">Jobs</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Directory</a></li>
                <li><a href="#">Profiles</a></li>
                <li><a href="#">Hashtags</a></li>
                <li><a href="#">Languages</a></li>
            </ul>
            <p class="copyright">© 2023 Instagram | Meta</p>
        </footer>
    </div>
    </form>
</body>
</html>
