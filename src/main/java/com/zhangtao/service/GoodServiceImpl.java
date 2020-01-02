package com.zhangtao.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhangtao.bean.Brand;
import com.zhangtao.bean.Goods;
import com.zhangtao.bean.Kind;
import com.zhangtao.mapper.GoodsMapper;

@Service
public class GoodServiceImpl implements GoodService {

	@Resource
	private GoodsMapper goodsMapper;

	public List<Goods> queryAllByItem(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsMapper.queryAllByItem(map);
	}

	public int addGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.addGoods(goods);
	}

	public Goods selectOne(int gid) {
		// TODO Auto-generated method stub
		return goodsMapper.selectOne(gid);
	}

	public int updGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.updGoods(goods);
	}

	public int dels(String gid) {
		// TODO Auto-generated method stub
		return goodsMapper.dels(gid);
	}

	public List<Kind> selectKind() {
		// TODO Auto-generated method stub
		return goodsMapper.selectKind();
	}

	public List<Brand> selectBrand() {
		// TODO Auto-generated method stub
		return goodsMapper.selectBrand();
	}

}
