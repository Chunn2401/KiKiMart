package com.poly.main.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.main.Model.Item;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	public static Map<Integer, Item> map = new HashMap<>();

	@Override
	public void add(Integer id, Item entity) {
		// TODO Auto-generated method stub
		if (map.get(id) != null) {
			this.update(id, entity.getQuality() + 1);
		}
		else {
			map.put(id, entity);
		}	
	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub
		map.remove(id);
	}

	@Override
	public void update(Integer id, int qty) {
		// TODO Auto-generated method stub
		map.get(id).setQuality(qty);
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		// TODO Auto-generated method stub
		return map.values();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		int count = 0;
		Set<Integer> set = map.keySet();
		for (Integer i : set) {
			count++;
		}
		return count;
	}

	@Override
	public double getAmount() {
		// TODO Auto-generated method stub
		double amount = 0;
		Set<Integer> set = map.keySet();
		for (Integer i : set) {
			amount += map.get(i).getPrice();
		}
		return amount;
	}

}
