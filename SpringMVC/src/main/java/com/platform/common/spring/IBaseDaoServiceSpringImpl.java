package com.platform.common.spring;


import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import com.platform.common.service.IBaseDao;
public   class IBaseDaoServiceSpringImpl <T, ID extends Serializable>  implements IBaseDao<T, ID>{
    @Autowired
	protected SessionFactory sessionFactory;
	 
	@SuppressWarnings("unchecked")
	private Class<T> theClass = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void save(T t) {
		this.getSession().save(t);
	}
	 
	@Override
	public void saveOrUpdate(T t) {
		this.getSession().saveOrUpdate(t);
	}
	 
	@Override
	public boolean contains(T t) {
	  return this.getSession().contains(t);
    }
	 
	@Override
	public void delete(T t) {
	   this.getSession().delete(t);
	}
	 
     @Override
	public boolean deleteById(ID Id) {
    	 T t = this.get(Id);
    	 if (t == null) return false;
    	 this.delete(t);
    	 return true;
     }
	 
	@Override
	public void deleteAll(Collection<T> entities) {
			Session session = this.getSession();
			for(T entity:entities) {
				session.delete(entities);
			}
	}
	 
	@Override
	public int excuteHql(String hqlString) {
	   return this.getSession().createQuery(hqlString).executeUpdate();
	}
	
	@Override
	public int excuteHql(String hqlString, Map<String, ?> params) {
	   return this.setParameterToQuery(this.getSession().createQuery(hqlString), params).executeUpdate();
	}
	 
	@Override
	public int excuteSql(String sqlString) {
	    return this.getSession().createNativeQuery(sqlString).executeUpdate();
	}
	
	@Override
	public int excuteSql(String sqlString, Map<String, ?> params) {
		return this.setParameterToQuery(this.getSession().createNativeQuery(sqlString), params).executeUpdate();
	}
	
	@Override
	public T load(ID id) {
	  return this.getSession().load(theClass, id);
	}
	 
	@Override
	public T get(ID id) {
	  return this.getSession().get(theClass, id);
    }
	 
	@Override
	public T getByHQL(String hqlString, Map<String, ?> params) {
	   Query<T> query = this.getSession().createQuery(hqlString, theClass);
	   this.setParameterToQuery(query, params);
	   return query.uniqueResult();
	}
	
	@Override
	public <V> V getByHQL(String hqlString, Map<String, ?> params, Class<V> theClass) {
		Query<V> query = this.getSession().createQuery(hqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.uniqueResult();
	}
	 
	@Override
	public T getBySQL(String sqlString, Map<String, ?> params) {
		NativeQuery<T> query = this.getSession().createNativeQuery(sqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.uniqueResult();
    }

	@Override
	public <V> V getBySQL(String sqlString, Map<String, ?> params, Class<V> theClass) {
		NativeQuery<V> query = this.getSession().createNativeQuery(sqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.uniqueResult();
	}
	 
	@Override
	public List<T> listByHQL(String hqlString) {
		return this.getSession().createQuery(hqlString, theClass).list();
	}
	
	@Override
	public <V> List<V> listByHQL(String hqlString, Class<V> theClass) {
		return this.getSession().createQuery(hqlString, theClass).list();
	}
	 
	@Override
	public List<T> listByHQL(String hqlString, Map<String, ?> params) {
		Query<T> query = this.getSession().createQuery(hqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.list();
	}
	
	@Override
	public <V> List<V> listByHQL(String hqlString, Map<String, ?> params, Class<V> theClass) {
		Query<V> query = this.getSession().createQuery(hqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.list();
	}
	 
	@Override
	public List<T> listByHQL(String hqlString, int firstResult, int maxResult) {
		Query<T> query = this.getSession().createQuery(hqlString, theClass);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		return query.list();
	}

	@Override
	public <V> List<V> listByHQL(String hqlString, int firstResult, int maxResult, Class<V> theClass) {
		Query<V> query = this.getSession().createQuery(hqlString, theClass);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		return query.list();
	}
	 
	@Override
	public List<T> listByHQL(String hqlString, Map<String, ?> params, int firstResult,int maxResult) {
		Query<T> query = this.getSession().createQuery(hqlString, theClass);
		this.setParameterToQuery(query, params);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		return query.list();
	}
	
	@Override
	public <V> List<V> listByHQL(String hqlString, Map<String, ?> params, int firstResult, int maxResult,Class<V> theClass) {
		Query<V> query = this.getSession().createQuery(hqlString, theClass);
		this.setParameterToQuery(query, params);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		return query.list();
	}
	 
	@Override
	public List<T> listBySQL(String sqlString) {
		return this.getSession().createNativeQuery(sqlString, theClass).list();
	}

	@Override
	public <V> List<V> listBySQL(String sqlString, Class<V> theClass) {
		return this.getSession().createNativeQuery(sqlString, theClass).list();
	}
	 
	@Override
	public List<T> listBySQL(String sqlString, Map<String, ?> params) {
		NativeQuery<T> query = this.getSession().createNativeQuery(sqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.list();
	}

	@Override
	public <V> List<V> listBySQL(String sqlString, Map<String, ?> params, Class<V> theClass) {
		NativeQuery<V> query = this.getSession().createNativeQuery(sqlString, theClass);
		this.setParameterToQuery(query, params);
		return query.list();
	}
	 
	@Override
	public void refresh(T t) {
      this.getSession().refresh(t);
	}
	
	@Override
	public int getCount(Class t) {
      return this.getSession().createNativeQuery("from "+ t.getName()).list().size();
	}
	@Override 
	public int getCountByHqlCondition(String hql) {
	      return ((Long) this.getSession().createQuery(hql).list().get(0)).intValue();
    }
	
	@Override 
	public int getCountByHqlCondition(String hqlString,Map<String, ?> params) {
		Query query = this.getSession().createQuery("select count(*) from "+theClass.getName()+" where 1=1 "+hqlString);
		this.setParameterToQuery(query, params);
		return ((Long)query.list().get(0)).intValue();
    }
	
	public <V> int getCountByHqlOtherCondition(Class<V> theClass,String hqlString,Map<String, ?> params) {
		Query<V> query = this.getSession().createQuery("select count(*) from "+theClass.getName()+" where 1=1 "+hqlString);
		this.setParameterToQuery(query, params);
		return ((Long)query.list().get(0)).intValue();
    }
	 
	
	
	@Override
	public void update(T t) {
		this.getSession().update(t);
    }
	 
	public SessionFactory getSessionFactory() {
			return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
