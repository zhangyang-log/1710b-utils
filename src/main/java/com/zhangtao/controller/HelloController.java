package com.zhangtao.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangtao.bean.Brand;
import com.zhangtao.bean.Goods;
import com.zhangtao.bean.Kind;
import com.zhangtao.service.GoodService;

@Controller
public class HelloController {
	@Resource
	private GoodService goodService;

	@RequestMapping("queryAll")
	public String queryAll(@RequestParam(defaultValue = "1") int pageNum, String gname, Model model) {
		PageHelper.startPage(pageNum, 3);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gname", gname);
		List<Goods> list = goodService.queryAllByItem(map);
		PageInfo<Goods> info = new PageInfo<Goods>(list);
		model.addAttribute("info", info);
		model.addAttribute("gname", gname);
		return "list";
	}

	@RequestMapping("dels")
	public String dels(String gid) {
		goodService.dels(gid);
		return "forward:queryAll";
	}

	@RequestMapping("selectKind")
	@ResponseBody
	public List<Kind> selectKind() {
		return goodService.selectKind();
	}

	@RequestMapping("selectBrand")
	@ResponseBody
	public List<Brand> selectBrand() {
		return goodService.selectBrand();
	}

	@RequestMapping("add")
	@ResponseBody
	public Integer add(Goods goods) throws Exception {
		return goodService.addGoods(goods);
	}

	@RequestMapping("update")
	@ResponseBody
	public Integer update(Goods goods) {
		return goodService.updGoods(goods);
	}

	@RequestMapping("selectOne")
	public String selectOne(int gid, Model model) {
		Goods goods = goodService.selectOne(gid);
		model.addAttribute("goods", goods);
		return "selectOne";
	}

	@RequestMapping("selectOne1")
	@ResponseBody
	public Goods selectOne1(int gid) {
		return goodService.selectOne(gid);
	}
}
