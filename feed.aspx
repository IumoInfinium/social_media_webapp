<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feed.aspx.cs" Inherits="feed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
  <section class="main">
    <div class="wrapper">
      <div class="left-col">
      <%--  <div class="status-wrapper">
          <button class="story--scroll" id="scroll-left" onclick="scrollHorizontal(1)"><i
              class="fas fa-chevron-left"></i></button>
          <button class="story--scroll" id="scroll-right" onclick="scrollHorizontal(-1)"><i
              class="fas fa-chevron-right"></i></button>
          <div class="stories">
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-0.png" />
              </div>
              <p class="username">that.suman</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-1.jpg" />
              </div>
              <p class="username">debajyoti_r...</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-2.jpg" />
              </div>
              <p class="username">su1nta</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-3.jpg" />
              </div>
              <p class="username">lexfridman</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-4.jpg" />
              </div>
              <p class="username">golimitless</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-5.jpg" />
              </div>
              <p class="username">markrober</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-6.jpg" />
              </div>
              <p class="username">hubermanlab</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-8.jpg" />
              </div>
              <p class="username">waitbutwhy</p>
            </div>
            <div class="status-card">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-7.jpg" />
              </div>
              <p class="username">geeks_for_g...</p>
            </div>
          </div>
        </div>
      --%>
          <!-- Posts------------------------------------------- ---------------------- -->
          <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
          <asp:Repeater ID="feed_repeater" runat="server" >
                <ItemTemplate>
                    <asp:UpdatePanel ID="up" runat="server">
                        <ContentTemplate>
                    <div class="post">
                        <div class="info">
                            <div class="user">
                                <div class="status-pic">
                                    <asp:Image ID="Image1" runat="server" src="./assets/imgs/profile/status-7.jpg" alt="Profile Image" />
                                </div>
                                <p class="username">
                                    <asp:LinkButton class="link-remover" ID="LinkButton5" runat="server" Text='<%# Eval("postBy") %>'
                                        OnCommand="GoToProfile"
                                        CommandName="gotoprofile"
                                        CommandArgument='<%# Eval("postBy") %>'></asp:LinkButton>
                                </p>
                            </div>
                            <img src="./assets/imgs/nav-items/option.PNG" class="options" alt="Options" />
                        </div>
                        <div class="post-image-container">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("postURL") %>' class="post-image" alt="Geeks for Geeks post" />
                        </div>
                        <div class="post-content">
                            <div class="reaction-wrapper">
                                <asp:LinkButton ID="LinkButton1" runat="server"  OnCommand="LikePost_Btn" CommandName="like_post" CommandArgument='<%# Eval("postid") + "," + Eval("user_id") %>' >
                                    <asp:Image ID="Image3" ImageURL='<%#
                                                (Eval("likeCounts").ToString() != "") ?

                                                    (Convert.ToInt16(Eval("likeCounts").ToString()) == 0) ?
                                                        "./assets/imgs/heart.png"
                                                            :
                                                        "./assets/imgs/like.png"
                                                        :
                                                        "./assets/imgs/heart.png"
                                                 %>' class="icons" runat="server" />
                                </asp:LinkButton>
                                
                                <asp:LinkButton ID="LinkButton2" runat="server">
                                    <img src="./assets/imgs/nav-items/comment.PNG" class="icons" />
                                </asp:LinkButton>
                                
                                <asp:LinkButton ID="LinkButton3" runat="server">
                                    <img src="./assets/imgs/nav-items/send.PNG" class="icons" />
                                </asp:LinkButton>
                                
                                <asp:LinkButton ID="LinkButton4" runat="server" class="save icons">
                                    <img src="./assets/imgs/nav-items/save.PNG" class="save icons" />
                                </asp:LinkButton>

                            </div>
                            <p><%--Liked by 
                                <b>
                                    <asp:Label ID="Label2" runat="server" Text="su1nta"></asp:Label>
                                </b>
                                and--%>
                                
                                <b>

                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("likeCounts").ToString() != "" ? Eval("likeCounts") +" likes": "" %>'></asp:Label>
                                </b>

                            </p>
                            <p class="description">
                                <asp:LinkButton class="link-remover" ID="LinkButton6" runat="server" style="font-weight:bolder;" Text='<%#Eval("postBy") %>'
                                        OnCommand="GoToProfile"
                                        CommandName="gotoprofile"
                                        CommandArgument='<%# Eval("postBy") %>'></asp:LinkButton>
                                &nbsp;
                                <asp:Label ID="Label5" runat="server" style="font-weight:normal;" Text='<%# Eval("postContent") %>'></asp:Label>
                            </p>
                            <p class="no-comments">
                                <asp:Label ID="Label6" runat="server" Text="View all 45 comments"></asp:Label>
                            </p>
                            <p class="post-time">
                                <asp:Label ID="Label7" runat="server" Text=' <%#
                                    "Posted On " +
                                    DateTime.Parse(Eval("postOn").ToString()).ToString("dd/MM/yyyy HH:mm")
                                %>'></asp:Label>
                            </p>
                        </div>
          <!-- <hr /> -->
                          <div class="comment-wrapper">
                            <img src="./assets/imgs/nav-items/smile.PNG" class="icons" />
          
                              <asp:TextBox ID="TextBox1" runat="server" type="text" class="comment-box" placeholder="Add a comment..." >

                              </asp:TextBox>
              
                              <asp:Button ID="Button1" runat="server" Text="Post" class="comment-btn"/>
                          </div>
                    </div>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Command" />
                        </Triggers>
                            </asp:UpdatePanel>

                </ItemTemplate>
          </asp:Repeater>
        <%--<div class="post">
          <div class="info">
            <div class="user">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-10.jpg" alt="Profile Image" />
              </div>
              <p class="username">kurzgesagt</p>
            </div>
            <img src="./assets/imgs/nav-items/option.PNG" class="options" alt="Options" />
          </div>
          <img src="./assets/imgs/post/post-2.jpg" class="post-image" />
          <div class="post-content">
            <div class="reaction-wrapper">
              <img src="./assets/imgs/nav-items/like.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/comment.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/send.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/save.PNG" class="save icons" />
            </div>
            <p class="likes">4,316 likes</p>
            <p class="description">
              <span>kurzgesagt</span>Verified Which of these pins reminds you
              of your BBFF (best birb friend forever)?<br />
              Tag them below! <br />Psst: You can get these Friendship Enamel
              Pins from the official kurzgesagt friend shop. <br />🔗 Link in
              Bio
            </p>
            <p class="no-comments">View all 283 comments</p>
            <p class="post-time">2 DAYS AGO</p>
          </div>
          <div class="comment-wrapper">
            <img src="./assets/imgs/nav-items/smile.PNG" class="icons" />
            <input type="text" class="comment-box" placeholder="Add a comment..." />
            <button class="comment-btn">Post</button>
          </div>
        </div>
        <div class="post">
          <div class="info">
            <div class="user">
              <div class="status-pic">
                <img src="./assets/imgs/profile/status-8.jpg" alt="Profile Image" />
              </div>
              <p class="username">waitbutwhy</p>
            </div>
            <img src="./assets/imgs/nav-items/option.PNG" class="options" alt="Options" />
          </div>
          <img src="./assets/imgs/post/post-3.jpg" class="post-image" />
          <div class="post-content">
            <div class="reaction-wrapper">
              <img src="./assets/imgs/nav-items/like.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/comment.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/send.PNG" class="icons" />
              <img src="./assets/imgs/nav-items/save.PNG" class="save icons" />
            </div>
            <p class="likes">4,833 likes</p>
            <p class="description">
              <span>waitbutwhy</span>At the center of our planet is a solid
              sphere of iron and nickel the size of India (1,500mi across)
              that's as hot as the surface of the sun, and its interaction
              with the molten iron surrounding it generates the magnetic field
              that keeps our atmosphere from being blown away by the solar
              wind. It is a very important metal sphere.
            </p>
            <p class="no-comments">View all 45 comments</p>
            <p class="post-time">6 DAYS AGO</p>
          </div>
          <div class="comment-wrapper">
            <img src="./assets/imgs/nav-items/smile.PNG" class="icons" />
            <input type="text" class="comment-box" placeholder="Add a comment..." />
            <button class="comment-btn">Post</button>
          </div>
        </div>
        --%>
      </div>
      <div class="right-col">
        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/nav-items/user.png" />
          </div>
          <div>

              <asp:Label ID="Label8" runat="server" Text="" class="pro-user"></asp:Label>
            
              <asp:Label ID="Label9" runat="server" Text="" class="sub-text"></asp:Label>
          </div>
          <div class="action-div">
            <button class="action-btn" disabled>Switch</button>
          </div>
        </div>
        <div class="profile-card">
          <div>
            <p class="suggestion-text">Suggestions for you</p>
          </div>
          <div class="action-div">
            <button class="seeall-btn">See All</button>
          </div>
        </div>
        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/follow-img/follow-1.jpg" />
          </div>
          <div>
            <p class="pro-user">stoicarmy</p>
            <p class="sug-text">New to Instagram&nbsp;</p>
          </div>
          <div class="action-div">
            <button class="action-btn">Follow</button>
          </div>
        </div>

        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/follow-img/follow-2.jpg" />
          </div>
          <div>
            <p class="pro-user">visuallywise</p>
            <p class="sug-text">New to Instagram&nbsp;</p>
          </div>
          <div class="action-div">
            <button class="action-btn">Follow</button>
          </div>
        </div>

        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/follow-img/follow-3.jpg" />
          </div>
          <div>
            <p class="pro-user">veritasium</p>
            <p class="sug-text">Suggested for you</p>
          </div>
          <div class="action-div">
            <button class="action-btn">Follow</button>
          </div>
        </div>
        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/follow-img/follow-4.jpg" />
          </div>
          <div>
            <p class="pro-user">wisesages</p>
            <p class="sug-text">Suggested for you</p>
          </div>
          <div class="action-div">
            <button class="action-btn">Follow</button>
          </div>
        </div>
        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/follow-img/follow-5.jpg" />
          </div>
          <div>
            <p class="pro-user">lifedsn</p>
            <p class="sug-text">Suggested for you</p>
          </div>
          <div class="action-div">
            <button class="action-btn">Follow</button>
          </div>
          
        </div>
        <div class="quick-links-wrapper" style="padding-top:15px;">
          <div class="quick-link">About</div>
          <div class="quick-link">Help</div>
          <div class="quick-link">Press</div>
          <div class="quick-link">API</div>
          <div class="quick-link">Jobs</div>
          <div class="quick-link">Privacy</div>
          <div class="quick-link">Terms</div>
        </div>
        <div class="quick-links-wrapper">
          <div class="quick-link">Locations</div>
          <div class="quick-link">Language</div>
        </div>
        <div class="quick-links-wrapper" style="padding-top:10px;">
          <div class="quick-link">@ 2022 INSTAGRAM FROM META</div>
        </div>
      </div>
    </div>
  </section>

      <script>
          let currentScroll = 0;
          let scrollAmount = 320;

            const sCont = document.querySelector(".stories")
            const hScroll = document.querySelector(".status-wrapper")
            const leftButton = document.querySelector("#scroll-left")
            const rightButton = document.querySelector("#scroll-right")

            let maxScroll = -sCont.offsetWidth + hScroll.offsetWidth;
            leftButton.style.opacity = '0'

            function scrollHorizontal(val) {
                currentScroll += (val * scrollAmount);
                if (currentScroll >= 0) {
                    currentScroll = 0
                    leftButton.style.opacity = '0'
                } else {
                    leftButton.style.opacity = '1'
                }
                if (currentScroll <= maxScroll) {
                    currentScroll = maxScroll
                    rightButton.style.opacity = '0'
                } else {
                    rightButton.style.opacity = '1'
                }
                sCont.style.left = currentScroll + "px"
            }
  </script>
</asp:Content>