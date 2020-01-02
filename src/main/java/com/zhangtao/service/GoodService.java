
package com.zhangtao.service;

import java.util.List;
import java.util.Map;

import com.zhangtao.bean.Brand;
import com.zhangtao.bean.Goods;
import com.zhangtao.bean.Kind;

public interface GoodService {
	List<Goods> queryAllByItem(Map<String, Object> map);

	int addGoods(Goods goods);

	Goods selectOne(int gid);

	int updGoods(Goods goods);

	int dels(String gid);

	List<Kind> selectKind();

	List<Brand> selectBrand();
}
