package com.platform.common.service;


import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;

public interface IBaseDao<T, ID extends Serializable> {

	 
	void save(T t);
	 
	void saveOrUpdate(T t);
	 
	boolean contains(T t);
	 
	void delete(T t);
	 
	boolean deleteById(ID Id);
	 
	void deleteAll(Collection<T> entities);
	 
	int excuteHql(String hqlString);
	 
	int excuteHql(String hqlString, Map<String, ?> params);
	 
	int excuteSql(String sqlString);
	 
	int excuteSql(String sqlString, Map<String, ?> params);
	
	T load(ID id);
	 
	T get(ID id);
	 
	T getByHQL(String hqlString, Map<String, ?> params);
	
	<V> V getByHQL(String hqlString, Map<String, ?> params, Class<V> theClass);
	
	T getBySQL(String sqlString, Map<String, ?> params);
	
	<V> V getBySQL(String sqlString, Map<String, ?> params, Class<V> theClass);
	 
	List<T> listByHQL(String hqlString);
	
	<V> List<V> listByHQL(String hqlString, Class<V> theClass);
	 
	List<T> listByHQL(String hqlString, Map<String, ?> params);
	
	<V> List<V> listByHQL(String hqlString, Map<String, ?> params, Class<V> theClass);
	 
	List<T> listByHQL(String hqlString, int firstResult, int maxResult);
	
	<V> List<V> listByHQL(String hqlString, int firstResult, int maxResult, Class<V> theClass);
	 
	List<T> listByHQL(String hqlString, Map<String, ?> params, int firstResult, int maxResult);
	
	<V> List<V> listByHQL(String hqlString, Map<String, ?> params, int firstResult, int maxResult, Class<V> theClass);
	 
	List<T> listBySQL(String sqlString);
	
	<V> List<V> listBySQL(String sqlString, Class<V> theClass);
	 
	List<T> listBySQL(String sqlString, Map<String, ?> params);
	
	<V> List<V> listBySQL(String sqlString, Map<String, ?> params, Class<V> theClass);
	 
	void refresh(T t);
	
	void update(T t);
	
	default Query<?> setParameterToQuery(Query<?> query, Map<String, ?> params) {
		if (params != null) {
		    params.forEach((key, value) -> {
				if (value instanceof Object[]) {
					query.setParameterList(key, (Object[]) value);
				} else if (value instanceof Collection<?>) {
					query.setParameterList(key, (Collection<?>) value);
				} else {
					query.setParameter(key, params.get(key));
			   }
		    });
		 }
         return query;
		}


	int getCount(Class t);

    int getCountByHqlCondition(String hql);
    
    int getCountByHqlCondition(String hqlString,Map<String, ?> params);
    
    
    public List   listByHQLOtherCondition(String hqlString, Map<String, ?> params, int firstResult,int maxResult) ;
}
