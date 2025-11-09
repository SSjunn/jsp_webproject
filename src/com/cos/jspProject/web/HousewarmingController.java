package com.cos.jspProject.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.google.gson.Gson;

import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingList4RespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingListRespDto;
import com.cos.jspProject.domain.housewarming_board.dto.HousewarmingUploadReqDto;
import com.cos.jspProject.domain.photo_board.dto.CommonRespDto;
import com.cos.jspProject.domain.reply.Reply;
import com.cos.jspProject.domain.user.User;
import com.cos.jspProject.service.HousewarmingBoardService;
import com.cos.jspProject.service.ReplyService;
import com.cos.jspProject.util.Script;

@WebServlet("/housewarming")
public class HousewarmingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HousewarmingController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		HttpSession session = request.getSession();
		HousewarmingBoardService service = new HousewarmingBoardService();
		ReplyService replyService = new ReplyService();

		if (cmd.equals("upload")) {
			String saveFolder = "C:/works/Webproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/JSP-ProJect/uploads";
			String encType = "UTF-8";
			int maxSize = 5 * 1024 * 1024;

			try {
				MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType,
						new DefaultFileRenamePolicy());

				// ✔ 정확한 name 키 기록된 파라미터 값을 리턴
				int userId_value = Integer.parseInt(multi.getParameter("userId"));
				String title_value = multi.getParameter("title");
				String content_value = multi.getParameter("content");
				String filename = multi.getFilesystemName("photo");

				HousewarmingUploadReqDto dto = new HousewarmingUploadReqDto();
				dto.setUserId(userId_value);
				dto.setTitle(title_value);
				dto.setContent(content_value);
				dto.setPhotoImage(filename);

				int result = service.게시글업로드(dto);
				if (result == 1) {
					response.sendRedirect("index.jsp");
				} else {
					Script.back(response, "게시구역 업로드 실패");
				}
			} catch (IOException ioe) {
				ioe.printStackTrace();
				Script.back(response, "업로드 중 예외 발생");
			}

		} else if (cmd.equals("uploadForm")) {
			User principal = (User) session.getAttribute("principal");
			if (principal != null) {
				response.sendRedirect("housewarming/housewarmingUpload.jsp");
			} else {
				response.sendRedirect("user/loginForm.jsp");
			}

		} else if (cmd.equals("list")) {
			List<HousewarmingListRespDto> boards = service.게시글목록보기();
			request.setAttribute("boards", boards);
			RequestDispatcher dis = request.getRequestDispatcher("housewarming/housewarmingList.jsp");
			dis.forward(request, response);

		} else if (cmd.equals("detail")) {
			int id = Integer.parseInt(request.getParameter("id"));
			HousewarmingListRespDto dto = service.게시글상세보기(id);
			List<Reply> replys = replyService.h_글목록보기(id);

			if (dto == null) {
				Script.back(response, "상세보기에 실패했습니다.");
			} else {
				request.setAttribute("dto", dto);
				request.setAttribute("replys", replys);
				RequestDispatcher dis = request.getRequestDispatcher("housewarming/housewarmingDetail.jsp");
				dis.forward(request, response);
			}

		} else if (cmd.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			int result = service.게시글삭제(id);

			CommonRespDto<String> commonRespDto = new CommonRespDto<>();
			commonRespDto.setStatusCode(result);
			commonRespDto.setData("성공");

			Gson gson = new Gson();
			String respData = gson.toJson(commonRespDto);
			PrintWriter out = response.getWriter();
			out.print(respData);
			out.flush();

		} else if (cmd.equals("index")) {
			List<HousewarmingList4RespDto> boards = service.최근글4개보기();
			request.setAttribute("boards", boards);
			

			RequestDispatcher dis = request.getRequestDispatcher("index2.jsp");
			dis.forward(request, response);
		}
	}
}
