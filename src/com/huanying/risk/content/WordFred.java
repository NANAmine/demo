package com.huanying.risk.content;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tika.exception.TikaException;

import com.huanying.risk.model.Article;
import com.huanying.risk.model.TextUtil;
import com.huanying.risk.model.WordFreq;

public class WordFred {

	//private static String root = "textdata/";
	/**
	 * 显示词频最高的若干项
	 */
	public List<String> wordfred(String txt) throws IOException, TikaException {
		List wordfred = new ArrayList<String>(); 
		File f=new File("aaa.txt");//向指定文本框内写入
	    FileWriter fw=new FileWriter(f);
	    fw.write(txt);
	    fw.close();
		Article article = TextUtil.getArticle(f);
		List<WordFreq> wfList = article.getWordFreqList();
		wordfred.add("0");
		// output top
		System.out.println("Top frequency words:");
		int score = 0;
		for (int i = 0; i < wfList.size(); ++i) {
			if(wfList.get(i).getWord().equals("和平")||wfList.get(i).getWord().equals("战争")||wfList.get(i).getWord().equals("冲突")||wfList.get(i).getWord().equals("武装")||wfList.get(i).getWord().equals("局势")) {
			wordfred.add(wfList.get(i));
			System.out.println(wfList.get(i).getFreq());
			score=wfList.get(i).getFreq() +score;
			}
		}
		score=score/10;
		if(score>5) {
			score=5;
		}
		wordfred.set(0, score);
		return wordfred;
	}

}
