<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="post.aspx.cs" Inherits="post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .post-content-textbox {
            font-style: normal;
            border:0;
            font-size:1em;
            border-bottom : 1px solid gray;
            text-align:center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="main">
    <div class="wrapper">
      <div class="left-col">
    <div class="post">
                        <div class="info">
                            <div class="user">
                                <div class="status-pic">
                                    <asp:Image ID="Image1" runat="server" src="./assets/imgs/profile/status-7.jpg" alt="Profile Image" />
                                </div>
                                <p class="username">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("postBy") %>'></asp:Label>
                                </p>
                            </div>
                            <img src="./assets/imgs/nav-items/option.PNG" class="options" alt="Options" />
                        </div>
                        <div class="post-image-container">
                            <asp:Image ID="Image2" runat="server" ImageUrl='./assets/imgs/heart.png' class="post-image" alt="Geeks for Geeks post" />
                        </div>
                        <div class="post-content">
                            <div class="reaction-wrapper">
                                <asp:LinkButton ID="LinkButton1" runat="server" >
                                    <img src="./assets/imgs/nav-items/like.PNG" class="icons" />
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
                            <p>
                                <b>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("likeCounts").ToString() != "" ? "Liked by " +Eval("likeCounts") : "" %>'></asp:Label>
                                </b>
                            </p>
                            <p class="description">
                                <asp:Label ID="Label4" runat="server" style="font-weight:bolder;" Text='<%#Eval("postBy") %>'></asp:Label>
                                &nbsp;
                                <asp:TextBox ID="PostContent_TextBox" runat="server" class="post-content-textbox" Text='<%# Eval("postContent") %>'></asp:TextBox>
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
          </div>
      <div class="right-col">
        <div class="profile-card underliner">
          <div class="status-pic">
            <img src="./assets/imgs/nav-items/user.png" />
          </div>
          <div>

              <asp:Label ID="Label8" runat="server" Text="" class="pro-user"></asp:Label>
            
              <asp:Label ID="Label9" runat="server" Text="" class="sub-text"></asp:Label>
          </div>

        </div>
        <div class="profile-card">
          <div>
            <p class="suggestion-text">You can do the following..</p>
          </div>
          <div class="action-div">
            <button class="seeall-btn" HIDDEN>See All</button>
          </div>
        </div>
          <asp:Panel ID="Panel1" runat="server" Visible="false" >
                        <div class="profile-card"  >
              
              <div hidden aria-disabled>
                 <p class="pro-user">Edit Picture</p>
                 <p class="sug-text">Change the current picture to something new</p>
              </div >
                 <div class="action-div" hidden aria-disabled   >
                 <button class="action-btn">Upload</button>
               </div>
           </div>
        <div class="profile-card"> 
          <div>
            <p class="pro-user">Update Post</p>
            <p class="sug-text">Update the post contents as you like&nbsp;</p>
          </div>
            <div class="post-actions-div">
                <asp:Button ID="UpdatePost_Btn" runat="server" Text="Update" class="action-btn" />
            
          </div>
        </div>

        <div class="profile-card">
          
          <div>
            <p class="pro-user">Delete Post</p>
            <p class="sug-text">Don't want it anymore? Just delete it.&nbsp;</p>
          </div>
          <div class="post-actions-div">
              <asp:Button ID="DeletePost_Btn" runat="server" Text="Delete" class="action-btn" style="color:red; border-color:red; text-decoration:none" OnClick="DeletePost_Btn_Click" />
              
          </div>
        </div>
     
          </asp:Panel>

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
</asp:Content>

