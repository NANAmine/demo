package com.huanying.risk.demo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;
import com.huanying.risk.content.Content;
import com.huanying.risk.content.ContentService;
import com.huanying.risk.content.Province;
import com.huanying.risk.content.WordFred;
import com.huanying.risk.keyword.KeyWord;
import com.huanying.risk.point.PointService;
import com.huanying.risk.point.Risk_Point;

@Controller
public class ShowController extends BaseController {
	
	@Autowired
	private ContentService contentService;
	@Autowired
	private PointService pointService;
	
	@RequestMapping("/show_keyword_list.do")
	public String show_keyword_list(Model model) throws Exception {
		return "demo/keyword";
	}
	
	@RequestMapping("/show_netdata_list.do")
	public String show_netdata_list(Model model) throws Exception {
		return "demo/netdata";
	}
	
	@RequestMapping("/show_video.do")
	public String show_video(String content_id,Model model) throws Exception {
		//获得content id 在upfife表中根据content id和type进行查找，找出对应视频
		////写完描述，点击保存，把数据更新到content表中
		//点击获取图片，调用Javacv，图片写入文件夹，路径生成到content表，type=4
		
		/*String id1="1";
		Creatimg creat = null;
		String fileName = id1+"_"+System.currentTimeMillis();
		creat.startgetpic(id1,fileName,"dsd");*/
		int id=Integer.valueOf(content_id);
		Map m = new HashMap();
		m.put("content_id", id);
		m.put("type", 3);
		PageBean pageBean = contentService.searchFile(m, 100, 1);
		List video_list = pageBean.getList();
		model.addAttribute("video_list",video_list);
		model.addAttribute("id",id);
		m.put("content_id",Integer.valueOf(id));
		m.put("type",4);
		pageBean = contentService.searchFile(m, 100, 1);
		List image_list = pageBean.getList();
		//map.put("image_list",image_list);
		System.out.println(image_list);
		model.addAttribute("image_list",image_list);
		Content content = new Content();
		content=contentService.getbyId(id);
		model.addAttribute("video_content",content.getVideo_description());
		return "demo/video";
	}
	
	@RequestMapping("/show_image.do")
	public String show_image(String content_id, Model model) throws Exception {
		//model.addAttribute("id", 1);
		
		//获得content id 在upfife表中根据content id和type进行查找，找出对应图片进行显示
		//写完描述，点击保存，把数据更新到content表中
		//Upload_File f=new Upload_File();
		//Upload_File uploadfile=contentService.getFilebyId(id);
		//Upload_File filelist[]=null;
		//List<Upload_File> filelist;
		//model.addAttribute("pic", filelist);
		//contentService.getFilepic(id);
		int id=Integer.valueOf(content_id);;
		Map m = new HashMap();
		m.put("content_id", id);
		m.put("type", 1);
		PageBean pageBean = contentService.searchFile(m, 100, 1);
		List image_list = pageBean.getList();
		model.addAttribute("image_list",image_list);
		for(int i=0;i<image_list.size();i++){
			System.out.println(image_list.get(i));
		}
		model.addAttribute("id",id);
		//System.out.println(image_list);
		//循环保存
		//content=contentService.getbyId(id);
		//content.setDescription("");
		//contentService.update(content);
		Content content = new Content();
		content=contentService.getbyId(id);
		model.addAttribute("image_content",content.getImage_description());
		return "demo/image";
	}


	@RequestMapping("/show_word.do")
	public String show_content(String content_id,Model model) throws Exception {
		int id=Integer.valueOf(content_id);;
		Map m = new HashMap();
		m.put("content_id", id);
		PageBean pageBean = contentService.searchContent(m, 1, 1);
		m.put("type", 1);
		pageBean = contentService.searchFile(m, 100, 1);
		List image_list = pageBean.getList();
		model.addAttribute("image_list",image_list);
		m.put("type", 2);
		pageBean = contentService.searchFile(m, 100, 1);
		List file_list = pageBean.getList();
		model.addAttribute("file_list",file_list);
		m.put("type", 3);
		pageBean = contentService.searchFile(m, 100, 1);
		List video_list = pageBean.getList();
		model.addAttribute("video_list",video_list);
		//关键字
		/*m.put("type", 3);
		pageBean = contentService.searchKeyword(m, 100, 1);
		List keyword_list = pageBean.getList();
		model.addAttribute("WordFreq_list",keyword_list);
		for (Object keyword : keyword_list) {
			System.out.println(keyword);
		}*/
		Content content = new Content();
		content=contentService.getbyId(Integer.valueOf(content_id));
		model.addAttribute("content",content);
		WordFred wordFred = new WordFred();
		model.addAttribute("WordFreq_list",wordFred.wordfred(content.getImage_description()+content.getDescription()+content.getVideo_description()));
		return "demo/word";
	}
	
	@RequestMapping("/show_setup.do")
	public String show_setup(Model model) throws Exception {
		return "demo/setup";
	}

}
