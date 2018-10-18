package test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import com.huanying.risk.model.Article;
import com.huanying.risk.model.WordFreq;
import com.huanying.risk.model.TextUtil;

import org.apache.tika.exception.TikaException;
import org.junit.Test;


public class ProcessTest {

	private static String root = "textdata/";

	@Test
	/**
	 * 显示词频最高的若干项
	 */
	public void demo1() throws IOException, TikaException {
		File f=new File(root+"aaa.txt");//向指定文本框内写入
	    FileWriter fw=new FileWriter(f);
	    fw.write("11111维和是在冲突各方同意的前提下,联合国统一指挥部署军事、警察或文职人员，采用非强制性手段，控制和解决争端，进而实现可持续和平的一项特殊举措。联合国维和行动帮助遭受冲突的国家创造实现持久和平的条件。\r\n" + 
	    		"        自1948年以来的六十多年里，联合国部署了 71项维和行动，130多个国家派员参加，参与人员累计百万之多。\r\n" + 
	    		"        维和行动是联合国用来帮助所在国克服艰难险阻，从冲突走向和平的最有效手段之一。\r\n" + 
	    		"        维和行动有很多独特优势，包括合法、共担负担、能够在全球范围部署和维持军队及警察，使他们与文职维持和平人员协调配合，以推进多层面任务的执行。 　　	        联合国维持和平人员提供安全和政治与建设和平方面的支助，以帮助各国克服困难，尽早从冲突转向和平。\r\n" + 
	    		"        联合国维和行动遵循三项基本原则：\r\n" + 
	    		"        •	各方同意；\r\n" + 
	    		"        •	公正；\r\n" + 
	    		"        •	除非出于自卫和捍卫职责，不得使用武力。\r\n" + 
	    		"        维和行动灵活多变，过去二十年间，采取了多种配置形式实施部署。目前，总共在四个大陆上部署了15个联合国维持和平行动。\r\n" + 
	    		"        今天，需要开展多层面的维持和平行动，不仅为了维持和平与安全，也为了推进政治进程、保护平民、协助前战斗人员解除武装、复员和重返社会；支持组织选举、保护和促进人权以及协助恢复法治。\r\n" + 
	    		"        就本身而言，联合国维和行动几乎总是发生在自然和政治条件最为恶劣的环境中，所以永远无法确保成功。但事实证明，在我们成立的60年里颇有建树，并荣获诺贝尔和平奖。");
	    fw.close();
		Article article = TextUtil.getArticle(f);
		List<WordFreq> wfList = article.getWordFreqList();
		// output top
		System.out.println("Top frequency words:");
		for (int i = 0; i < wfList.size(); ++i) {
			if(wfList.get(i).getWord().equals("和平")||wfList.get(i).getWord().equals("战争")||wfList.get(i).getWord().equals("冲突")) {
			System.out.println(wfList.get(i));
			}
		}
	}

}
