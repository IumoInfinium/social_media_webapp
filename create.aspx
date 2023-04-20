<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="create"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .center {
            margin-left:auto;
            margin-right : auto;
        }
        .post-btn {
            background-color: #79a5ff;
           color: white;
           margin:10px;
           font-size:1em;
           padding : .5em;
           border-radius: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
        <div class="wrapper">
            <div class="left-col">
                <div class="post">
                  <div class="info">
                    <div class="user">
                      <div class="status-pic">
                        <img src="./assets/imgs/profile/status-8.jpg" alt="Profile Image" />
                      </div>
                        <asp:Label ID="Label1" runat="server" Text=''  class="username"></asp:Label>
                        
                    </div>
                    <img src="./assets/imgs/nav-items/option.PNG" class="options" alt="Options" />
                  </div>
                  
                    <asp:Image ID="Image1" runat="server" ImageUrl="./assets/imgs/post/post-3.jpg" class="post-image" />
                  <div class="post-content">
                    <div class="reaction-wrapper">
                      <img src="./assets/imgs/nav-items/like.PNG" class="icons" />
                      <img src="./assets/imgs/nav-items/comment.PNG" class="icons" />
                      <img src="./assets/imgs/nav-items/send.PNG" class="icons" />
                      <img src="./assets/imgs/nav-items/save.PNG" class="save icons" />
                    </div>
                    <p class="likes">0 likes</p>
                    <p class="description">
                        <b><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></b>
                        &nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" class="post-caption" Text ="Caption here....."></asp:TextBox>
                    </p>
                    <%--<p class="no-comments">View all 45 comments</p>--%>
                    <p class="post-time">Now</p>
                  </div>
                  <div class="comment-wrapper">
                    <img src="./assets/imgs/nav-items/smile.PNG" class="icons" />
                    <input type="text" class="comment-box" placeholder="Add a comment..." />
                    <button class="comment-btn">Post</button>
                  </div>
                </div>
            </div>
            <div class="right-col">
        <div class="profile-card">
          <div class="status-pic">
            <img src="./assets/imgs/nav-items/user.png" />
          </div>
          <div>
                <asp:Label ID="Label4" runat="server" Text="" class="pro-user"></asp:Label>

                <asp:Label ID="Label5" runat="server" Text="" class="sub-text"></asp:Label>

          </div>
          <div class="action-div ">
            
              <asp:Button  ID="Post_Btn" runat="server" class="action-btn post-btn" Text="POST" OnClick="Post_Btn_Click"/>
              
          </div>
           
        </div>
                <div class="post-options">
                    <div class="post-file-upload">
                        
                            
                        <asp:FileUpload ID="FileUpload1" runat="server" type="file" name="oFile" class="post-file-upload-btn"/>
                       
                    </div>
                    <div class="post-upload-btn">
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile_Btn_Click" />

<%--                        <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                            <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                        </asp:Panel>--%>
                    </div>
                </div>

                
                

        <div class="quick-links-wrapper center" style="padding-top:10px; justify-content:center;">
          <div class="quick-link">@ 2032 INSTAGRAM | META</div>
        </div>
      </div>
        </div>
    </div>
</asp:Content>

