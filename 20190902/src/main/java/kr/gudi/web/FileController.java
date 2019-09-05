package kr.gudi.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileController {

	@RequestMapping("/file")
	public String file() {
		return "file";
	}
	
}
