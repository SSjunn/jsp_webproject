<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ⭐ 챗봇 모달 전체 영역 -->
<div id="chatModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
     background-color: rgba(0, 0, 0, 0.4); z-index: 1000;">

    <!-- ⭐ 챗봇 박스 -->
    <div class="chat-container">
        <span onclick="closeChat()" style="position: absolute; top: 10px; right: 20px; font-size: 20px; cursor: pointer;">&times;</span>
        <h2>가전제품 AI 상담</h2>
        <div class="chat-box" id="chatBox"></div>
        <div class="input-area">
            <input type="text" id="userInput" placeholder="가전제품에 대해 질문해주세요...">
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>
</div>

<!-- ⭐ 모달 열기 버튼 -->
<!-- <button onclick="openChat()" style="position: fixed; bottom: 20px; right: 20px; z-index: 9999;">상담하기</button> -->

<style>
    .chat-container {
        position: relative;
        width: 500px;
        max-width: 90%;
        height: 600px;
        margin: 5% auto;
        background-color: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        display: flex;
        flex-direction: column;
    }
    .chat-box {
        flex: 1;
        overflow-y: auto;
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
    }
    .input-area {
        display: flex;
        gap: 10px;
    }
    input[type="text"] {
        flex: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
    .message {
        margin: 10px 0;
        padding: 10px;
        border-radius: 5px;
        word-wrap: break-word;
    }
    .user-message {
        background-color: #e3f2fd;
        margin-left: 20%;
    }
    .bot-message {
        background-color: #f5f5f5;
        margin-right: 20%;
    }
</style>

<script>
    function openChat() {
        document.getElementById('chatModal').style.display = 'block';
        setTimeout(() => {
            addMessage("모두의 전자 AI 상담사입니다!! 무엇을 도와드릴까요?", false);
        }, 200); // 약간의 딜레이로 자연스럽게
    }

    function closeChat() {
        document.getElementById('chatModal').style.display = 'none';
        document.getElementById('chatBox').innerHTML = ''; // 이전 메시지 삭제 (원하면 유지 가능)
    }

    function addMessage(message, isUser) {
        const chatBox = document.getElementById('chatBox');
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${isUser ? 'user-message' : 'bot-message'}`;
        messageDiv.textContent = message;
        chatBox.appendChild(messageDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    function sendMessage() {
        const userInput = document.getElementById('userInput');
        const message = userInput.value.trim();

        if (message) {
            addMessage(message, true);
            userInput.value = '';

            fetch('${pageContext.request.contextPath}/counsel/chat.jsp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'message=' + encodeURIComponent(message)
            })
            .then(response => response.text())
            .then(reply => {
                addMessage(reply, false);
            })
            .catch(error => {
                console.error('Error:', error);
                addMessage('죄송합니다. 오류가 발생했습니다.', false);
            });
        }
    }

    document.getElementById('userInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });
</script>
