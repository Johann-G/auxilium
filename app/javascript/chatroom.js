const chatRoomScrollDown = () => {
    $("#chatroom-container").ready(function(){
        console.log("test");
        $("html,body").scrollTop($(document).height());
    });
}

export { chatRoomScrollDown };