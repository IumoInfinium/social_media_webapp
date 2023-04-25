<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="./assets/css/profile.css"/>
        <link rel="stylesheet" href="./assets/csss/styles.css" />
        <link rel="shortcut icon" href="./assets/imgs/instagram.png" type="image/x-icon" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="profile">
        <div class="profile-photo">
            <img src="./assets/imgs/profile-photo.png" alt="">
        </div>

        <section class="profile-user">
            <div class="settings">

                <asp:Label ID="Label1" runat="server" Text="<unknown>" class="user-name"></asp:Label>


                
                <asp:Button ID="Button1" runat="server" Text="Edit" class="edit-button" OnClick="Button1_Click" />

                <asp:Button ID="ProfileFollow_Button" runat="server" Text="Follow" class="follow-button" CommandName="follow" OnClick="ProfileFollow_Button_Click" />
                
                

              
                
                

<%--                    <asp:LinkButton ID="LinkButton1" runat="server" class="settings-button">
                        <img src="./assets/imgs/setting.png"  class="setting-button-img "alt="">    
                </asp:LinkButton>--%>    
            </div>
            <br />
            
            <div class="posts-followers-following">
                <ul>
                    <li>
                        <asp:Label ID="Label2" runat="server" Text=""  class="bold"></asp:Label>
                        posts</li>
                    <li>
                        <asp:Label ID="Label3" runat="server" Text=""  class="bold"></asp:Label>
                        followers</li>
                    <li>
                        <asp:Label ID="Label4" runat="server" Text=""  class="bold"></asp:Label>
                        following</li>
                </ul>
            </div>
           <br />
            <div class="name">
                <div class="user-info">
                    
                    <asp:TextBox ID="TextBox1" runat="server"  class="user-profile-info" Text=""  disabled></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" class="user-profile-info" Text="" disabled></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" class="user-profile-info" Text="" disabled></asp:TextBox>
                
                    <asp:TextBox ID="TextBox4" runat="server" class="user-profile-info" Text="" disabled></asp:TextBox>
                </div>
            </div>
         
        </section>
    </section>

    <!--Main-->
    <main>
        <section class="options">
            <ul>
                <li>Posts</li>
                <li>Reels</li>
                <li>Videos</li>
                <li>Saved</li>
                <li>Tagged</li>
            </ul>
        </section>

        <section class="feed">
            <ul style="list-style-type:none">
                <asp:Repeater ID ="r1" runat ="server">
                    <ItemTemplate>
                        <li>
                            <div class="user-profile-feed">
                                <asp:Image  ID="Image1" runat="server" ImageUrl='<%# Eval("postURL") %>' alt="" /> 
                                <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="GoToPost" CommandName="gotopost" CommandArgument='<%# Eval("postid") %>'>Go to Post</asp:LinkButton>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                
            </ul>
        </section>
    </main>
</asp:Content>

