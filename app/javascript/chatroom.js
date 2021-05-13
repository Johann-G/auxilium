const chatRoomScrollDown = () => {
    $("#chatroom-container").ready(function(){
        $("html,body").scrollTop($(document).height());
    });
}

export { chatRoomScrollDown };